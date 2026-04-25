# Create buffers around sf geometries in km

Reprojects to UTM Zone 42N internally so buffer distances are in
kilometres, then returns buffers in the original CRS.

## Usage

``` r
pak_buffer(x, dist_km)
```

## Arguments

- x:

  An sf object.

- dist_km:

  Numeric. Buffer distance in kilometres.

## Value

An sf object with buffered geometries in the same CRS as input.

## Examples

``` r
# \donttest{
  districts <- get_districts()
  buffered  <- pak_buffer(districts, dist_km = 10)
# }
```
