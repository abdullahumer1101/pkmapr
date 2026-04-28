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
#> Warning: cannot remove file '/tmp/RtmpVyeRVj/bslib-c00c2dcff2a64cc060feac6cd88f9913', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpVyeRVj/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
