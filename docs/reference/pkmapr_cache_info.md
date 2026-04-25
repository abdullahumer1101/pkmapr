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
#> ℹ Cache directory: C:\Users\abdul\AppData\Local\Temp\RtmpG4J0jF
#> ℹ 14 file(s), 1.4 MB total
#>                                      file size_mb
#> 1                           Rf45cc3ea2384    0.00
#> 2  bslib-4fc2f69b3ab5aab986c84d53124598a7    0.00
#> 3                                 downlit    0.00
#> 4                        file45cc18425448    0.00
#> 5                        file45cc3aee6438    0.00
#> 6                        file45cc6baa4048    0.00
#> 7                         file45cc72fb735    0.00
#> 8                        file45cc79106e33    0.00
#> 9                        file45cc7b8e29c5    0.00
#> 10            pak_country_simplified.gpkg    0.10
#> 11                     pak_dictionary.csv    0.04
#> 12          pak_districts_simplified.gpkg    0.38
#> 13          pak_provinces_simplified.gpkg    0.12
#> 14            pak_tehsils_simplified.gpkg    0.70
```
