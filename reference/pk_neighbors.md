# Construct a spatial neighbours list for Pakistan administrative units

Builds a contiguity or distance-based spatial neighbours structure for
direct use with spdep and spatialreg. Handles Pakistan-specific
complexities including non-contiguous units and disputed boundaries.

## Usage

``` r
pk_neighbors(
  x,
  style = c("queen", "rook", "knn"),
  k = NULL,
  disputed = c("exclude", "include", "flag")
)
```

## Arguments

- x:

  An sf object with polygon geometries.

- style:

  Character. Neighbour definition: "queen" (shared boundary point,
  default), "rook" (shared edge), or "knn" (k nearest centroids).

- k:

  Integer. Number of nearest neighbours. Required when `style = "knn"`.

- disputed:

  Character. Treatment of non-contiguous units and disputed boundaries:

  exclude

  :   Default. Non-contiguous units receive one nearest neighbour as
      fallback. An informative message identifies affected units.

  include

  :   Treat all boundaries as normal shared boundaries.

  flag

  :   Include all boundaries but add a boundary_note element to the
      result documenting which units are affected.

## Value

Returns a named list (class "list") with the following:

- nb:

  An spdep nb object (class "nb") containing the neighbour
  relationships. Each element is an integer vector of neighbour indices.

- listw:

  A row-standardised spdep listw object (class "listw"), ready for
  [`spdep::moran.test()`](https://r-spatial.github.io/spdep/reference/moran.test.html),
  `spdep::localMoran()`,
  [`spatialreg::lagsarlm()`](https://r-spatial.github.io/spatialreg/reference/ML_models.html),
  and related spatial analysis functions. The weights are
  row-standardized (style = "W") with zero.policy = TRUE.

- boundary_note:

  Character string. Present only when `disputed = "flag"`. Contains
  documentation of which units involve disputed or special
  administrative boundaries.

The output is a complete spatial weights structure for use in spatial
autocorrelation tests (Moran's I), local indicators of spatial
association (LISA), and spatial regression models (SAR, SEM, etc.). The
`nb` defines the neighbour graph; the `listw` provides the
row-standardized weights matrix.

## Pakistan-specific handling

Gilgit-Baltistan and Azad Kashmir might break some spatial statistics.
The `disputed` argument controls how the Line of Control and special
administrative boundaries flagged in the OCHA source data are treated,
offering better control over analytical decisions.

## Examples

``` r
# \donttest{
  districts <- get_districts()
  w <- pk_neighbors(districts)

  # Calculate Moran's I using spdep
  moran_result <- spdep::moran.test(districts$area_km2, w$listw)
  print(moran_result)
#> 
#>  Moran I test under randomisation
#> 
#> data:  districts$area_km2  
#> weights: w$listw    
#> 
#> Moran I statistic standard deviate = 9.7714, p-value < 2.2e-16
#> alternative hypothesis: greater
#> sample estimates:
#> Moran I statistic       Expectation          Variance 
#>       0.455579101      -0.006289308       0.002234218 
#> 

  # Queen contiguity (default)
  w_queen <- pk_neighbors(districts, style = "queen")

  # K-nearest neighbours (k=5)
  w_knn <- pk_neighbors(districts, style = "knn", k = 5)
#> Warning: st_centroid assumes attributes are constant over geometries

  # Flag disputed boundaries for documentation
  w_flagged <- pk_neighbors(districts, disputed = "flag")
  if (!is.null(w_flagged$boundary_note)) cat(w_flagged$boundary_note)
# }
```
