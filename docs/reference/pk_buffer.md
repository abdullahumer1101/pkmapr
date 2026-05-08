# Create buffers around sf geometries in km

Reprojects to UTM Zone 42N internally so buffer distances are in
kilometres, then returns buffers in the original CRS.

## Usage

``` r
pk_buffer(x, dist_km)
```

## Arguments

- x:

  An sf object.

- dist_km:

  Numeric. Buffer distance in kilometres.

## Value

Returns an sf object with the same attributes as `x` but with geometries
transformed to buffers of radius `dist_km` kilometres.

The output CRS is identical to the input CRS (reprojected back from UTM
Zone 42N after buffering). This ensures buffers are circular in
projected space with accurate kilometre distances.

## Examples

``` r
districts <- get_districts()
buffered <- pk_buffer(districts, dist_km = 10)
```
