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
#> ℹ Cache directory: /tmp/Rtmp2pPMiK
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-b9be9957212ac28821560406c772e229    0.00
#> 2                                 downlit    0.00
#> 3                        file1e6e120af017    0.00
#> 4                        file1e6e2d49fdb6    0.00
#> 5                        file1e6e7c0a9416    0.00
#> 6                        file1e6e7fd52302    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
