# Epidemiology with pkmapr

``` r
library(pkmapr)
library(spdep)
library(dplyr)
```

This vignette shows a full spatial epidemiology workflow using
[`pk_neighbors()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_neighbors.md)
to build spatial weights, test for spatial autocorrelation, and identify
local clusters across Pakistan’s administrative districts.

## Build spatial weights

[`pk_neighbors()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_neighbors.md)
returns three elements in a named list:

- `w$nb`: the `spdep` neighbours list
- `w$listw`: row-standardised spatial weights, ready for `spdep`
- `w$data`: the `sf` object used to build the weights (see note below)

``` r
districts <- get_districts()
w <- pk_neighbors(districts)
```

> **Always use `w$data` for subsequent analysis and mapping**, not the
> original `districts` object. This ensures row alignment between the
> spatial weights and your data, particularly when units have been
> excluded via the `disputed` argument.

## Disputed unit handling

Gilgit-Baltistan (GB) and Azad Jammu & Kashmir (AJK) are present in the
OCHA/HDX boundary data and share polygon edges with KP and Punjab. Under
the default (`disputed = "include"`) they participate in the neighbour
graph as normal administrative units.

The `disputed` argument lets analysts explicitly control whether these
units enter the spatial weights structure, which is useful for
sensitivity analysis when results may be influenced by their inclusion:

``` r
# Default: all units included
w_all <- pk_neighbors(districts)

# Exclude both GB and AJK
w_excl <- pk_neighbors(districts, disputed = "exclude_both")

# Exclude only Gilgit-Baltistan
w_no_gb <- pk_neighbors(districts, disputed = "exclude_gb")

# Exclude only Azad Jammu & Kashmir
w_no_ajk <- pk_neighbors(districts, disputed = "exclude_ajk")
```

When any units are excluded, `w$data` contains the subsetted `sf` object
with those units removed. Always pass `w$data` to downstream functions:

``` r
w_excl <- pk_neighbors(districts, disputed = "exclude_both")

# Use w_excl$data — not the original districts object
moran.test(w_excl$data$area_km2, w_excl$listw)
```

## Global Moran’s I (synthetic data)

The example below generates spatially autocorrelated synthetic data to
demonstrate the workflow. Replace `districts$synthetic_rate` with your
own variable — disease incidence rates, prevalence estimates, and so on.

``` r
set.seed(2023)

n     <- nrow(w$data)
rho   <- 0.6
W_mat <- listw2mat(w$listw)

epsilon               <- rnorm(n, mean = 50, sd = 10)
y                     <- as.numeric(solve(diag(n) - rho * W_mat) %*% epsilon)
w$data$synthetic_rate <- y

# Test for spatial autocorrelation
moran_result <- moran.test(w$data$synthetic_rate, w$listw)
print(moran_result)
```

A significant Moran’s I indicates that districts with similar rates tend
to cluster spatially rather than being arranged at random.

## Local Indicators of Spatial Association (LISA)

LISA identifies local clusters (High-High, Low-Low) and spatial
outliers:

``` r
lisa <- localmoran(w$data$synthetic_rate, w$listw)

w$data$lisa_i <- lisa[, 1]   # local I statistic
w$data$lisa_p <- lisa[, 5]   # p-value

w$data <- w$data |>
  mutate(
    cluster = case_when(
      lisa_p > 0.05                                          ~ "Not significant",
      synthetic_rate > mean(synthetic_rate) & lisa_i > 0    ~ "High-High",
      synthetic_rate < mean(synthetic_rate) & lisa_i > 0    ~ "Low-Low",
      lisa_i < 0                                             ~ "Outlier",
      TRUE                                                   ~ "Other"
    )
  )

ggplot2::ggplot(w$data) +
  ggplot2::geom_sf(ggplot2::aes(fill = cluster)) +
  ggplot2::scale_fill_manual(values = c(
    "High-High"       = "#d7191c",
    "Low-Low"         = "#2c7bb6",
    "Outlier"         = "#fdae61",
    "Not significant" = "#f0f0f0",
    "Other"           = "#cccccc"
  )) +
  ggplot2::theme_void() +
  ggplot2::labs(title = "LISA Cluster Map", fill = "Cluster type")
```

## Hotspot detection (Getis-Ord Gi\*)

Getis-Ord Gi\* identifies statistically significant hotspots and
coldspots based on the concentration of high or low values:

``` r
gi_star <- localG(w$data$synthetic_rate, w$listw)

w$data$gi_star <- as.numeric(gi_star)
w$data$hotspot <- case_when(
  w$data$gi_star >  1.96 ~ "Hotspot",
  w$data$gi_star < -1.96 ~ "Coldspot",
  TRUE                   ~ "Not significant"
)

pk_map(w$data, fill = "hotspot", title = "Hotspots (p < 0.05)")
```

## Sensitivity analysis: disputed units

To assess how much your results depend on the inclusion of GB and AJK,
compare Moran’s I under each treatment:

``` r
w_all  <- pk_neighbors(districts)
w_excl <- pk_neighbors(districts, disputed = "exclude_both")

# Attach the same variable to each subsetted dataset before comparing
moran_all  <- moran.test(w_all$data$area_km2,  w_all$listw)
moran_excl <- moran.test(w_excl$data$area_km2, w_excl$listw)

cat("Moran's I (all units):     ", round(moran_all$estimate[1],  4), "\n")
cat("Moran's I (GB + AJK excl):", round(moran_excl$estimate[1], 4), "\n")
```

If results differ materially, report both and document your choice of
boundary treatment explicitly in your methods section.

## Complete workflow

``` r
# 1. Get data
districts <- get_districts()

# 2. Build spatial weights
w <- pk_neighbors(districts)
# or, for sensitivity: pk_neighbors(districts, disputed = "exclude_both")

# 3. Attach your case data — always join to w$data, not districts
# w$data <- pk_join(w$data, your_case_data, by = "district_code")

# 4. Calculate rates
# w$data <- w$data |>
#   mutate(rate = cases / population * 100000)

# 5. Test for spatial autocorrelation
# moran.test(w$data$rate, w$listw)

# 6. Identify clusters
# lisa <- localmoran(w$data$rate, w$listw)
# w$data$lisa_cluster <- attr(lisa, "quadr")$mean

# 7. Map results
# pk_map(w$data, fill = "lisa_cluster")
```

## References

- Bivand, R. S., Pebesma, E., & Gomez-Rubio, V. (2013). *Applied spatial
  data analysis with R*. Springer.
- OCHA Pakistan. (2023). *COD-AB Administrative Boundaries*.
  <https://data.humdata.org/dataset/cod-ab-pak>
