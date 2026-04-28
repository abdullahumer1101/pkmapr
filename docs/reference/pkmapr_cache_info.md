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
#> ℹ Cache directory: C:\Users\abdul\AppData\Local\Temp\RtmpMNCiud
#> ℹ 9 file(s), 1.3 MB total
#>                                     file size_mb
#> 1                          Rf52a85d7145c    0.00
#> 2 bslib-2703b592db09c07656d706c37c87dd9a    0.00
#> 3                                downlit    0.00
#> 4                       file52a821ae2f67    0.00
#> 5                       file52a87ef4235a    0.00
#> 6            pak_country_simplified.gpkg    0.10
#> 7          pak_districts_simplified.gpkg    0.38
#> 8          pak_provinces_simplified.gpkg    0.12
#> 9            pak_tehsils_simplified.gpkg    0.70
```
