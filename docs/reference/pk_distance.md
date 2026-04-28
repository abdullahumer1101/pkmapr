# Compute distances between two sf objects in km

Reprojects internally to UTM Zone 42N for accurate metric distances.

## Usage

``` r
pk_distance(x, y, by = c("centroid", "edge"))
```

## Arguments

- x:

  An sf object.

- y:

  An sf object.

- by:

  Character. "centroid" (default) for centroid-to-centroid distances.
  "edge" for nearest-point-on-boundary distances.

## Value

A numeric matrix of distances in km.

## Examples

``` r
# \donttest{
  provinces <- get_provinces()
#> ℹ Downloading pak_provinces_simplified.gpkg
#> ✔ Downloading pak_provinces_simplified.gpkg [590ms]
#> 
  d <- pk_distance(provinces, provinces)
#> Error in pk_distance(provinces, provinces): could not find function "pk_distance"
# }
```
