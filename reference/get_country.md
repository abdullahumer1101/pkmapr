# Get Pakistan national boundary

Get Pakistan national boundary

## Usage

``` r
get_country(simplified = TRUE, crs = 4326, refresh = FALSE)
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

An sf object with columns: country_name, country_code, area_km2,
geometry.

## Examples

``` r
# \donttest{
  pak <- get_country()
#> ℹ Downloading pak_country_simplified.gpkg
#> ✔ Downloading pak_country_simplified.gpkg [171ms]
#> 
  plot(sf::st_geometry(pak))

# }
```
