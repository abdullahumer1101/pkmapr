# Join data to a pkmapr sf object with match checking

Performs a left join and warns explicitly when values in your data do
not match any administrative code, naming the unmatched values and
directing to
[`pk_dictionary()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_dictionary.md)
for resolution.

## Usage

``` r
pk_join(spatial, data, by)
```

## Arguments

- spatial:

  An sf object from a pkmapr geometry function.

- data:

  A data frame to join.

- by:

  Character. Column name present in both spatial and data.

## Value

The spatial sf object with data columns joined.

## Details

Join by code columns (e.g. district_code) rather than name columns
wherever possible. Codes are stable identifiers; names can have minor
spacing or capitalisation differences that cause silent failures.

## Examples

``` r
# \donttest{
  districts <- get_districts()
  my_data   <- data.frame(district_code = "PK603", value = 42)
  joined    <- pk_join(districts, my_data, by = "district_code")
#> Error in pk_join(districts, my_data, by = "district_code"): could not find function "pk_join"
# }
```
