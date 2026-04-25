# intro-to-pkmapr

``` r
library(pkmapr)
```

## Installation

Install pkmapr from GitHub:

``` r
remotes::install_github("abdullahumer1101/pkmapr")
```

Once R-Universe is ready:

``` r
# install.packages("pkmapr", repos = "https://abdullahumer1101.r-universe.dev")
```

## Your first map

Get province boundaries and create a quick map:

``` r
provinces <- get_provinces()
pak_map(provinces)
```

## Look up names before joining

Always check official names before filtering or joining:

``` r
# All provinces with their codes
pak_dictionary("provinces")

# Districts in Punjab
pak_dictionary("districts", province = "Punjab")

# Tehsils in Lahore district
pak_dictionary("tehsils", district = "Lahore")
```

## Join your own data

``` r
library(dplyr)

# Example: district-level data
my_data <- data.frame(
  district_code = c("PK603", "PK604"),
  value = c(42, 37)
)

districts <- get_districts() |>
  pak_join(my_data, by = "district_code")

# Map the result
pak_map(districts, fill = "value", title = "My Values")
```

## Interactive maps

``` r
pak_map_interactive(districts, 
                    fill = "value",
                    popup = c("district_name", "value"))
```

## Next steps

- [`vignette("spatial-analysis-pkmapr")`](https://abdullahumer1101.github.io/pkmapr/articles/spatial-analysis-pkmapr.md)
  for buffers, centroids, and point-in-polygon
- [`vignette("epidemiology-pkmapr")`](https://abdullahumer1101.github.io/pkmapr/articles/epidemiology-pkmapr.md)
  for spatial autocorrelation and hotspots
