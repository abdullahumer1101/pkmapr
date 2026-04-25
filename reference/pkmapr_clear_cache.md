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
#> Warning: cannot remove file '/tmp/RtmpPGG0TA/bslib-751349890616073b9bd7fc6126b98eaf', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpPGG0TA/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
