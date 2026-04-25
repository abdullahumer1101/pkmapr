# Recalculate area in km² for an sf object

Computes accurate areas by reprojecting to UTM Zone 42N before
measurement. Returns the input object with area_km2 added or updated.

## Usage

``` r
pak_area(x)
```

## Arguments

- x:

  An sf object with polygon geometries.

## Value

The input sf object with area_km2 column added or updated.

## Examples

``` r
# \donttest{
  districts <- get_districts()
  districts <- pak_area(districts)
# }
```
