# Get Pakistan province boundaries

Get Pakistan province boundaries

## Usage

``` r
get_provinces(simplified = TRUE, crs = 4326, refresh = FALSE)
```

## Arguments

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

An sf object with columns: province_name, province_code, area_km2,
geometry.

## Examples

``` r
# \donttest{
  provinces <- get_provinces()
#> ℹ Downloading pak_provinces_simplified.gpkg
#> ✔ Downloading pak_provinces_simplified.gpkg [145ms]
#> 
# }
```
