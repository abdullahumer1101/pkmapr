# Get Pakistan district boundaries

Get Pakistan district boundaries

## Usage

``` r
get_districts(province = NULL, simplified = TRUE, crs = 4326, refresh = FALSE)
```

## Arguments

- province:

  Character. Filter to one province by exact name. Run
  `pak_dictionary("provinces")` to see valid names. NULL (default)
  returns all districts.

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

An sf object with columns: province_name, district_name, district_code,
area_km2, geometry.

## Examples

``` r
# \donttest{
  all_districts    <- get_districts()
#> ℹ Downloading pak_districts_simplified.gpkg
#> ✔ Downloading pak_districts_simplified.gpkg [160ms]
#> 
  punjab_districts <- get_districts(province = "Punjab")
# }
```
