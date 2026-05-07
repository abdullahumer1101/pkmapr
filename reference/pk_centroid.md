# Extract centroids from an sf object

Returns polygon centroids as a point sf object with only geometry
(attributes are dropped to avoid warnings about constant attributes).

## Usage

``` r
pk_centroid(x)
```

## Arguments

- x:

  An sf object with polygon geometries.

## Value

Returns an sf point object (class "sf") with:

- geometry:

  Point geometries representing the centroids of input polygons

Centroids represent the geometric center of each polygon, useful for
point-based visualisation, distance calculations, or as nodes for
spatial network analysis.

## Examples

``` r
districts <- get_districts()
centres <- pk_centroid(districts)
plot(centres)
```
