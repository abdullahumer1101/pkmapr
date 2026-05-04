# Get Pakistan district boundaries

Get Pakistan district boundaries

## Usage

``` r
get_districts(province = NULL, crs = 4326)
```

## Arguments

- province:

  Character. Filter to one province by exact name. Matching is
  case-insensitive. Run `pk_dictionary("provinces")` to see valid names.
  NULL (default) returns all districts.

- crs:

  Integer EPSG code. Default 4326 (WGS84). Use 32642 for distance and
  area calculations. See
  [`pk_crs_suggest()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_crs_suggest.md)
  for guidance.

## Value

An sf object with columns: province_name, district_name, district_code,
area_km2, geometry.

## Examples

``` r
  all_districts    <- get_districts()
  punjab_districts <- get_districts(province = "Punjab")
  punjab_districts <- get_districts(province = "punjab")  # Case-insensitive
```
