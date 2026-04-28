# Quick choropleth map of a pkmapr sf object

Produces a ggplot2 map for rapid exploratory visualisation. Returns a
ggplot object that can be extended with standard ggplot2 layers.

## Usage

``` r
pk_map(x, fill = NULL, title = NULL, ...)
```

## Arguments

- x:

  An sf object.

- fill:

  Character. Column name to use as fill variable. NULL (default)
  produces an outline map.

- title:

  Character. Map title. NULL for no title.

- ...:

  Additional arguments passed to
  [`ggplot2::geom_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html).

## Value

A ggplot object.

## Examples

``` r
# \donttest{
  pk_map(get_provinces())

  pk_map(get_provinces(), fill = "area_km2", title = "Province areas")

# }
```
