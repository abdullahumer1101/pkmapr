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
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpMNCiud/Rf52a824534159', reason 'Permission denied'
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpMNCiud/bslib-2703b592db09c07656d706c37c87dd9a', reason 'Permission denied'
#> Warning: cannot remove file 'C:\Users\abdul\AppData\Local\Temp\RtmpMNCiud/downlit', reason 'Permission denied'
#> Removed 9 cached file(s).
```
