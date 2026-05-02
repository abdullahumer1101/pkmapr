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
#> Installed version: 0.3.0 
#> Latest version:    0.3.0 
#> You have the latest version
# }
```
