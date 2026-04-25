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
#> ℹ Cache directory: /tmp/Rtmp1Ixrqv
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-ca7527d26874b8fcd8c7dd9cf6e0d9c7    0.00
#> 2                                 downlit    0.00
#> 3                        file1dd8199f62ec    0.00
#> 4                        file1dd85bf9ec68    0.00
#> 5                        file1dd862fa46d1    0.00
#> 6                        file1dd87e4b0d04    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
