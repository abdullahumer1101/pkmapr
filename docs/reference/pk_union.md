# Dissolve sf polygons by a grouping column

Merges polygons sharing the same value in a grouping column and
recalculates area_km2.

## Usage

``` r
pk_union(x, by)
```

## Arguments

- x:

  An sf object.

- by:

  Character. Column name to group by.

## Value

Returns a dissolved sf object (class "sf" and "data.frame") with:

- geometry:

  MULTIPOLYGON geometries created by merging adjacent polygons

- by_column:

  The unique grouping values (one row per group)

- area_km2:

  Recalculated area in square kilometres for each dissolved polygon

Polygons that are not spatially adjacent but share the same group value
will become MULTIPOLYGON objects. Invalid geometries are repaired
automatically using
[`sf::st_make_valid()`](https://r-spatial.github.io/sf/reference/valid.html).

## Examples

``` r
tehsils <- get_tehsils()
by_district <- pk_union(tehsils, by = "district_name")
```
