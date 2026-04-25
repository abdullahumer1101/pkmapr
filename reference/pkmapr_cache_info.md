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
#> ℹ Cache directory: /tmp/RtmpZspY3T
#> ℹ 12 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-ee3058259cb51f25e9f3af63a7289cd7    0.00
#> 2                                 downlit    0.00
#> 3                        file1e3d27fce6fc    0.00
#> 4                        file1e3d49d0a2ca    0.00
#> 5                        file1e3d5d2fccd6    0.00
#> 6                        file1e3d769c2e4c    0.00
#> 7                         file1e3db161585    0.00
#> 8             pak_country_simplified.gpkg    0.10
#> 9                      pak_dictionary.csv    0.04
#> 10          pak_districts_simplified.gpkg    0.38
#> 11          pak_provinces_simplified.gpkg    0.12
#> 12            pak_tehsils_simplified.gpkg    0.70
```
