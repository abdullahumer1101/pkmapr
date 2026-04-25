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
#> ℹ Cache directory: /tmp/RtmpH5udrT
#> ℹ 12 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-4f49fc3caff649e67d463f2593756cc5    0.00
#> 2                                 downlit    0.00
#> 3                        file1e5d201792e0    0.00
#> 4                        file1e5d266fe0c5    0.00
#> 5                        file1e5d59add05c    0.00
#> 6                        file1e5d6f321545    0.00
#> 7                        file1e5d7668386c    0.00
#> 8             pak_country_simplified.gpkg    0.10
#> 9                      pak_dictionary.csv    0.04
#> 10          pak_districts_simplified.gpkg    0.38
#> 11          pak_provinces_simplified.gpkg    0.12
#> 12            pak_tehsils_simplified.gpkg    0.70
```
