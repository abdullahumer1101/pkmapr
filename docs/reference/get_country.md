# Get national boundary for Pakistan.

Get national boundary for Pakistan.

## Usage

``` r
get_country(crs = 4326)
```

## Arguments

- crs:

  Integer EPSG code. Default 4326 (WGS84). Use 32642 for distance and
  area calculations. See
  [`pk_crs_suggest()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_crs_suggest.md)
  for guidance.

## Value

Returns an sf object (class "sf" and "data.frame") with:

- country_name:

  Character. Name of the country ("Pakistan")

- country_code:

  Character. ISO country code

- area_km2:

  Numeric. Area in square kilometres

- geometry:

  MULTIPOLYGON. The national boundary geometry

The output represents the complete national boundary of Pakistan.

## Examples

``` r
pakistan <- get_country()
plot(sf::st_geometry(pakistan))

print(pakistan$area_km2)
#> [1] 877964.7
```
