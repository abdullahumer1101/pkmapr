# Join data to a pkmapr sf object with match checking

Performs a left join. Join by code columns (e.g. district_code) rather
than name columns wherever possible.

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

## Note

After joining, always inspect `names(result)` to check for column name
conflicts. If your data shares column names with the spatial object
(e.g., `province_name`, `district_name`), both versions will be
preserved with `.x` and `.y` suffixes. Rename or select the appropriate
columns before further analysis.

## Examples

``` r
  districts <- get_districts()
  my_data   <- data.frame(district_code = "PK603", value = 42)
  joined    <- pk_join(districts, my_data, by = "district_code")
```
