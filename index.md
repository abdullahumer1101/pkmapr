# pkmapr: Pakistan Spatial Data Toolkit

**pkmapr** (pronounced *P-K-Mapper*) provides a clean, tidy interface to
Pakistan’s official administrative boundary data from
[OCHA/HDX](https://data.humdata.org/dataset/cod-ab-pak). It includes
geometries at country, province, district, and tehsil level as `sf`
objects compatible with the tidyverse and geospatial ecosystem, and
includes utilities for geographic dictionary lookup, spatial
measurement, coordinate reference system selection, and neighbour
structure construction for use with `spdep`, `ggplot2`, `leaflet`, and
related packages.

## Installation

Install the released version from CRAN:

``` r

install.packages("pkmapr")
```

Or install the development version from GitHub:

``` r

remotes::install_github("abdullahumer1101/pkmapr")
```

## Citation

``` r

citation("pkmapr")
```

Or cite directly. For the CRAN release:

> Umer, A. (2026). pkmapr: Pakistan Spatial Data Toolkit. R package
> version 1.2.1. <https://doi.org/10.32614/CRAN.package.pkmapr>

For development releases archived on Zenodo:

> Umer, A. (2026). pkmapr: Pakistan Spatial Data Toolkit. Zenodo.
> <https://doi.org/10.5281/zenodo.19769542>
