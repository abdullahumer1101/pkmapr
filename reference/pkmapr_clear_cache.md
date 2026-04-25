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
#> Warning: cannot remove file '/tmp/Rtmp1Ixrqv/bslib-ca7527d26874b8fcd8c7dd9cf6e0d9c7', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/Rtmp1Ixrqv/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
