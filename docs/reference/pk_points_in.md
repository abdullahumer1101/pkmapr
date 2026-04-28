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
if (FALSE) { # interactive()
  # Get district boundaries
  districts <- get_districts()

  # Create sample points (or use your own sf object)
  set.seed(123)
  sample_points <- sf::st_sample(districts, size = 50)
  sample_points_sf <- sf::st_sf(geometry = sample_points)

  # Assign points to districts
  points_with_districts <- pk_points_in(sample_points_sf, districts)
  print(head(points_with_districts))
}
```
