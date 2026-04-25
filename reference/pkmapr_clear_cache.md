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
#> Warning: cannot remove file '/tmp/Rtmpjd01Oi/bslib-fd5a49acd4461918481ab677ad624fb7', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/Rtmpjd01Oi/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
