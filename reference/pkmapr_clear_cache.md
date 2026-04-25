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
#> Warning: cannot remove file '/tmp/RtmpCyEvnu/bslib-5f0ad8346f67c3c40437767271161924', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpCyEvnu/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
