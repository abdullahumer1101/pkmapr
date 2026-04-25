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
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpgZM5lh/Rf4f404b0c57e6', reason 'Permission denied'
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpgZM5lh/bslib-4fc2f69b3ab5aab986c84d53124598a7', reason 'Permission denied'
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpgZM5lh/downlit', reason 'Permission denied'
#> Removed 13 cached file(s).
```
