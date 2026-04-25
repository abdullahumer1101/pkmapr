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
#> Warning: cannot remove file '/tmp/RtmpH5udrT/bslib-4f49fc3caff649e67d463f2593756cc5', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpH5udrT/downlit', reason 'Directory not empty'
#> Removed 12 cached file(s).
```
