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
#> ℹ Cache directory: /tmp/RtmpIlE8CM
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-bfee931d2480ed4d2919dad72dd84f4a    0.00
#> 2                                 downlit    0.00
#> 3                        file1e2714034ff0    0.00
#> 4                        file1e27366e3257    0.00
#> 5                        file1e2743da70b9    0.00
#> 6                        file1e274b5c7051    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
