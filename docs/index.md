# pkmapr: Pakistan Spatial Data Toolkit

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

``` r
library(pkmapr)

# Get province boundaries and map them
get_provinces() |> pk_map(title = "Pakistan provinces")

# Look up official names before joining
pk_dictionary("districts", province = "Punjab")

# Join your data and map
my_data <- data.frame(district_code = "PK603", value = 42)
get_districts() |>
  pk_join(my_data, by = "district_code") |>
  pk_map(fill = "value", title = "My data")
```

## Key functions

| Function | What it does |
|----|----|
| [`get_country()`](https://abdullahumer1101.github.io/pkmapr/reference/get_country.md), [`get_provinces()`](https://abdullahumer1101.github.io/pkmapr/reference/get_provinces.md), [`get_districts()`](https://abdullahumer1101.github.io/pkmapr/reference/get_districts.md), [`get_tehsils()`](https://abdullahumer1101.github.io/pkmapr/reference/get_tehsils.md) | Get boundary geometries as `sf` objects |
| [`pk_dictionary()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_dictionary.md) | Look up official names and PBS codes |
| [`pk_join()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_join.md) | Join data to geometries with unmatched-row warnings |
| [`pk_neighbors()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_neighbors.md) | Build spatial weights for `spdep` with Pakistan-specific boundary handling |
| [`pk_crs_suggest()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_crs_suggest.md) | Recommend the right projected CRS for your extent |
| [`pk_map()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_map.md), [`pk_map_interactive()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_map_interactive.md) | Quick static and interactive maps |
| [`pk_centroid()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_centroid.md), [`pk_buffer()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_buffer.md), [`pk_distance()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_distance.md) | Geometric operations in km |
| [`pk_points_in()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_points_in.md) | Assign GPS points to administrative units |

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

> Umer, A. (2025). pkmapr: Pakistan Spatial Data Toolkit.
> <https://doi.org/10.5281/zenodo.19769542>
