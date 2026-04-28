# Leaflet basemap centred on Pakistan

Returns a leaflet map pre-zoomed to Pakistan's extent as a starting
point for building custom interactive maps.

## Usage

``` r
pk_basemap(provider = "CartoDB.Positron")
```

## Arguments

- provider:

  Character. Tile provider. Default "CartoDB.Positron".

## Value

A leaflet object.

## Examples

``` r
# \donttest{
  pk_basemap()
#> Error in pk_basemap(): could not find function "pk_basemap"
# }
```
