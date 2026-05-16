# pkmapr 1.4.0

* Added `palette` and `breaks` arguments to `pk_map()` for control over
  choropleth colour scales and legend break points.
* Added `gains`style = "idw" to `pk_neighbors()` for inverse distance weights.
* Added cross-reference to PakPC2023 (Yaseen et al.) for census indicator
  data.

# pkmapr 1.3.0

* version 1.2.1 is now on CRAN.
* Redesigned `pk_neighbors()`: the `disputed` argument now accepts
  `"include"` (default), `"exclude_both"`, `"exclude_gb"`, and
  `"exclude_ajk"`, giving analysts control over whether GB and AJK 
  participate in the spatial weights structure.
* `pk_neighbors()` now returns a `data` element containing the `sf` object
  used to build the weights, always in row-for-row alignment with `nb` and
  `listw`.
* Also polished all three vignettes.

# pkmapr 1.2.1

* Added missing `\value` tags to exported functions.
* Enhanced documentation with output structure and meaning.

# pkmapr 1.2.0

* Added extensive tests. Test coverage now at ~80%.

# pkmapr 1.1.1

* No functional changes.
* Added single quote marks to package names in DESCRIPTION.

# pkmapr 1.1.0

* Removed `simplified` parameter; data is now always the simplified version.
* Removed `refresh` parameter; data is now embedded in the package with no
  downloading required.
* Removed `pkmapr_cache_info()` and `pkmapr_clear_cache()`.
* Package size reduced.

# pkmapr 1.0.0

* First stable release.

# pkmapr 0.3.0

* New function `pk_version()`: checks the installed version against the
  latest GitHub release.
* New function `pk_search()`: searches across all admin levels with optional
  fuzzy matching.
* Province and district filters are now case-insensitive.
* Error messages now show valid options when a filter fails.
* Whitespace is automatically trimmed from filter inputs.
* Documentation updated to reflect case-insensitive and fuzzy matching usage.
* Added `jsonlite` to Imports.

# pkmapr 0.2.0

* Switched licence from MIT to GPL-3.
* Improved formatting and rendering on the pkgdown site.
* Expanded test coverage for core functions.
* Improved vignettes and function documentation.

# pkmapr 0.1.0

* Initial release.
