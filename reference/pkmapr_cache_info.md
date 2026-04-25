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
#> ℹ Cache directory: /tmp/Rtmpa5F6DJ
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-45232b6e0c79b8de14adc9be985d91be    0.00
#> 2                                 downlit    0.00
#> 3                        file1e25151019a2    0.00
#> 4                        file1e255eebfdb0    0.00
#> 5                        file1e25626ae698    0.00
#> 6                         file1e25e566dab    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
