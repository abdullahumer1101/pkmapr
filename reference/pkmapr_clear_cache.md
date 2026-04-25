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
#> Warning: cannot remove file '/tmp/RtmpIlE8CM/bslib-bfee931d2480ed4d2919dad72dd84f4a', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpIlE8CM/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
