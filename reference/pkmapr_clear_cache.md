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
#> Warning: cannot remove file '/tmp/RtmpwVvxc9/bslib-9fb06ca8b38545299edd6f7aec8cc523', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpwVvxc9/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
