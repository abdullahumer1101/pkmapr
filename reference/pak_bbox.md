# Get a bounding box for a named administrative unit

Get a bounding box for a named administrative unit

## Usage

``` r
pak_bbox(name, level = c("province", "district", "tehsil"))
```

## Arguments

- name:

  Character. Name of the administrative unit.

- level:

  Character. One of "province", "district", or "tehsil".

## Value

A bbox object for use with
[`ggplot2::coord_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html)
or
[`leaflet::fitBounds()`](https://rstudio.github.io/leaflet/reference/map-methods.html).

## Examples

``` r
# \donttest{
  bb <- pak_bbox("Lahore", level = "district")
# }
```
