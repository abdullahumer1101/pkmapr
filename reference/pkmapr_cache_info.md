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
#> ℹ Cache directory: /tmp/RtmpFdTsoo
#> ℹ 12 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-1a6f4c39c1996288d505db42ecb2eeb0    0.00
#> 2                                 downlit    0.00
#> 3                        file1eb11eba550b    0.00
#> 4                        file1eb162fb9197    0.00
#> 5                        file1eb17058047a    0.00
#> 6                        file1eb17812d144    0.00
#> 7                         file1eb1c939202    0.00
#> 8             pak_country_simplified.gpkg    0.10
#> 9                      pak_dictionary.csv    0.04
#> 10          pak_districts_simplified.gpkg    0.38
#> 11          pak_provinces_simplified.gpkg    0.12
#> 12            pak_tehsils_simplified.gpkg    0.70
```
