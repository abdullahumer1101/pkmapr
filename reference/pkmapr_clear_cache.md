# Clear the pkmapr cache

Deletes all locally cached files. They will be re-downloaded on the next
function call.

## Usage

``` r
pkmapr_clear_cache()
```

## Value

NULL, invisibly.

## Examples

``` r
pkmapr_clear_cache()
#> Warning: cannot remove file '/tmp/RtmpudMwTj/bslib-66d8d0a4fa4099423e77ec7d99cbab68', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpudMwTj/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
