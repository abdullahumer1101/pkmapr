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

Returns a numeric matrix (class "matrix") of distances in kilometres,
with dimensions `nrow(x)` by `nrow(y)`.

When `by = "centroid"`, distances are measured between polygon
centroids. When `by = "edge"`, distances are measured between the
closest points on polygon boundaries. The output represents the shortest
straight-line distance between features.

## Examples

``` r
provinces <- get_provinces()
d <- pk_distance(provinces, provinces)
#> Warning: st_centroid assumes attributes are constant over geometries
#> Warning: st_centroid assumes attributes are constant over geometries
print(d)
#>  [1]    0.00000  996.67608  220.58232   85.14532  214.47991  395.26898
#>  [7] 1017.39047  996.67608    0.00000 1196.76855  913.32286  847.16126
#> [13]  667.66333  387.44971  220.58232 1196.76855    0.00000  291.92462
#> [19]  359.33835  615.83990 1237.20137   85.14532  913.32286  291.92462
#> [25]    0.00000  146.96871  332.30893  947.48230  214.47991  847.16126
#> [31]  359.33835  146.96871    0.00000  372.12890  940.92748  395.26898
#> [37]  667.66333  615.83990  332.30893  372.12890    0.00000  624.16408
#> [43] 1017.39047  387.44971 1237.20137  947.48230  940.92748  624.16408
#> [49]    0.00000

# Edge-to-edge distances
d_edge <- pk_distance(provinces, provinces, by = "edge")
```
