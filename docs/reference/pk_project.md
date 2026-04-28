# Project an sf object to a Pakistan-appropriate CRS

Convenience wrapper around
[`sf::st_transform()`](https://r-spatial.github.io/sf/reference/st_transform.html)
with a default of UTM Zone 42N, appropriate for most Pakistan analyses
requiring accurate distance, area, or buffer operations.

## Usage

``` r
pk_project(x, crs = 32642)
```

## Arguments

- x:

  An sf object.

- crs:

  Integer EPSG code. Default 32642 (WGS84 / UTM Zone 42N).

## Value

The sf object reprojected to the specified CRS.

## Examples

``` r
# \donttest{
  districts <- get_districts()
  projected <- pk_project(districts)
#> Error in pk_project(districts): could not find function "pk_project"
# }
```
