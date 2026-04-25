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
#> ℹ Cache directory: /tmp/RtmpawkJrg
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-d9e8dc7c22442c86c4ce02102fb45b76    0.00
#> 2                                 downlit    0.00
#> 3                        file20af22be52d0    0.00
#> 4                        file20af470ad5ba    0.00
#> 5                        file20af72af1604    0.00
#> 6                        file20af73529ab8    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
