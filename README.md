
<!-- README.md is generated from README.Rmd. Please edit that file -->

# geoparser <img src="man/figures/package-sticker.png" align="right" style="float:right; height:120px;"/>

<!-- badges: start -->

[![R CMD
Check](https://github.com/frbcesab/geoparser/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/frbcesab/geoparser/actions/workflows/R-CMD-check.yaml)
[![Website](https://github.com/frbcesab/geoparser/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/frbcesab/geoparser/actions/workflows/pkgdown.yaml)
[![Test
coverage](https://github.com/frbcesab/geoparser/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/frbcesab/geoparser/actions/workflows/test-coverage.yaml)
[![codecov](https://codecov.io/gh/frbcesab/geoparser/branch/main/graph/badge.svg)](https://codecov.io/gh/frbcesab/geoparser)
[![CRAN
status](https://www.r-pkg.org/badges/version/geoparser)](https://CRAN.R-project.org/package=geoparser)
[![License: GPL (\>=
2)](https://img.shields.io/badge/License-GPL%20%28%3E%3D%202%29-blue.svg)](https://choosealicense.com/licenses/gpl-2.0/)
<!-- badges: end -->

The goal of the R package `geoparser` is to detect country names in a
text document (e.g. a PDF file imported with the R package
[`pdftools`](https://cran.r-project.org/package=pdftools)).

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("frbcesab/geoparser")
```

Then you can attach the package `geoparser`:

``` r
library("geoparser")
```

## Overview

The package `geoparser` contains the function
[`geoparser()`](https://frbcesab.github.io/geoparser/reference/geoparser.html)
used to detect countries listed in the internal dataset
[`world_countries`](https://frbcesab.github.io/geoparser/reference/world_countries.html).

The function `geoparser()` returns a `data.frame` with the following
columns:

- `geographic_entity`: the name of the country according to
  [GADM](https://gadm.org/);
- `n_pages`: the total number of pages in the document;
- `page`: the page number;
- `count`: the occurrence of the country for a given page.

Example:

| geographic_entity | n_pages | page | count |
|:------------------|:-------:|-----:|------:|
| Canada            |   11    |    1 |     2 |
| Canada            |   11    |    2 |     5 |
| United States     |   11    |    3 |     1 |
| Canada            |   11    |    3 |     5 |
| United States     |   11    |    4 |     1 |
| United States     |   11    |    5 |     1 |
| Canada            |   11    |    9 |     1 |
| Denmark           |   11    |   10 |     1 |
| United Kingdom    |   11    |   10 |     2 |
| United States     |   11    |   10 |     2 |
| Canada            |   11    |   10 |     5 |
| Australia         |   11    |   11 |     1 |
| Bangladesh        |   11    |   11 |     1 |
| Estonia           |   11    |   11 |     1 |
| Canada            |   11    |   11 |     2 |
| United Kingdom    |   11    |   11 |     2 |
| United States     |   11    |   11 |     5 |

## Citation

Please cite this package as:

> Casajus Nicolas (2023) geoparser: An R package to detect country names
> in documents. R package version 0.1.
> <https://frbcesab.github.io/geoparser>.

## Code of Conduct

Please note that the `geoparser` project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
