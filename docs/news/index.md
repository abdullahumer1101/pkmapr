# Changelog

## pkmapr v1.1.0

- Removed `simplified` parameter (data is now always the simplified
  version)
- Removed `refresh` parameter (data is now embedded in the package, no
  downloading)
- Removed `pkmapr_cache_info()` and `pkmapr_clear_cache()`
- Package size reduced

## pkmapr v1.0.0

- Testing edge cases.
- First stable release.

## pkmapr v0.3.0

- New functions:
  [`pk_version()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_version.md)
  checks installed version against latest GitHub release,
  [`pk_search()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_search.md)
  searches across all admin levels with optional fuzzy matching
- Enhancements: Province and district filters are now case-insensitive,
  error messages show valid options when a filter fails, whitespace is
  automatically trimmed from filter inputs
- Documentation: Added notes about case insensitivity, fuzzy matching,
  and also updated examples to show case-insensitive usage
- Dependencies: Added `jsonlite` to Imports (used by
  [`pk_version()`](https://abdullahumer1101.github.io/pkmapr/reference/pk_version.md))

## pkmapr 0.2.0

- Switched licence from MIT to GPL-3.
- Improved formatting and rendering on the pkgdown site.
- Expanded test coverage for core functions.
- Improved vignettes and function documentation.

## pkmapr 0.1.

- Initial release.
