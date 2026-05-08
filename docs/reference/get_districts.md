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

Returns an sf object (class "sf" and "data.frame") with:

- province_name:

  Character. Parent province name

- district_name:

  Character. District name

- district_code:

  Character. Unique district identifier code (e.g., "PK603")

- area_km2:

  Numeric. Area in square kilometres for each district

- geometry:

  MULTIPOLYGON. District boundary geometries

When `province` is specified, the output contains only districts within
that province. The output represents administrative boundaries at the
district level.

## Examples

``` r
# All districts
all_districts <- get_districts()

# Filter to Punjab province (case-insensitive)
punjab_districts <- get_districts(province = "Punjab")
punjab_districts <- get_districts(province = "punjab")  # Same result

plot(sf::st_geometry(punjab_districts))
```
