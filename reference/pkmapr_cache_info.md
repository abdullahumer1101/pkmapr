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
#> ℹ Cache directory: /tmp/Rtmp0jF8aF
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-e492f3402403759c4214348c54b8e2ae    0.00
#> 2                                 downlit    0.00
#> 3                         file1e814291ea7    0.00
#> 4                        file1e8144382a02    0.00
#> 5                        file1e817431ed59    0.00
#> 6                        file1e817fbf09d8    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
