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
#> Warning: cannot remove file '/tmp/Rtmpdf2YhI/bslib-97024bfd36fcb99dc2131d0822e87cd8', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/Rtmpdf2YhI/downlit', reason 'Directory not empty'
#> Removed 11 cached file(s).
```
