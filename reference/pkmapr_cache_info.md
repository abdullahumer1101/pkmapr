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
#> ℹ Cache directory: /tmp/RtmpxGm5ZM
#> ℹ 12 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-4197aca4c14f982ad7487cff5ce34b58    0.00
#> 2                                 downlit    0.00
#> 3                        file1e8213e3c29d    0.00
#> 4                        file1e823ce8bdc1    0.00
#> 5                        file1e8242fed3ca    0.00
#> 6                        file1e825ff4ba6b    0.00
#> 7                         file1e82f908527    0.00
#> 8             pak_country_simplified.gpkg    0.10
#> 9                      pak_dictionary.csv    0.04
#> 10          pak_districts_simplified.gpkg    0.38
#> 11          pak_provinces_simplified.gpkg    0.12
#> 12            pak_tehsils_simplified.gpkg    0.70
```
