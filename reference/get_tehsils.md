# Get Pakistan tehsil boundaries

Get Pakistan tehsil boundaries

## Usage

``` r
get_tehsils(district = NULL, province = NULL, crs = 4326)
```

## Arguments

- district:

  Character. Filter to one district by exact name. Matching is
  case-insensitive. NULL returns all.

- province:

  Character. Filter to one province by exact name. Matching is
  case-insensitive. NULL returns all. If both district and province are
  supplied, district takes precedence.

- crs:

  Integer EPSG code. Default 4326 (WGS84). Use 32642 for distance and
  area calculations. See
  [`pk_crs_suggest()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_crs_suggest.md)
  for guidance.

## Value

An sf object with columns: province_name, district_name, tehsil_name,
tehsil_code, area_km2, geometry.

## Examples

``` r
  sindh_tehsils  <- get_tehsils(province = "Sindh")
  sindh_tehsils  <- get_tehsils(province = "sindh")  # Case-insensitive
  lahore_tehsils <- get_tehsils(district = "Lahore")
  lahore_tehsils <- get_tehsils(district = "lahore")  # Case-insensitive
```
