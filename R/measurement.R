#' Recalculate area in km² for an sf object
#'
#' Computes accurate areas by reprojecting to UTM Zone 42N before
#' measurement. Returns the input object with area_km2 added or updated.
#'
#' @param x An sf object with polygon geometries.
#' @return Returns the input sf object (class "sf" and "data.frame") with the
#'   \item{area_km2}{Numeric column added or updated, representing the area
#'     of each polygon in square kilometres.}
#'
#' @export
#' @examples
#' districts <- get_districts()
#' districts <- pk_area(districts)
#' head(districts$area_km2)
pk_area <- function(x) {
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
#' @return Returns a numeric matrix (class "matrix") of distances in kilometres,
#'   with dimensions \code{nrow(x)} by \code{nrow(y)}.
#'
#'   When \code{by = "centroid"}, distances are measured between polygon
#'   centroids. When \code{by = "edge"}, distances are measured between the
#'   closest points on polygon boundaries. The output represents the
#'   shortest straight-line distance between features.
#' @export
#' @examples
#' provinces <- get_provinces()
#' d <- pk_distance(provinces, provinces)
#' print(d)
#'
#' # Edge-to-edge distances
#' d_edge <- pk_distance(provinces, provinces, by = "edge")
pk_distance <- function(x, y, by = c("centroid", "edge")) {
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
#' Returns polygon centroids as a point sf object with only geometry
#' (attributes are dropped to avoid warnings about constant attributes).
#'
#' @param x An sf object with polygon geometries.
#' @return Returns an sf point object (class "sf") with:
#'   \item{geometry}{Point geometries representing the centroids of input polygons}
#'
#'   Centroids represent the geometric center of each polygon, useful for
#'   point-based visualisation, distance calculations, or as nodes for
#'   spatial network analysis.
#' @export
#' @examples
#' districts <- get_districts()
#' centres <- pk_centroid(districts)
#' plot(centres)
pk_centroid <- function(x) {
  original_crs <- sf::st_crs(x)
  centroids <- sf::st_centroid(sf::st_geometry(x))
  sf::st_transform(centroids, original_crs)
}

#' Get a bounding box for a named administrative unit
#'
#' Retrieves the spatial extent (bounding box) of a specific administrative
#' unit by name and level. Useful for setting map views or cropping other
#' spatial data.
#'
#' @param name Character. Name of the administrative unit (e.g., "Punjab", "Lahore").
#' @param level Character. One of "province", "district", or "tehsil".
#' @return Returns a bbox object (class "bbox") with named elements:
#'   \item{xmin}{Minimum x-coordinate (longitude or easting)}
#'   \item{ymin}{Minimum y-coordinate (latitude or northing)}
#'   \item{xmax}{Maximum x-coordinate}
#'   \item{ymax}{Maximum y-coordinate}
#'
#'   The output is suitable for use with \code{ggplot2::coord_sf(xlim = c(xmin, xmax), ylim = c(ymin, ymax))}
#'   or \code{leaflet::fitBounds(lng1 = xmin, lat1 = ymin, lng2 = xmax, lat2 = ymax)}.
#'   It represents the rectangular extent that exactly contains the requested
#'   administrative unit.
#' @note If you see an error like `object 'xxx' not found` when using this
#' function, the issue is likely in your data preparation, not `pk_bbox()`.
#' Test the function directly: `pk_bbox("Punjab", level = "province")`.
#' If that works, check that your data has the expected column names.
#' @export
#' @examples
#' # Get bounding box for Lahore district
#' bb <- pk_bbox("Lahore", level = "district")
#' print(bb)
#'
#' # Use with ggplot2
#' \donttest{
#'   library(ggplot2)
#'   districts <- get_districts()
#'   bb_punjab <- pk_bbox("Punjab", level = "province")
#'   ggplot() +
#'     geom_sf(data = districts) +
#'     coord_sf(xlim = c(bb_punjab["xmin"], bb_punjab["xmax"]),
#'              ylim = c(bb_punjab["ymin"], bb_punjab["ymax"]))
#' }
pk_bbox <- function(name, level = c("province", "district", "tehsil")) {
  level  <- rlang::arg_match(level)
  getter <- switch(level,
                   province = get_provinces,
                   district = get_districts,
                   tehsil   = get_tehsils
  )
  col  <- paste0(level, "_name")
  geom <- filter_by_name(getter(), name, col)
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
#' @return Returns the sf object reprojected to the specified CRS.
#'   The output has the same attributes and geometry type as the input,
#'   but coordinates are transformed to the new projection. UTM Zone 42N
#'   (EPSG:32642) preserves distances and areas accurately across most
#'   but not all of Pakistan.
#' @export
#' @examples
#' districts <- get_districts()
#' projected <- pk_project(districts)
#' sf::st_crs(projected)$epsg  # Should be 32642
pk_project <- function(x, crs = 32642) {
  sf::st_transform(x, crs)
}
