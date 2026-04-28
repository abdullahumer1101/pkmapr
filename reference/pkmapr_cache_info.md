# Show pkmapr cache information

Displays the cache directory location and lists files currently stored.

## Usage

``` r
pkmapr_cache_info()
```

## Value

A data frame of cached files and sizes, returned invisibly.

## Examples

``` r
pkmapr_cache_info()
#> ℹ Cache directory: '[TEMP]'
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-c00c2dcff2a64cc060feac6cd88f9913    0.00
#> 2                                 downlit    0.00
#> 3                        file1e2b392c6af2    0.00
#> 4                        file1e2b3a611dbf    0.00
#> 5                        file1e2b4bd214b6    0.00
#> 6                        file1e2b6cd2c1f8    0.00
#> 7              pk_country_simplified.gpkg    0.10
#> 8                       pk_dictionary.csv    0.04
#> 9            pk_districts_simplified.gpkg    0.38
#> 10           pk_provinces_simplified.gpkg    0.12
#> 11             pk_tehsils_simplified.gpkg    0.70
```
