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
#> Warning: cannot remove file '/tmp/RtmpawkJrg/bslib-d9e8dc7c22442c86c4ce02102fb45b76', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpawkJrg/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
