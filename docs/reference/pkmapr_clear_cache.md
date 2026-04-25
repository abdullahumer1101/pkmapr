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
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpG4J0jF/Rf45cc3da94bca', reason 'Permission denied'
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpG4J0jF/bslib-4fc2f69b3ab5aab986c84d53124598a7', reason 'Permission denied'
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpG4J0jF/downlit', reason 'Permission denied'
#> Removed 14 cached file(s).
```
