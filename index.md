# pkmapr: Pakistan Administrative Boundaries Toolkit

`{r, include = FALSE} knitr::opts_chunk$set( collapse = TRUE, comment = "#>", fig.path = "man/figures/README-", out.width = "100%" )`

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
get_provinces() |> pak_map(title = "Pakistan provinces")

# Look up official names before joining
pak_dictionary("districts", province = "Punjab")

# Join your data and map
my_data <- data.frame(district_code = "PK603", value = 42)
get_districts() |>
  pak_join(my_data, by = "district_code") |>
  pak_map(fill = "value", title = "My data")
```

## Key functions

| Function                                                                                                                                                                                                                                                                                                                                                           | What it does                                                               |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| [`get_country()`](https://abdullahumer1101.github.io/pkmapr/reference/get_country.md), [`get_provinces()`](https://abdullahumer1101.github.io/pkmapr/reference/get_provinces.md), [`get_districts()`](https://abdullahumer1101.github.io/pkmapr/reference/get_districts.md), [`get_tehsils()`](https://abdullahumer1101.github.io/pkmapr/reference/get_tehsils.md) | Download boundary geometries as `sf` objects                               |
| [`pak_dictionary()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_dictionary.md)                                                                                                                                                                                                                                                                        | Look up official names and PBS codes                                       |
| [`pak_join()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_join.md)                                                                                                                                                                                                                                                                                    | Join data to geometries with unmatched-row warnings                        |
| [`pak_neighbors()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_neighbors.md)                                                                                                                                                                                                                                                                          | Build spatial weights for `spdep` with Pakistan-specific boundary handling |
| [`pak_crs_suggest()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_crs_suggest.md)                                                                                                                                                                                                                                                                      | Recommend the right projected CRS for your extent                          |
| [`pak_map()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_map.md), [`pak_map_interactive()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_map_interactive.md)                                                                                                                                                                               | Quick static and interactive maps                                          |
| [`pak_centroid()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_centroid.md), [`pak_buffer()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_buffer.md), [`pak_distance()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_distance.md)                                                                                              | Geometric operations in km                                                 |
| [`pak_points_in()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_points_in.md)                                                                                                                                                                                                                                                                          | Assign GPS points to administrative units                                  |

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
