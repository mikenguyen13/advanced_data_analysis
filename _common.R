# Ensure the writable user library (with the up-to-date package versions
# installed for this book) is searched before the read-only system library,
# in every per-chapter session (new_session: true).
local({
    ul <- "C:/Users/miken/R/library-4.4"
    if (dir.exists(ul)) .libPaths(c(ul, .libPaths()))
})

knitr::opts_chunk$set(
    comment = "#>",
    collapse = TRUE,
    cache = TRUE,
    warning = FALSE,
    message = FALSE,
    echo = TRUE,
    dpi = 300,
    cache.lazy = FALSE,
    tidy = "styler",
    out.width = "90%",
    fig.align = "center",
    fig.width = 5,
    fig.height = 7
)

# Avoid duplicate `fig:unnamed-chunk-N` cross-chapter clashes by prefixing
# auto-generated chunk labels with the chapter file basename.
options(knitr.duplicate.label = "allow")
local({
    ci <- tryCatch(knitr::current_input(), error = function(e) NULL)
    if (!is.null(ci) && nzchar(ci)) {
        prefix <- tools::file_path_sans_ext(basename(ci))
        prefix <- gsub("[^A-Za-z0-9]+", "-", prefix)
        prefix <- gsub("^-+|-+$", "", prefix)
        if (nzchar(prefix)) knitr::opts_knit$set(unnamed.chunk.label = prefix)
    }
})

# Python chunks in this book are illustrative (reference implementations for
# readers who use Python/Keras/PyTorch). They are shown but not executed, since
# the book's runnable examples are in R. This displays the Python code without
# requiring a configured Python backend.
knitr::knit_engines$set(python = function(options) {
    knitr::engine_output(options, options$code, out = character(0))
})

options(crayon.enabled = FALSE)

suppressPackageStartupMessages(library(tidyverse))
theme_set(theme_light())
