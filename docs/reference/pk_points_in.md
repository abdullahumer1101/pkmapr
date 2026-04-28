# Assign points to administrative units (point-in-polygon)

For each point in `points`, identifies which polygon it falls within and
joins that polygon's attributes to the point record.

## Usage

``` r
pk_points_in(points, polygons, return_all = TRUE)
```

## Arguments

- points:

  An sf object with point geometries.

- polygons:

  An sf object with polygon geometries.

- return_all:

  Logical. Keep unmatched points with NA polygon attributes (TRUE,
  default) or drop them (FALSE).

## Value

The points sf object with polygon attribute columns joined.

## Examples

``` r
# \donttest{
  districts <- get_districts()
  # pk_points_in(my_health_facilities, districts)
# }
```
