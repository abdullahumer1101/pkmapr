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
  pk_basemap()

{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["CartoDB.Positron",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]}],"fitBounds":[23.5,60.9,37.1,77.8,[]]},"evals":[],"jsHooks":[]}
```
