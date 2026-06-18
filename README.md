# Advanced Data Analysis

The second book in the Data Analysis series by [Mike Nguyen](https://mikenguyen.netlify.app). Where the first book, [*A Guide on Data Analysis*](https://bookdown.org/mike/data_analysis/), focuses on interpretation and causal inference, this one focuses on **prediction**: machine learning and AI for data scientists, data analysts, data engineers, and AI/ML engineers who work in R.

- Read it online: https://bookdown.org/mike/advanced_data_analysis/
- Companion volume: https://bookdown.org/mike/data_analysis/

## What it covers

Eighteen parts spanning the full modern stack: supervised and unsupervised learning, deep learning, the learning-paradigm families (data-availability, sample-efficiency, operational/streamed, and architecture/goal-driven), reinforcement learning, advanced and probabilistic methods, the prediction workflow (calibration, conformal prediction, hyperparameter optimization, feature engineering), applications (time series, recommenders), and the engineering side: frameworks and tooling, data engineering with R, AI/LLM application engineering, and MLOps.

Each chapter aims to teach: intuition first, then the math, then runnable R code, then interpretation, with figures and tables cross-referenced in the text.

## Building locally

This is a [bookdown](https://github.com/rstudio/bookdown) project. To build the website:

```r
# install.packages("bookdown")
bookdown::render_book("index.Rmd", output_format = "bookdown::bs4_book")
```

The output is written to `_book/`. A working LaTeX installation is needed for the PDF output, and pandoc (bundled with RStudio) for the HTML output. Chapter code depends on the packages each chapter loads; install them as needed.

## How to cite

Nguyen, M. *Advanced Data Analysis*. https://bookdown.org/mike/advanced_data_analysis/

A machine-readable citation is in [`CITATION.cff`](CITATION.cff).
