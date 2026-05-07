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

Returns the sf object reprojected to the specified CRS. The output has
the same attributes and geometry type as the input, but coordinates are
transformed to the new projection. UTM Zone 42N (EPSG:32642) preserves
distances and areas accurately across most but not all of Pakistan.

## Examples

``` r
districts <- get_districts()
projected <- pk_project(districts)
sf::st_crs(projected)$epsg  # Should be 32642
#> [1] 32642
```
