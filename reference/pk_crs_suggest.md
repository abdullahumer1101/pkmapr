# Suggest an appropriate projected CRS for a Pakistan sf object

Examines the geographic extent of an sf object and recommends the most
appropriate projected coordinate reference system for metric operations.
Pakistan spans UTM zones 41N, 42N, and 43N; national-level analyses
benefit from an equal-area projection.

## Usage

``` r
pk_crs_suggest(x)
```

## Arguments

- x:

  An sf object.

## Value

A named list:

- epsg:

  Integer EPSG code for the recommended CRS.

- name:

  Human-readable CRS name.

- rationale:

  One-sentence explanation of the recommendation.

## Details

Using WGS84 (EPSG:4326) for distance, area, or buffer operations
produces inaccurate results as it measures in degrees rather than
metres.

## Examples

``` r
# \donttest{
  pk_crs_suggest(get_country())
#> $epsg
#> [1] 102025
#> 
#> $name
#> [1] "Asia South Albers Equal Area Conic (ESRI:102025)"
#> 
#> $rationale
#> [1] "Extent covers a large portion of Pakistan; Albers Equal Area Conic is recommended by OCHA for national-level Pakistan analyses and minimises area distortion across the full country."
#> 
  pk_crs_suggest(get_districts(province = "Balochistan"))
#> $epsg
#> [1] 102025
#> 
#> $name
#> [1] "Asia South Albers Equal Area Conic (ESRI:102025)"
#> 
#> $rationale
#> [1] "Extent covers a large portion of Pakistan; Albers Equal Area Conic is recommended by OCHA for national-level Pakistan analyses and minimises area distortion across the full country."
#> 
# }
```
