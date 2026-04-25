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
#> Warning: cannot remove file '/tmp/RtmpxGm5ZM/bslib-4197aca4c14f982ad7487cff5ce34b58', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpxGm5ZM/downlit', reason 'Directory not empty'
#> Removed 12 cached file(s).
```
