# Extract centroids from an sf object

Returns polygon centroids as a point sf object with all attribute
columns preserved, in the same CRS as the input.

## Usage

``` r
pak_centroid(x)
```

## Arguments

- x:

  An sf object with polygon geometries.

## Value

An sf point object in the same CRS as input.

## Examples

``` r
# \donttest{
  districts <- get_districts()
  centres   <- pak_centroid(districts)
#> Warning: st_centroid assumes attributes are constant over geometries
# }
```
