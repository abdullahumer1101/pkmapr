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
#> ℹ Cache directory: /tmp/RtmpsRSs0v
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-c00c2dcff2a64cc060feac6cd88f9913    0.00
#> 2                                 downlit    0.00
#> 3                        file1df9259c88bb    0.00
#> 4                        file1df95de5ed86    0.00
#> 5                         file1df96067959    0.00
#> 6                        file1df971a423ed    0.00
#> 7              pk_country_simplified.gpkg    0.10
#> 8                       pk_dictionary.csv    0.04
#> 9            pk_districts_simplified.gpkg    0.38
#> 10           pk_provinces_simplified.gpkg    0.12
#> 11             pk_tehsils_simplified.gpkg    0.70
```
