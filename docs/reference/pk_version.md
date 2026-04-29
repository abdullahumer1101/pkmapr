# Check package version and update status

Check package version and update status

## Usage

``` r
pk_version(quiet = FALSE)
```

## Arguments

- quiet:

  Logical. If FALSE (default), prints to console.

## Value

Invisibly, a list with installed and latest versions.

## Examples

``` r
# \donttest{
pk_version()
#> Warning: cannot open URL 'https://api.github.com/repos/abdullahumer1101/pkmapr/releases/latest': HTTP status was '403 Forbidden'
#> Installed version: 0.3.0 
#> Could not check latest version (check internet connection)
# }
```
