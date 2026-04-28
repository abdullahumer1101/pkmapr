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

The input sf object with area_km2 column added or updated.

## Examples

``` r
# \donttest{
  districts <- get_districts()
#> ℹ Downloading pak_districts_simplified.gpkg
#> ✔ Downloading pak_districts_simplified.gpkg [667ms]
#> 
  districts <- pk_area(districts)
#> Error in pk_area(districts): could not find function "pk_area"
# }
```
