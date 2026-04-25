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
#> Warning: cannot remove file '/tmp/Rtmpa5F6DJ/bslib-45232b6e0c79b8de14adc9be985d91be', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/Rtmpa5F6DJ/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
