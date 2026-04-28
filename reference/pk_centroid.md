# Extract centroids from an sf object

Returns polygon centroids as a point sf object with only geometry
(attributes are dropped to avoid warnings about constant attributes).

## Usage

``` r
pk_centroid(x)
```

## Arguments

- x:

  An sf object with polygon geometries.

## Value

An sf point object in the same CRS as input.

## Examples

``` r
if (FALSE) { # interactive()
  districts <- get_districts()
  centres   <- pk_centroid(districts)
}
```
