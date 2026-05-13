# Introduction to pkmapr

``` r

library(pkmapr)
```

This vignette covers loading boundary data, looking up official names,
joining your own data, and producing static and interactive maps.

## Installation

Install pkmapr from CRAN:

``` r

install.packages("pkmapr")
```

Or install the development version from GitHub:

``` r

remotes::install_github("abdullahumer1101/pkmapr")
```

## Your first map

Retrieve province boundaries and produce a map in two lines:

``` r

provinces <- get_provinces()
pk_map(provinces)
```

## Look up names before joining

Official administrative names in the OCHA/HDX data may differ from
common spellings. Use
[`pk_dictionary()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_dictionary.md)
to confirm names and codes before filtering or joining:

``` r

# All provinces with their codes
pk_dictionary("provinces")

# Districts in Punjab
pk_dictionary("districts", province = "Punjab")

# Tehsils in Lahore district
pk_dictionary("tehsils", district = "Lahore")
```

## Join your own data

[`pk_join()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_join.md)
merges a data frame into an `sf` object by a shared code column, keeping
geometries intact:

``` r

library(dplyr)

my_data <- data.frame(
  district_code = c("PK603", "PK604"),
  value         = c(42, 37)
)

districts <- get_districts() |>
  pk_join(my_data, by = "district_code")

pk_map(districts, fill = "value", title = "My Values")
```

## Interactive maps

[`pk_map_interactive()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_map_interactive.md)
produces a leaflet map with popups:

``` r

pk_map_interactive(
  districts,
  fill  = "value",
  popup = c("district_name", "value")
)
```

## Next steps

- [`vignette("spatial-analysis-pkmapr")`](https://abdullahumer1101.github.io/pkmapr/articles/spatial-analysis-pkmapr.md)
  — buffers, centroids, and point-in-polygon operations
- [`vignette("epidemiology-pkmapr")`](https://abdullahumer1101.github.io/pkmapr/articles/epidemiology-pkmapr.md)
  — spatial autocorrelation, LISA clusters, and hotspot detection
