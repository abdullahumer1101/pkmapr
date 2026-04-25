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
#> Warning: cannot remove file '/tmp/Rtmp2pPMiK/bslib-b9be9957212ac28821560406c772e229', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/Rtmp2pPMiK/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
