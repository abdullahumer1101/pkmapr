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
#> ℹ Cache directory: /tmp/RtmpudMwTj
#> ℹ 11 file(s), 1.4 MB total
#>                                      file size_mb
#> 1  bslib-66d8d0a4fa4099423e77ec7d99cbab68    0.00
#> 2                                 downlit    0.00
#> 3                        file1e1812b56510    0.00
#> 4                        file1e1841559e7a    0.00
#> 5                         file1e184e0972d    0.00
#> 6                        file1e187fe65b02    0.00
#> 7             pak_country_simplified.gpkg    0.10
#> 8                      pak_dictionary.csv    0.04
#> 9           pak_districts_simplified.gpkg    0.38
#> 10          pak_provinces_simplified.gpkg    0.12
#> 11            pak_tehsils_simplified.gpkg    0.70
```
