# Introduction to pkmapr

``` r
library(pkmapr)
library(dplyr)
```

## Centroids

Convert polygons to points for labeling or distance calculations:

``` r
districts <- get_districts()
centroids <- pak_centroid(districts)

# Map districts with centroid points
pak_map(districts) +
  ggplot2::geom_sf(data = centroids, color = "red", size = 0.5)
```

## Buffers

Create buffer zones around administrative units (distances in km):

``` r
# 10km buffer around Lahore district
lahore <- get_districts(province = "Punjab") |>
  filter(district_name == "Lahore")

lahore_buffer <- pak_buffer(lahore, dist_km = 10)

pak_map(lahore_buffer, fill = NA, color = "blue") +
  ggplot2::geom_sf(data = lahore, fill = "red", alpha = 0.5)
```

## Distance calculations

Compute distances between units:

``` r
# Distance matrix between provinces (centroid to centroid)
provinces <- get_provinces()
dist_matrix <- pak_distance(provinces, provinces)

# Distance from each province to Karachi
karachi <- get_districts(province = "Sindh") |>
  filter(district_name == "Karachi")

distances <- pak_distance(provinces, karachi)
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
facilities_with_district <- pak_points_in(facilities, districts)

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
districts_from_tehsils <- pak_union(tehsils, by = "district_name")

# Compare area
original_districts <- get_districts()
pak_area(original_districts)
pak_area(districts_from_tehsils)  # Should be similar
```

## Choose the right CRS

WGS84 (default) measures in degrees — use projected CRS for real
measurements:

``` r
# Recommended CRS for your data's extent
pak_crs_suggest(get_districts(province = "Punjab"))

# Reproject for metric operations
districts_utm <- pak_project(districts, crs = 32642)
```

## Next steps

- [`vignette("epidemiology-pkmapr")`](https://abdullahumer1101.github.io/pkmapr/articles/epidemiology-pkmapr.md)
  for spatial statistics and clustering
- [`vignette("intro-to-pkmapr")`](https://abdullahumer1101.github.io/pkmapr/articles/intro-to-pkmapr.md)
  for basic mapping and joins
