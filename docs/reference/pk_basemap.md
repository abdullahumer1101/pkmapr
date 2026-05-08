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

Returns a leaflet object (class "leaflet" and "htmlwidget") with the
following configuration:

- Provider tiles:

  Specified tile provider (default: CartoDB.Positron)

- Bounds:

  Pre-zoomed to Pakistan's extent: longitude 60.9°E to 77.8°E, latitude
  23.5°N to 37.1°N

The output is a fully customizable leaflet basemap ready for adding
layers (e.g., administrative boundaries, point data, markers). Use this
as a starting point for building custom interactive maps.

## Examples

``` r
# \donttest{
# Default basemap with CartoDB.Positron tiles
pk_basemap()

{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["CartoDB.Positron",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]}],"fitBounds":[23.5,60.9,37.1,77.8,[]]},"evals":[],"jsHooks":[]}
# Alternative tile provider
pk_basemap(provider = "OpenStreetMap")

{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]}],"fitBounds":[23.5,60.9,37.1,77.8,[]]},"evals":[],"jsHooks":[]}# }
```
