# Epidemiological Analysis with pkmapr

``` r
library(pkmapr)
library(spdep)
library(dplyr)
```

## The problem: Non-contiguous units

Gilgit-Baltistan and Azad Kashmir share no land boundaries with other
provinces. Under standard contiguity rules, they would have zero
neighbours — breaking most spatial statistics.

[`pk_neighbors()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_neighbors.md)
handles this automatically.

## Build spatial weights

``` r
districts <- get_districts()
w <- pk_neighbors(districts, disputed = "exclude")
```

The returned object contains: - `w$nb`: neighbours list - `w$listw`:
row-standardised weights (ready for spdep)

## Global Moran’s I (synthetic data)

``` r
set.seed(2023)

# Create spatially autocorrelated synthetic data
n <- nrow(districts)
rho <- 0.6
W_mat <- listw2mat(w$listw)
epsilon <- rnorm(n, mean = 50, sd = 10)
y <- as.numeric(solve(diag(n) - rho * W_mat) %*% epsilon)

districts$synthetic_rate <- y

# Test for spatial autocorrelation
moran_result <- moran.test(districts$synthetic_rate, w$listw)
print(moran_result)
```

A significant p-value indicates spatial clustering.

## Local Indicators of Spatial Association (LISA)

Identify local clusters and outliers:

``` r
# Calculate local Moran's I
lisa <- localmoran(districts$synthetic_rate, w$listw)

# Add results to districts
districts$lisa_i <- lisa[, 1]  # local I
districts$lisa_p <- lisa[, 5]  # p-value

# Classify clusters (simplified)
districts$cluster <- case_when(
  districts$lisa_p > 0.05 ~ "Not significant",
  districts$synthetic_rate > mean(districts$synthetic_rate) &
    districts$lisa_i > 0 ~ "High-High",
  districts$synthetic_rate < mean(districts$synthetic_rate) &
    districts$lisa_i > 0 ~ "Low-Low",
  districts$lisa_i < 0 ~ "Outlier",
  TRUE ~ "Other"
)

# Map the clusters
ggplot2::ggplot(districts) +
  ggplot2::geom_sf(ggplot2::aes(fill = cluster)) +
  ggplot2::theme_void() +
  ggplot2::labs(title = "Spatial Clusters")
```

## Hotspot detection (Getis-Ord Gi\*)

``` r
# Calculate Gi* for the synthetic data
gi_star <- localG(districts$synthetic_rate, w$listw)

districts$gi_star <- as.numeric(gi_star)
districts$hotspot <- ifelse(districts$gi_star > 1.96, "Hotspot",
                            ifelse(districts$gi_star < -1.96, "Coldspot", "Not significant"))

pk_map(districts, fill = "hotspot", title = "Hotspots (p < 0.05)")
```

## Disputed boundary handling

The Line of Control creates analytical ambiguity.
[`pk_neighbors()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_neighbors.md)
makes your decision explicit:

``` r
# Exclude (default) — GB/AJK get nearest neighbour fallback
w_exclude <- pk_neighbors(districts, disputed = "exclude")

# Include — treat disputed boundaries as shared
w_include <- pk_neighbors(districts, disputed = "include")

# Flag — document which units are affected
w_flag <- pk_neighbors(districts, disputed = "flag")
print(w_flag$boundary_note)
```

## Complete workflow example

``` r
# 1. Get data
districts <- get_districts()

# 2. Build weights with explicit dispute handling
w <- pk_neighbors(districts, disputed = "exclude")

# 3. Attach your real case data (replace with your own)
# districts <- pk_join(districts, your_case_data, by = "district_code")

# 4. Calculate rates (example)
# districts <- districts |>
#   mutate(rate = cases / population * 100000)

# 5. Test for spatial autocorrelation
# moran.test(districts$rate, w$listw)

# 6. Identify clusters
# lisa <- localmoran(districts$rate, w$listw)
# districts$lisa_cluster <- attr(lisa, "quadr")$mean

# 7. Map results
# pk_map(districts, fill = "lisa_cluster")
```

## References

- Bivand, R. S., Pebesma, E., & Gomez-Rubio, V. (2013). *Applied spatial
  data analysis with R*. Springer.
- OCHA Pakistan. (2023). *COD-AB Administrative Boundaries*.
