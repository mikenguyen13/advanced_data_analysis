# Post-render step (growth experiment E2: one canonical URL per page).
#
# Quarto lists the home page in sitemap.xml as .../index.html, while the page's
# <link rel="canonical"> (format: html: canonical-url: true) is the site root
# .../. Rewrite the sitemap entry to the root so the sitemap and the canonical
# agree, and drop a duplicate root entry if a partial render added one back.
# Idempotent; does nothing when there is no sitemap.

out_dir <- Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR", "_book")
sitemap <- file.path(out_dir, "sitemap.xml")
if (!file.exists(sitemap)) quit(save = "no")

xml <- paste(readLines(sitemap, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
xml <- gsub("(<loc>[^<]*/)index[.]html(</loc>)", "\\1\\2", xml, perl = TRUE)

# Keep one <url> block per <loc> (the last one: a partial render appends its entry).
starts <- gregexpr("<url>", xml, fixed = TRUE)[[1]]
if (starts[1] > 0) {
  ends <- gregexpr("</url>", xml, fixed = TRUE)[[1]] + nchar("</url>") - 1
  blocks <- substring(xml, starts, ends)
  locs <- regmatches(blocks, regexpr("<loc>[^<]*</loc>", blocks))
  keep <- !duplicated(locs, fromLast = TRUE)  # the later entry has the fresher lastmod
  if (!all(keep)) {
    body <- paste(blocks[keep], collapse = "\n  ")
    xml <- paste0(substr(xml, 1, starts[1] - 1), body,
                  substring(xml, ends[length(ends)] + 1))
  }
}

con <- file(sitemap, "wb")  # binary: keep LF line endings on Windows
writeLines(xml, con, useBytes = TRUE)
close(con)
