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
#> Error in pk_crs_suggest(get_country()): could not find function "pk_crs_suggest"
  pk_crs_suggest(get_districts(province = "Balochistan"))
#> Error in pk_crs_suggest(get_districts(province = "Balochistan")): could not find function "pk_crs_suggest"
# }
```
