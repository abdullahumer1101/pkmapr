# Get Pakistan tehsil boundaries

Get Pakistan tehsil boundaries

## Usage

``` r
get_tehsils(
  district = NULL,
  province = NULL,
  simplified = TRUE,
  crs = 4326,
  refresh = FALSE
)
```

## Arguments

- district:

  Character. Filter to one district by exact name. NULL returns all. If
  both district and province are supplied, district takes precedence.

- province:

  Character. Filter to one province by exact name. NULL returns all.

- simplified:

  Logical. Return simplified geometry for fast plotting (default TRUE)
  or full resolution for precise analysis (FALSE).

- crs:

  Integer EPSG code. Default 4326 (WGS84). Use 32642 for distance and
  area calculations. See
  [`pak_crs_suggest()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_crs_suggest.md)
  for guidance.

- refresh:

  Logical. Force re-download even if cached. Default FALSE.

## Value

An sf object with columns: province_name, district_name, tehsil_name,
tehsil_code, area_km2, geometry.

## Examples

``` r
# \donttest{
  sindh_tehsils  <- get_tehsils(province = "Sindh")
#> ℹ Downloading pak_tehsils_simplified.gpkg
#> ✔ Downloading pak_tehsils_simplified.gpkg [143ms]
#> 
  lahore_tehsils <- get_tehsils(district = "Lahore")
# }
```
