
# pkmapr: Pakistan Administrative Boundaries Toolkit

<!-- badges: start -->

[![R-CMD-check](https://github.com/abdullahumer1101/pkmapr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/abdullahumer1101/pkmapr/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/abdullahumer1101/pkmapr/graph/badge.svg)](https://app.codecov.io/gh/abdullahumer1101/pkmapr)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19769542.svg)](https://doi.org/10.5281/zenodo.19769542)
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Version](https://img.shields.io/badge/version-0.3.0-orange.svg)](https://github.com/abdullahumer1101/pkmapr/releases)
<!-- badges: end -->

**pkmapr** (pronounced *P-K-Mapper*) provides a clean, tidy interface to
Pakistan’s official administrative boundary data from
[OCHA/HDX](https://data.humdata.org/dataset/cod-ab-pak). It downloads
and caches geometries at country, province, district, and tehsil level
as `sf` objects compatible with the tidyverse and geospatial ecosystem,
and includes utilities for geographic dictionary lookup, spatial
measurement, and neighbour structure construction for use with `spdep`,
`ggplot2`, `leaflet`, and related packages.

## Installation

``` r
# GitHub
remotes::install_github("abdullahumer1101/pkmapr")

# R-Universe
install.packages("pkmapr", repos = "https://abdullahumer1101.r-universe.dev")
```

## Quick start

See [Introduction to pkmapr](https://abdullahumer1101.github.io/pkmapr/articles/intro-to-pkmapr.html).

## Functions

Full documentation for all functions is available in the 
[package reference](https://abdullahumer1101.github.io/pkmapr/reference/index.html).

## Data source

Boundaries are sourced from the [OCHA Pakistan COD-AB](https://data.humdata.org/dataset/cod-ab-pak), covering country, province, district, and tehsil levels (577 tehsil features). Data are released under CC BY licence.

## Citation

``` r
citation("pkmapr")
```

Or cite directly:

> Umer, A. (2025). pkmapr: Pakistan Administrative Boundaries Toolkit.
> <https://doi.org/10.5281/zenodo.19769542>
