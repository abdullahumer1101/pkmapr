# Look up Pakistan administrative unit names and codes

Returns a tibble of official administrative unit names and PBS geocodes
from the OCHA/HDX source. Use this to find the exact names and codes
expected by geometry functions and
[`pk_join()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_join.md)
before attempting joins or filters.

## Usage

``` r
pk_dictionary(
  level = c("provinces", "districts", "tehsils"),
  province = NULL,
  district = NULL,
  refresh = FALSE
)
```

## Arguments

- level:

  Character. Administrative level. One of "provinces", "districts", or
  "tehsils".

- province:

  Character. Filter to a specific province. Applies when level is
  "districts" or "tehsils". NULL returns all.

- district:

  Character. Filter to a specific district. Applies when level is
  "tehsils". NULL returns all.

- refresh:

  Logical. Force re-download. Default FALSE.

## Value

A tibble.

## Examples

``` r
# \donttest{
  pk_dictionary("provinces")
#> Error in pk_dictionary("provinces"): could not find function "pk_dictionary"
  pk_dictionary("districts", province = "Punjab")
#> Error in pk_dictionary("districts", province = "Punjab"): could not find function "pk_dictionary"
  pk_dictionary("tehsils", district = "Lahore")
#> Error in pk_dictionary("tehsils", district = "Lahore"): could not find function "pk_dictionary"
  pk_dictionary("tehsils", province = "Sindh")
#> Error in pk_dictionary("tehsils", province = "Sindh"): could not find function "pk_dictionary"
# }
```
