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
#> Warning: cannot remove file '/tmp/RtmpZspY3T/bslib-ee3058259cb51f25e9f3af63a7289cd7', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpZspY3T/downlit', reason 'Directory not empty'
#> Removed 12 cached file(s).
```
