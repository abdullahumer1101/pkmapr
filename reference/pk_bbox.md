# Get a bounding box for a named administrative unit

Get a bounding box for a named administrative unit

## Usage

``` r
pk_bbox(name, level = c("province", "district", "tehsil"))
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

## Note

If you see an error like `object 'xxx' not found` when using this
function, the issue is likely in your data preparation, not `pk_bbox()`.
Test the function directly: `pk_bbox("Punjab", level = "province")`. If
that works, check that your data has the expected column names.

## Examples

``` r
  bb <- pk_bbox("Lahore", level = "district")
#> Error in getter(simplified = TRUE): unused argument (simplified = TRUE)
```
