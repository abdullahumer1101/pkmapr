# pkmapr: Pakistan Administrative Boundaries Toolkit

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

See [Introduction to
pkmapr](https://abdullahumer1101.github.io/pkmapr/articles/intro-to-pkmapr.html).

## Functions

Full documentation for all functions is available in the [package
reference](https://abdullahumer1101.github.io/pkmapr/reference/index.html).

## Data source

Boundaries are sourced from the [OCHA Pakistan
COD-AB](https://data.humdata.org/dataset/cod-ab-pak), covering country,
province, district, and tehsil levels (577 tehsil features). Data are
released under CC BY licence.

## Citation

``` r

citation("pkmapr")
```

Or cite directly:

> Umer, A. (2025). pkmapr: Pakistan Administrative Boundaries Toolkit.
> <https://doi.org/10.5281/zenodo.19769542>
