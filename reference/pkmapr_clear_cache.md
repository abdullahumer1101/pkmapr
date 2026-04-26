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
#> Warning: cannot remove file '/tmp/Rtmp0jF8aF/bslib-e492f3402403759c4214348c54b8e2ae', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/Rtmp0jF8aF/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
