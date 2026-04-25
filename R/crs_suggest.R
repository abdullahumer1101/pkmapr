#' Suggest an appropriate projected CRS for a Pakistan sf object
#'
#' Examines the geographic extent of an sf object and recommends the most
#' appropriate projected coordinate reference system for metric operations.
#' Pakistan spans UTM zones 41N, 42N, and 43N; national-level analyses
#' benefit from an equal-area projection.
#'
#' Using WGS84 (EPSG:4326) for distance, area, or buffer operations produces
#' inaccurate results as it measures in degrees rather than metres.
#'
#' @param x An sf object.
#' @return A named list:
#'   \describe{
#'     \item{epsg}{Integer EPSG code for the recommended CRS.}
#'     \item{name}{Human-readable CRS name.}
#'     \item{rationale}{One-sentence explanation of the recommendation.}
#'   }
#' @export
#' @examples
#' \donttest{
#'   pak_crs_suggest(get_country())
#'   pak_crs_suggest(get_districts(province = "Balochistan"))
#' }
pak_crs_suggest <- function(x) {

  bbox       <- sf::st_bbox(sf::st_transform(x, 4326))
  lon_centre <- (bbox["xmin"] + bbox["xmax"]) / 2
  lon_range  <- bbox["xmax"] - bbox["xmin"]
  lat_range  <- bbox["ymax"] - bbox["ymin"]

  if (lon_range > 8 || lat_range > 8) {
    return(list(
      epsg      = 102025L,
      name      = "Asia South Albers Equal Area Conic (ESRI:102025)",
      rationale = "Extent covers a large portion of Pakistan; Albers Equal Area Conic is recommended by OCHA for national-level Pakistan analyses and minimises area distortion across the full country."
    ))
  }

  if (lon_centre < 66) {
    list(
      epsg      = 32641L,
      name      = "WGS 84 / UTM Zone 41N",
      rationale = "Extent falls in western Pakistan; UTM Zone 41N minimises distortion for distance and area calculations in this region."
    )
  } else if (lon_centre > 72) {
    list(
      epsg      = 32643L,
      name      = "WGS 84 / UTM Zone 43N",
      rationale = "Extent falls in eastern Pakistan; UTM Zone 43N minimises distortion for distance and area calculations in this region."
    )
  } else {
    list(
      epsg      = 32642L,
      name      = "WGS 84 / UTM Zone 42N",
      rationale = "Extent falls in central Pakistan; UTM Zone 42N is the standard projected CRS for most Pakistan analyses."
    )
  }
}
