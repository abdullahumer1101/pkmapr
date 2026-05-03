# R/deprecated.R
#' Deprecated functions in pkmapr
#'
#' These functions are deprecated and will be removed in a future version.
#' Please use the new \code{pk_*} functions instead.
#'
#' @name pkmapr-deprecated
#' @keywords internal
NULL

#' @rdname pkmapr-deprecated
#' @export
pak_crs_suggest <- function(...) {
  .Deprecated("pk_crs_suggest", package = "pkmapr")
  pk_crs_suggest(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_dictionary <- function(...) {
  .Deprecated("pk_dictionary", package = "pkmapr")
  pk_dictionary(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_join <- function(...) {
  .Deprecated("pk_join", package = "pkmapr")
  pk_join(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_area <- function(...) {
  .Deprecated("pk_area", package = "pkmapr")
  pk_area(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_distance <- function(...) {
  .Deprecated("pk_distance", package = "pkmapr")
  pk_distance(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_centroid <- function(...) {
  .Deprecated("pk_centroid", package = "pkmapr")
  pk_centroid(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_bbox <- function(...) {
  .Deprecated("pk_bbox", package = "pkmapr")
  pk_bbox(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_project <- function(...) {
  .Deprecated("pk_project", package = "pkmapr")
  pk_project(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_neighbors <- function(...) {
  .Deprecated("pk_neighbors", package = "pkmapr")
  pk_neighbors(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_points_in <- function(...) {
  .Deprecated("pk_points_in", package = "pkmapr")
  pk_points_in(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_buffer <- function(...) {
  .Deprecated("pk_buffer", package = "pkmapr")
  pk_buffer(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_union <- function(...) {
  .Deprecated("pk_union", package = "pkmapr")
  pk_union(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_intersect <- function(...) {
  .Deprecated("pk_intersect", package = "pkmapr")
  pk_intersect(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_map <- function(...) {
  .Deprecated("pk_map", package = "pkmapr")
  pk_map(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_map_interactive <- function(...) {
  .Deprecated("pk_map_interactive", package = "pkmapr")
  pk_map_interactive(...)
}

#' @rdname pkmapr-deprecated
#' @export
pak_basemap <- function(...) {
  .Deprecated("pk_basemap", package = "pkmapr")
  pk_basemap(...)
}
