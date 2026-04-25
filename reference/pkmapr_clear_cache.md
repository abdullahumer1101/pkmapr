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
#> Warning: cannot remove file '/tmp/RtmpeeAhIv/bslib-6b280c012ef0e602e0d8ef690e12db2e', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpeeAhIv/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
