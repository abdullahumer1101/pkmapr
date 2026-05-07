# Spatial Analysis with pkmapr

``` r
library(pkmapr)
library(dplyr)
```

## Centroids

Convert polygons to points for labeling and/or distance calculations:

``` r
districts <- get_districts()
centroids <- pk_centroid(districts)

# Map districts with centroid points
pk_map(districts) +
  ggplot2::geom_sf(data = centroids, color = "red", size = 0.5)
```

## Buffers

Create buffer zones around administrative units (distances in km):

``` r
# 10km buffer around Lahore district
lahore <- get_districts(province = "Punjab") |>
  filter(district_name == "Lahore")

lahore_buffer <- pk_buffer(lahore, dist_km = 10)

pk_map(lahore_buffer, title = "Lahore buffer") +
  ggplot2::geom_sf(data = lahore, fill = "red", alpha = 0.5)
```

## Distance calculations

Compute distances between units:

``` r
# Distance matrix between provinces (centroid to centroid)
provinces <- get_provinces()
dist_matrix <- pk_distance(provinces, provinces)

# Distance from each province to Karachi
karachi <- get_districts(province = "Sindh") |>
  filter(district_name == "Karachi")

distances <- pk_distance(provinces, karachi)
```

## Point-in-polygon

Assign GPS points to administrative units:

``` r
# Example: health facility locations
facilities <- data.frame(
  name = c("Hospital A", "Clinic B"),
  lon = c(74.3, 74.5),
  lat = c(31.5, 31.6)
) |>
  sf::st_as_sf(coords = c("lon", "lat"), crs = 4326)

# Assign to districts
facilities_with_district <- pk_points_in(facilities, districts)

# View result
facilities_with_district |>
  sf::st_drop_geometry() |>
  select(name, district_name)
```

## Dissolve boundaries

Aggregate finer units to coarser levels:

``` r
# Dissolve tehsils to district level
tehsils <- get_tehsils()
districts_from_tehsils <- pk_union(tehsils, by = "district_name")

# Compare area
original_districts <- get_districts()
pk_area(original_districts)
pk_area(districts_from_tehsils)  # Should be similar
```

## Choose the right CRS

WGS84 (default) measures in degrees, for measurements using projected
CRS:

``` r
# Recommended CRS for your data's extent
pk_crs_suggest(get_districts(province = "Punjab"))

# Reproject for metric operations
districts_utm <- pk_project(districts, crs = 32642)
```
