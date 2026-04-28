# Interactive choropleth map of a pkmapr sf object

Produces an interactive leaflet map. Returns a leaflet object that can
be extended with standard leaflet functions.

## Usage

``` r
pk_map_interactive(x, fill = NULL, popup = NULL, ...)
```

## Arguments

- x:

  An sf object.

- fill:

  Character. Column name for choropleth fill. NULL produces an outline
  map.

- popup:

  Character vector. Column names to display in click popups.

- ...:

  Additional arguments passed to
  [`leaflet::addPolygons()`](https://rstudio.github.io/leaflet/reference/map-layers.html).

## Value

A leaflet object.

## Examples

``` r
if (FALSE) { # interactive()
  districts <- get_districts()
  pk_map_interactive(districts,
                      fill = "area_km2",
                      popup = list("district_name", "area_km2"))
}
```
