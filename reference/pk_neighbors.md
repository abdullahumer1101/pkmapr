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

A named list:

- nb:

  A spdep nb object.

- listw:

  A row-standardised spdep listw object, ready for
  [`spdep::moran.test()`](https://r-spatial.github.io/spdep/reference/moran.test.html),
  `spdep::localMoran()`, `spatialreg::lagsarlm()`, and related
  functions.

- boundary_note:

  Character. Present only when disputed = "flag".

## Pakistan-specific handling

Gilgit-Baltistan and Azad Kashmir might break most spatial statistics.
The `disputed` argument controls how the Line of Control and special
administrative boundaries flagged in the OCHA source data are treated,
making the analytical decision explicit and reproducible.

## Examples

``` r
if (FALSE) { # interactive()
  districts <- get_districts()
  w <- pk_neighbors(districts)

  # Calculate Moran's I using spdep
  moran_result <- spdep::moran.test(districts$area_km2, w$listw)
}
```
