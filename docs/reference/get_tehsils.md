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

Returns an sf object (class "sf" and "data.frame") with:

- province_name:

  Character. Parent province name

- district_name:

  Character. Parent district name

- tehsil_name:

  Character. Tehsil name

- tehsil_code:

  Character. Unique tehsil identifier code

- area_km2:

  Numeric. Area in square kilometres for each tehsil

- geometry:

  MULTIPOLYGON. Tehsil boundary geometries

The output represents the finest available administrative boundaries in
pkmapr, suitable for high-resolution spatial analysis, local-level
mapping, and joining with tehsil-level census or survey data.

## Examples

``` r
# All tehsils
all_tehsils <- get_tehsils()

# Filter to Sindh province
sindh_tehsils <- get_tehsils(province = "Sindh")
sindh_tehsils <- get_tehsils(province = "sindh")  # Case-insensitive

# Filter to Lahore district
lahore_tehsils <- get_tehsils(district = "Lahore")
lahore_tehsils <- get_tehsils(district = "lahore")  # Case-insensitive

plot(sf::st_geometry(lahore_tehsils))
```
