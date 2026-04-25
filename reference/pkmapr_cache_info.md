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
#> ℹ Cache directory: /tmp/RtmpeeAhIv
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-6b280c012ef0e602e0d8ef690e12db2e    0.00
#> 2                                 downlit    0.00
#> 3                        file1d50112c477f    0.00
#> 4                        file1d501b065c19    0.00
#> 5                        file1d5028a7a4f0    0.00
#> 6                        file1d50676ad602    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
