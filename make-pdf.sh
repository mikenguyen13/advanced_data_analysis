#!/usr/bin/env bash
# Build a single full-book PDF from the print-profile HTML (no R execution needed).
#
# Usage:
#   quarto render --profile print     # build _print/ from the freeze cache
#   bash make-pdf.sh                  # -> advanced-data-analysis.pdf
#
# Math (MathJax) prints fine directly. Mermaid renders lazily via JS, which
# headless --print-to-pdf captures too early, so for any chapter containing a
# Mermaid block we first dump the post-JS DOM (diagram baked to SVG) and print that.
set -u
ROOT="C:/Users/miken/github/advanced_data_analysis"
PRINT="$ROOT/_print"
OUT="$ROOT/advanced-data-analysis.pdf"
TMP="$ROOT/.pdfparts"
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"

rm -rf "$TMP"; mkdir -p "$TMP"
mapfile -t qmds < <(grep -oE '[A-Za-z0-9_-]+\.qmd' "$ROOT/_quarto.yml")

i=0; parts=()
for q in "${qmds[@]}"; do
  base="${q%.qmd}"; html="$PRINT/$base.html"
  [ -f "$html" ] || { echo "MISSING $html"; continue; }
  i=$((i+1)); pdf=$(printf "%s/%03d.pdf" "$TMP" "$i")

  if grep -q '<pre class="mermaid' "$html"; then
    # Bake Mermaid (and MathJax) by dumping the rendered DOM, then print the static copy.
    rendered="$PRINT/$base.rendered.html"
    "$CHROME" --headless=new --disable-gpu --virtual-time-budget=40000 \
      --run-all-compositor-stages-before-draw --dump-dom "file:///$html" > "$rendered" 2>/dev/null
    src="file:///$rendered"
  else
    src="file:///$html"
  fi

  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --virtual-time-budget=12000 --run-all-compositor-stages-before-draw \
    --print-to-pdf="$pdf" "$src" >/dev/null 2>&1
  if [ -f "$pdf" ]; then echo "ok   $(printf %03d $i)  $base"; parts+=("$pdf"); else echo "FAIL $i $base"; fi
done

echo "merging ${#parts[@]} chapter PDFs..."
pdfunite "${parts[@]}" "$OUT"
echo "DONE: $OUT"
