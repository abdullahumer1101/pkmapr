# Intersect two sf objects

Returns the geometric intersection of two sf objects with CRS alignment
handled automatically.

## Usage

``` r
pk_intersect(x, y)
```

## Arguments

- x:

  An sf object.

- y:

  An sf object.

## Value

Returns an sf object containing the geometric intersection of `x` and
`y`:

- geometry:

  Points, lines, or polygons where `x` and `y` overlap

- ...:

  All attribute columns from both `x` and `y` (with suffixes if names
  conflict)

The output CRS matches `x`. Empty geometries (no intersection) are
dropped. Output represents areas/features common to both input layers.

## Examples

``` r
districts <- get_districts()
buffered <- pk_buffer(districts, dist_km = 10)
intersected <- pk_intersect(districts, buffered)
#> Warning: attribute variables are assumed to be spatially constant throughout all geometries
```
