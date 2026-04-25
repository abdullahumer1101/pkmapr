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
#> Warning: cannot remove file '/tmp/RtmpFdTsoo/bslib-1a6f4c39c1996288d505db42ecb2eeb0', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpFdTsoo/downlit', reason 'Directory not empty'
#> Removed 12 cached file(s).
```
