# Join data to a pkmapr sf object with match checking

Performs a left join of external data to a pkmapr spatial object, with
automatic validation of matching keys. Uses code columns (e.g.,
district_code, tehsil_code, province_code) wherever possible to ensure
reliable joins even when names change or have spelling variations.

## Usage

``` r
pk_join(spatial, data, by)
```

## Arguments

- spatial:

  An sf object from a pkmapr geometry function (e.g.,
  [`get_districts()`](https://abdullahumer1101.github.io/pkmapr/reference/get_districts.md),
  [`get_tehsils()`](https://abdullahumer1101.github.io/pkmapr/reference/get_tehsils.md),
  [`get_provinces()`](https://abdullahumer1101.github.io/pkmapr/reference/get_provinces.md)).

- data:

  A data frame to join. Must contain the column specified in `by`.

- by:

  Character. Column name present in both spatial and data. Recommended
  to use code columns (`district_code`, `tehsil_code`, `province_code`)
  rather than name columns for more reliable matching.

## Value

Returns the spatial sf object (class "sf" and "data.frame") with all
columns from `data` joined to the matching rows.

The output preserves:

- geometry:

  The original spatial geometries unchanged

- spatial_attributes:

  All original columns from the spatial object

- data_columns:

  All columns from `data` appended to matching rows

Rows in `data` that do not match any spatial unit generate a warning and
receive NA values for spatial attributes in the joined result. Rows in
the spatial object that have no match in `data` retain their original
attributes but receive NA for the joined data columns.

## Note

After joining, always inspect `names(result)` to check for column name
conflicts. If your data shares column names with the spatial object
(e.g., `province_name`, `district_name`), both versions will be
preserved with `.x` and `.y` suffixes. Rename or select the appropriate
columns before further analysis.

## Examples

``` r
districts <- get_districts()
my_data <- data.frame(district_code = "PK603", value = 42)
joined <- pk_join(districts, my_data, by = "district_code")
print(names(joined))
#> [1] "province_name" "district_name" "district_code" "area_km2"     
#> [5] "value"         "geom"         

# Example with missing match (generates warning)
# \donttest{
  bad_data <- data.frame(district_code = c("PK603", "INVALID_CODE"), value = c(42, 99))
  joined_bad <- pk_join(districts, bad_data, by = "district_code")
#> Warning: 1 value(s) in your data did not match any district_code.
#> ℹ Unmatched: "INVALID_CODE"
#> ℹ Run `pk_dictionary()` to check correct codes and names.
#> ℹ These rows will have NA values in the joined result.
# }
```
