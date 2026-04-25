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
#> Warning: cannot remove file '/tmp/RtmpcgX6ta/bslib-9e62e0f721f5a1df2f7ed357a08894a4', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpcgX6ta/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
