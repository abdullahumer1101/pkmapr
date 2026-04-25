#' Recalculate area in km² for an sf object
#'
#' Computes accurate areas by reprojecting to UTM Zone 42N before
#' measurement. Returns the input object with area_km2 added or updated.
#'
#' @param x An sf object with polygon geometries.
#' @return The input sf object with area_km2 column added or updated.
#' @export
#' @examples
#' \donttest{
#'   districts <- get_districts()
#'   districts <- pak_area(districts)
#' }
pak_area <- function(x) {
  projected  <- sf::st_transform(x, 32642)
  x$area_km2 <- as.numeric(sf::st_area(projected)) / 1e6
  x
}

#' Compute distances between two sf objects in km
#'
#' Reprojects internally to UTM Zone 42N for accurate metric distances.
#'
#' @param x An sf object.
#' @param y An sf object.
#' @param by Character. "centroid" (default) for centroid-to-centroid
#'   distances. "edge" for nearest-point-on-boundary distances.
#' @return A numeric matrix of distances in km.
#' @export
#' @examples
#' \donttest{
#'   provinces <- get_provinces()
#'   d <- pak_distance(provinces, provinces)
#' }
pak_distance <- function(x, y, by = c("centroid", "edge")) {
  by <- rlang::arg_match(by)
  if (by == "centroid") {
    x <- sf::st_centroid(sf::st_transform(x, 32642))
    y <- sf::st_centroid(sf::st_transform(y, 32642))
  } else {
    x <- sf::st_transform(x, 32642)
    y <- sf::st_transform(y, 32642)
  }
  as.numeric(sf::st_distance(x, y)) / 1000
}

#' Extract centroids from an sf object
#'
#' Returns polygon centroids as a point sf object with all attribute
#' columns preserved, in the same CRS as the input.
#'
#' @param x An sf object with polygon geometries.
#' @return An sf point object in the same CRS as input.
#' @export
#' @examples
#' \donttest{
#'   districts <- get_districts()
#'   centres   <- pak_centroid(districts)
#' }
pak_centroid <- function(x) {
  original_crs <- sf::st_crs(x)
  sf::st_transform(sf::st_centroid(x), original_crs)
}

#' Get a bounding box for a named administrative unit
#'
#' @param name Character. Name of the administrative unit.
#' @param level Character. One of "province", "district", or "tehsil".
#' @return A bbox object for use with \code{ggplot2::coord_sf()} or
#'   \code{leaflet::fitBounds()}.
#' @export
#' @examples
#' \donttest{
#'   bb <- pak_bbox("Lahore", level = "district")
#' }
pak_bbox <- function(name, level = c("province", "district", "tehsil")) {
  level  <- rlang::arg_match(level)
  getter <- switch(level,
                   province = get_provinces,
                   district = get_districts,
                   tehsil   = get_tehsils
  )
  col  <- paste0(level, "_name")
  geom <- filter_by_name(getter(simplified = TRUE), name, col)
  sf::st_bbox(geom)
}

#' Project an sf object to a Pakistan-appropriate CRS
#'
#' Convenience wrapper around \code{sf::st_transform()} with a default
#' of UTM Zone 42N, appropriate for most Pakistan analyses requiring
#' accurate distance, area, or buffer operations.
#'
#' @param x An sf object.
#' @param crs Integer EPSG code. Default 32642 (WGS84 / UTM Zone 42N).
#' @return The sf object reprojected to the specified CRS.
#' @export
#' @examples
#' \donttest{
#'   districts <- get_districts()
#'   projected <- pak_project(districts)
#' }
pak_project <- function(x, crs = 32642) {
  sf::st_transform(x, crs)
}
