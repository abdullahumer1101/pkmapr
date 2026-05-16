# Check package version and update status

Compares the installed version of pkmapr with the latest release
available on GitHub.

## Usage

``` r
pk_version(quiet = FALSE)
```

## Arguments

- quiet:

  Logical. If FALSE (default), prints status messages to console. If
  TRUE, returns the version information silently.

## Value

Returns invisibly a list (class "list") with the following components:

- installed:

  Character string. The currently installed version number.

- latest:

  Character string or NA. The latest version number from GitHub, or NA
  if the check failed (e.g., no internet connection).

## Examples

``` r
# \donttest{
pk_version()
#> Installed version: 1.4.0 
#> Latest version:    1.3.0 
#> Update available! Run: remotes::install_github('abdullahumer1101/pkmapr')

# Silent mode for programmatic use
vers <- pk_version(quiet = TRUE)
if (!is.na(vers$latest) && vers$installed != vers$latest) {
  message("Update recommended!")
}
#> Update recommended!
# }
```
