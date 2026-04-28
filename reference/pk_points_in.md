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
  # Get district boundaries
  districts <- get_districts()

  # Create sample points (or use your own sf object)
  set.seed(123)
  sample_points <- sf::st_sample(districts, size = 50)
  sample_points_sf <- sf::st_sf(geometry = sample_points)

  # Assign points to districts
  points_with_districts <- pk_points_in(sample_points_sf, districts)
  print(head(points_with_districts))
#> Simple feature collection with 6 features and 4 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 62.62372 ymin: 24.66348 xmax: 72.36706 ymax: 34.91175
#> Geodetic CRS:  WGS 84
#>        province_name      district_name district_code  area_km2
#> 1              Sindh Kambar Shahdad Kot         PK709  5595.033
#> 2              Sindh              Badin         PK701  6569.858
#> 3 Khyber Pakhtunkhwa               Swat         PK532  5357.166
#> 4             Punjab    Dera Ghazi Khan         PK607 11761.995
#> 5        Balochistan             Chagai         PK203 44796.005
#> 6             Punjab             Multan         PK622  3650.195
#>                    geometry
#> 1 POINT (67.81295 27.68153)
#> 2 POINT (68.62067 24.66348)
#> 3 POINT (72.36706 34.91175)
#> 4 POINT (70.58781 30.12792)
#> 5 POINT (62.62372 28.67785)
#> 6 POINT (71.73863 30.19152)
# }
```
