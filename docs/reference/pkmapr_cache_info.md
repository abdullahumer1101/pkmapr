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
#> ℹ Cache directory: C:\Users\abdul\AppData\Local\Temp\RtmpgZM5lh
#> ℹ 13 file(s), 1.4 MB total
#>                                      file size_mb
#> 1                          Rf4f4074785052    0.00
#> 2  bslib-4fc2f69b3ab5aab986c84d53124598a7    0.00
#> 3                                 downlit    0.00
#> 4                        file4f40126d7102    0.00
#> 5                        file4f402eef2f17    0.00
#> 6                        file4f40384e6e46    0.00
#> 7                        file4f40570a6048    0.00
#> 8                        file4f4068691002    0.00
#> 9             pak_country_simplified.gpkg    0.10
#> 10                     pak_dictionary.csv    0.04
#> 11          pak_districts_simplified.gpkg    0.38
#> 12          pak_provinces_simplified.gpkg    0.12
#> 13            pak_tehsils_simplified.gpkg    0.70
```
