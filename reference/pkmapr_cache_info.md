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
#> ℹ Cache directory: /tmp/RtmpgMlYAR
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-8a92d22979ec96a3105b4f8cbcdeeec5    0.00
#> 2                                 downlit    0.00
#> 3                        file1e1e47662dc6    0.00
#> 4                        file1e1e541d95dc    0.00
#> 5                        file1e1e6e294498    0.00
#> 6                         file1e1e7f9c4c8    0.00
#> 7              pk_country_simplified.gpkg    0.10
#> 8                       pk_dictionary.csv    0.04
#> 9            pk_districts_simplified.gpkg    0.38
#> 10           pk_provinces_simplified.gpkg    0.12
#> 11             pk_tehsils_simplified.gpkg    0.70
```
