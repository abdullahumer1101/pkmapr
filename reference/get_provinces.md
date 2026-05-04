# Get Pakistan province boundaries

Get Pakistan province boundaries

## Usage

``` r
get_provinces(crs = 4326)
```

## Arguments

- crs:

  Integer EPSG code. Default 4326 (WGS84). Use 32642 for distance and
  area calculations. See
  [`pk_crs_suggest()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_crs_suggest.md)
  for guidance.

## Value

An sf object with columns: province_name, province_code, area_km2,
geometry.

## Examples

``` r
  pk <- get_provinces()
  plot(sf::st_geometry(pk))
```
