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
#> Warning: cannot remove file '/tmp/RtmpEUIbZm/bslib-f4b5fbb2db3213a60c11f1cfb191924a', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpEUIbZm/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
