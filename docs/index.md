# pkmapr: Pakistan Spatial Data Toolkit

**pkmapr** (pronounced *P-K-Mapper*) provides a clean, tidy interface to
Pakistan’s official administrative boundary data from
[OCHA/HDX](https://data.humdata.org/dataset/cod-ab-pak). It includes
geometries at country, province, district, and tehsil level as `sf`
objects compatible with the tidyverse and geospatial ecosystem, and
includes utilities for geographic dictionary lookup, spatial
measurement, and neighbour structure construction for use with `spdep`,
`ggplot2`, `leaflet`, and related packages.

## Installation

``` r
# GitHub
remotes::install_github("abdullahumer1101/pkmapr")

# R-Universe
install.packages("pkmapr", repos = "https://abdullahumer1101.r-universe.dev")
```

## Citation

``` r
citation("pkmapr")
```

Or cite directly:

> Umer, A. (2025). pkmapr: Pakistan Spatial Data Toolkit.
> <https://doi.org/10.5281/zenodo.19769542>
