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

A dissolved sf object with area_km2 recalculated.

## Examples

``` r
  tehsils     <- get_tehsils()
  by_district <- pk_union(tehsils, by = "district_name")
```
