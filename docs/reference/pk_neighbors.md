# Construct a spatial neighbours list for Pakistan administrative units

Builds a contiguity or distance-based spatial neighbours structure for
direct use with `spdep` and `spatialreg`.

## Usage

``` r
pk_neighbors(
  x,
  style = c("queen", "rook", "knn", "idw"),
  k = NULL,
  disputed = c("include", "exclude_both", "exclude_gb", "exclude_ajk")
)
```

## Arguments

- x:

  An `sf` object with polygon geometries, typically the output of
  [`get_districts()`](https://abdullahumer1101.github.io/pkmapr/reference/get_districts.md)
  or
  [`get_provinces()`](https://abdullahumer1101.github.io/pkmapr/reference/get_provinces.md).

- style:

  Character. Neighbour definition: `"queen"` (shared boundary point,
  default), `"rook"` (shared edge), `"knn"` (k nearest centroids), or
  `"idw"` (inverse distance weights).

- k:

  Integer. Number of nearest neighbours. Required when `style = "knn"`.

- disputed:

  Character. Controls whether Gilgit-Baltistan and/or Azad Jammu &
  Kashmir are included in the spatial weights structure:

  `"include"`

  :   Default. Both units are treated as normal administrative units and
      participate in the neighbour graph.

  `"exclude_both"`

  :   Both GB and AJK are dropped from `x` before building the weights.
      The returned `data` element contains the subsetted `sf` object.

  `"exclude_gb"`

  :   Only Gilgit-Baltistan is dropped.

  `"exclude_ajk"`

  :   Only Azad Jammu & Kashmir is dropped.

## Value

A named list with the following elements:

- `nb`:

  An `spdep` `nb` object containing the neighbour relationships. Each
  element is an integer vector of neighbour indices.

- `listw`:

  A row-standardised `spdep` `listw` object (style = `"W"`,
  `zero.policy = TRUE`), ready for
  [`spdep::moran.test()`](https://r-spatial.github.io/spdep/reference/moran.test.html),
  [`spdep::localmoran()`](https://r-spatial.github.io/spdep/reference/localmoran.html),
  [`spatialreg::lagsarlm()`](https://r-spatial.github.io/spatialreg/reference/ML_models.html),
  and related functions.

- `data`:

  The `sf` object used to build the weights. Identical to the input `x`
  when `disputed = "include"`. When any units are excluded this is the
  subsetted `sf`, always in row-for-row alignment with `nb` and `listw`.
  Always use `w$data` rather than the original input when mapping or
  attaching analysis results.

## Disputed units

GB and AJK are present in the OCHA/HDX boundary data and share polygon
edges with KP and Punjab, so under `disputed = "include"` (the default)
they participate in the neighbour graph as normal administrative units.
Use `"exclude_gb"`, `"exclude_ajk"`, or `"exclude_both"` to drop one or
both units before building the weights. The returned `data` element is
always the `sf` object actually used to build the weights — identical to
the input when `disputed = "include"`, subsetted otherwise. Always use
`w$data` rather than the original input for all subsequent analysis and
mapping, regardless of which `disputed` option is chosen.

## Examples

``` r
# \donttest{
  districts <- get_districts()

  # Default: all units included
  w <- pk_neighbors(districts)
  moran_result <- spdep::moran.test(w$data$area_km2, w$listw)
  print(moran_result)
#> 
#>  Moran I test under randomisation
#> 
#> data:  w$data$area_km2  
#> weights: w$listw    
#> 
#> Moran I statistic standard deviate = 9.7714, p-value < 2.2e-16
#> alternative hypothesis: greater
#> sample estimates:
#> Moran I statistic       Expectation          Variance 
#>       0.455579101      -0.006289308       0.002234218 
#> 

  # Rook contiguity
  w_rook <- pk_neighbors(districts, style = "rook")

  # K-nearest neighbours (k = 5)
  w_knn <- pk_neighbors(districts, style = "knn", k = 5)
#> Warning: st_centroid assumes attributes are constant over geometries

  # Inverse distance weights
  w_idw <- pk_neighbors(districts, style = "idw")
#> Warning: st_centroid assumes attributes are constant over geometries

  # Exclude both GB and AJK for sensitivity analysis
  w_excl <- pk_neighbors(districts, disputed = "exclude_both")
  # Use w_excl$data — not the original districts — for subsequent analysis
  moran_excl <- spdep::moran.test(w_excl$data$area_km2, w_excl$listw)

  # Exclude only Gilgit-Baltistan
  w_no_gb <- pk_neighbors(districts, disputed = "exclude_gb")

  # Exclude only Azad Jammu & Kashmir
  w_no_ajk <- pk_neighbors(districts, disputed = "exclude_ajk")
# }
```
