<div align="center">

<img src="images/cover.jpg" alt="Advanced Data Analysis cover" width="240"/>

# Advanced Data Analysis

**Machine learning and AI for prediction — in R.**
The second book in the Data Analysis series by [Mike Nguyen](https://mikenguyen.netlify.app).

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20764815.svg)](https://doi.org/10.5281/zenodo.20764815)
[![Read online](https://img.shields.io/website?url=https%3A%2F%2Fadvanced-data-analysis.netlify.app&up_message=online&down_message=offline&label=read%20online)](https://advanced-data-analysis.netlify.app)
[![Built with Quarto](https://img.shields.io/badge/Built%20with-Quarto-75AADB?logo=quarto&logoColor=white)](https://quarto.org)
[![Made with R](https://img.shields.io/badge/Made%20with-R-276DC3?logo=r&logoColor=white)](https://www.r-project.org)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](LICENSE)

[**📖 Read online**](https://advanced-data-analysis.netlify.app) · [**📘 Companion: *A Guide on Data Analysis***](https://bookdown.org/mike/data_analysis/) · [**✍️ Author**](https://mikenguyen.netlify.app)

</div>

---

Where the first book, [*A Guide on Data Analysis*](https://bookdown.org/mike/data_analysis/), focuses on **interpretation and causal inference** — understanding *why* and estimating effects we can defend — this book turns to the other half of the discipline: **prediction**. It is written for data scientists, data analysts, data engineers, and AI/ML engineers who work in R, and every method is taught the same way: **intuition first, then the math, then runnable R code, then interpretation**, with figures and tables cross-referenced throughout.

## What it covers

124 chapters across eighteen parts spanning the full modern stack:

- **Supervised learning** — splines, kernels, local regression, GAMs, Gaussian processes, trees, bagging/boosting, random forests, BART, neural networks, SVM, discriminant analysis
- **Unsupervised learning** — clustering, dimension reduction, density estimation, interpretable ML
- **Deep learning** — CNNs, RNNs, transformers, BERT, LLMs, autoencoders, generative & diffusion models, GNNs, mixture-of-experts, Bayesian deep learning
- **Learning paradigms** — semi-/self-/weakly-supervised, few-shot, meta-, transfer, online, federated, continual, curriculum, adversarial, metric learning
- **Reinforcement learning** — bandits, TD/policy-gradient/model-based/offline/multi-agent/deep RL, contextual bandits
- **Advanced & probabilistic methods** — probabilistic programming, causal ML, structured prediction, learning to rank
- **Prediction workflow** — calibration, conformal prediction, hyperparameter optimization, feature engineering, class imbalance, anomaly detection
- **Engineering** — tidymodels/mlr3/torch, data engineering with R, AI/LLM application engineering, and MLOps

## Read it

The online edition is the canonical source: **<https://advanced-data-analysis.netlify.app>**

## Building locally

This is a [Quarto](https://quarto.org) book. The chapters execute real R, so a recent R with the per-chapter packages installed is required.

```bash
quarto render            # build the site into _book/
quarto publish netlify   # (maintainer) deploy the rendered _book/ to Netlify
```

The book is rendered locally and the static `_book/` is published to Netlify — R is too heavy for Netlify's CI. See [`DEPLOY.md`](DEPLOY.md) for the full runbook and [`make-pdf.sh`](make-pdf.sh) for building the full-book PDF.

## How to cite

> Nguyen, M. *Advanced Data Analysis*. <https://advanced-data-analysis.netlify.app>. https://doi.org/10.5281/zenodo.20764815

A machine-readable citation is in [`CITATION.cff`](CITATION.cff).

## License

The book content is released under [Creative Commons Attribution 4.0 International (CC BY 4.0)](LICENSE) — you may share and adapt it with attribution.
