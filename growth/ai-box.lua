-- "Use this book with your AI assistant" box (growth experiment E3; see
-- research-methods-mcp/docs/BOOK-EXPERIMENTS.md), appended to the end of every HTML
-- page of the book, home page included. Written into the static HTML at render time,
-- so readers without JavaScript and crawlers see it. PDF and EPUB are untouched.
--
-- The endpoint carries ?src=book-advanced-data-analysis so the server counts the
-- connections that come from this book. Styles live in growth/ai-box.css.
--
-- The box is a <div>, not an <aside>: Quarto moves <aside> into the right margin.

local MCP_SITE = "https://research-methods-mcp.vercel.app/"
local ENDPOINT = MCP_SITE .. "mcp?src=book-advanced-data-analysis"

-- Same button images and link format as research-methods-mcp/README.md, with this
-- book's endpoint. Cursor: base64 of {"url":"<endpoint>"} ("=" as %3D); VS Code:
-- percent-encoded {"type":"http","url":"<endpoint>"}. "&amp;" because these go into
-- HTML attributes.
local CURSOR_INSTALL = "https://cursor.com/en/install-mcp?name=research-methods&amp;config="
  .. "eyJ1cmwiOiJodHRwczovL3Jlc2VhcmNoLW1ldGhvZHMtbWNwLnZlcmNlbC5hcHAvbWNwP3NyYz1ib29rLWFkdmFuY2VkLWRhdGEtYW5hbHlzaXMifQ%3D%3D"
local VSCODE_INSTALL = "https://insiders.vscode.dev/redirect/mcp/install?name=research-methods&amp;config="
  .. "%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fresearch-methods-mcp.vercel.app"
  .. "%2Fmcp%3Fsrc%3Dbook-advanced-data-analysis%22%7D"

local function ai_box()
  return table.concat({
    '<div class="ada-ai-box" role="complementary" aria-label="Use this book with your AI assistant">',
    '<p class="ada-ai-title">Use this book with your AI assistant</p>',
    '<p>Ask questions about this book in Claude, Cursor, VS Code, or ChatGPT, with answers that cite the section.</p>',
    '<p class="ada-ai-endpoint"><code>' .. ENDPOINT .. '</code> ',
    '<button type="button" class="ada-ai-copy" data-copy="' .. ENDPOINT .. '" aria-label="Copy the endpoint">Copy</button></p>',
    '<p class="ada-ai-install">',
    '<a href="' .. CURSOR_INSTALL .. '"><img src="https://cursor.com/deeplink/mcp-install-dark.svg" alt="Add to Cursor" height="24" loading="lazy"></a> ',
    '<a href="' .. VSCODE_INSTALL .. '"><img src="https://img.shields.io/badge/VS_Code-Install_server-0098FF?logo=visualstudiocode&amp;logoColor=white" alt="Install in VS Code" height="20" loading="lazy"></a> ',
    '<a href="' .. MCP_SITE .. '">Setup for other assistants</a></p>',
    '<script>document.currentScript.parentNode.querySelector(".ada-ai-copy").addEventListener("click",function(e){',
    'var b=e.currentTarget;if(!navigator.clipboard)return;navigator.clipboard.writeText(b.dataset.copy).then(function(){',
    'b.textContent="Copied";setTimeout(function(){b.textContent="Copy"},1500)})});</script>',
    '</div>',
  }, "\n")
end

-- citeproc appends a chapter's reference list after the last block unless the page
-- already holds a #refs div; give it one first, so the box comes after the references.
local function has_refs(blocks)
  local found = false
  pandoc.walk_block(pandoc.Div(blocks), {
    Div = function(d) if d.identifier == "refs" then found = true end end,
  })
  return found
end

function Pandoc(doc)
  if not quarto.doc.is_format("html") then return nil end
  if not has_refs(doc.blocks) then
    doc.blocks:insert(pandoc.Div({}, pandoc.Attr("refs")))
  end
  doc.blocks:insert(pandoc.RawBlock("html", ai_box()))
  return doc
end
