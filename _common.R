# ---------------------------------------------------------------------------
# Shared figure setup for "Advanced Data Analysis".
# Sourced at the top of every chapter so that all R figures share one clean,
# publication-quality look instead of R's defaults.
# ---------------------------------------------------------------------------

suppressPackageStartupMessages(library(tidyverse))

## Figure rendering: crisp, high-resolution, consistently sized output.
knitr::opts_chunk$set(
  dev        = "ragg_png",   # anti-aliased raster device, sharp text and lines
  dpi        = 300,
  fig.retina = 2,
  fig.width  = 6.5,
  fig.height = 4.0,
  fig.align  = "center",
  out.width  = "85%"
)

## A clean, academic ggplot2 theme used as the global default.
theme_book <- function(base_size = 12) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      plot.title       = ggplot2::element_text(face = "bold", size = ggplot2::rel(1.1),
                                               hjust = 0, margin = ggplot2::margin(b = 6)),
      plot.subtitle    = ggplot2::element_text(colour = "grey30", hjust = 0,
                                               margin = ggplot2::margin(b = 8)),
      plot.caption     = ggplot2::element_text(colour = "grey45", size = ggplot2::rel(0.8),
                                               hjust = 1, margin = ggplot2::margin(t = 8)),
      axis.title.x     = ggplot2::element_text(colour = "grey20", margin = ggplot2::margin(t = 6)),
      axis.title.y     = ggplot2::element_text(colour = "grey20", angle = 90,
                                               margin = ggplot2::margin(r = 6)),
      axis.text        = ggplot2::element_text(colour = "grey30"),
      axis.line        = ggplot2::element_line(colour = "grey55", linewidth = 0.3),
      axis.ticks       = ggplot2::element_line(colour = "grey55", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(colour = "grey92", linewidth = 0.3),
      legend.position  = "top",
      legend.justification = "left",
      legend.key       = ggplot2::element_blank(),
      strip.text       = ggplot2::element_text(face = "bold", colour = "grey20",
                                               margin = ggplot2::margin(4, 4, 4, 4)),
      plot.margin      = ggplot2::margin(10, 14, 10, 10)
    )
}
ggplot2::theme_set(theme_book())

## Continuous scales default to viridis (perceptually uniform, colourblind-safe).
options(
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill   = "viridis"
)

## Slightly bolder default geoms so lines and points read well in print.
ggplot2::update_geom_defaults("line",  list(linewidth = 0.8))
ggplot2::update_geom_defaults("point", list(size = 1.8))

## Base-graphics defaults for chapters that call plot()/hist()/curve() directly.
knitr::knit_hooks$set(book_par = function(before, options, envir) {
  if (before) {
    par(las = 1, mgp = c(2.2, 0.6, 0), tcl = -0.3, cex.axis = 0.95)
  }
})
knitr::opts_chunk$set(book_par = TRUE)
