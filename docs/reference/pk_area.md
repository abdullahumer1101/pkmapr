# Recalculate area in km² for an sf object

Computes accurate areas by reprojecting to UTM Zone 42N before
measurement. Returns the input object with area_km2 added or updated.

## Usage

``` r
pk_area(x)
```

## Arguments

- x:

  An sf object with polygon geometries.

## Value

Returns the input sf object (class "sf" and "data.frame") with the

- area_km2:

  Numeric column added or updated, representing the area of each polygon
  in square kilometres.

## Examples

``` r
districts <- get_districts()
districts <- pk_area(districts)
head(districts$area_km2)
#> [1]  692.5272 1210.7768  682.8134  550.2982 1612.3079  898.8126
```
