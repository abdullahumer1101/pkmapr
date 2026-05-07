#' Assign points to administrative units (point-in-polygon)
#'
#' For each point in \code{points}, identifies which polygon it falls
#' within and joins that polygon's attributes to the point record.
#'
#' @param points An sf object with point geometries.
#' @param polygons An sf object with polygon geometries.
#' @param return_all Logical. Keep unmatched points with NA polygon
#'   attributes (TRUE, default) or drop them (FALSE).
#' @return Returns an sf object of the same class as `points` with:
#'   \item{geometry}{Point geometries (unchanged)}
#'   \item{...}{Attribute columns from `polygons` joined to matching points}
#'
#'   Points that fall outside all polygons receive NA values for all polygon
#'   attributes when `return_all = TRUE`. When `return_all = FALSE`, such points
#'   are removed entirely.
#'
#'   The output represents point locations with their containing administrative
#'   unit attributes attached, allowing spatial aggregations and unit-based analyses.
#' @export
#' @examples
#' # Get district boundaries
#' districts <- get_districts()
#'
#' # Create sample points (or use your own sf object)
#' set.seed(123)
#' sample_points <- sf::st_sample(districts, size = 50)
#' sample_points_sf <- sf::st_sf(geometry = sample_points)
#'
#' # Assign points to districts
#' points_with_districts <- pk_points_in(sample_points_sf, districts)
#' print(head(points_with_districts))
pk_points_in <- function(points, polygons, return_all = TRUE) {
  points <- sf::st_transform(points, sf::st_crs(polygons))
  sf::st_join(points, polygons, join = sf::st_within, left = return_all)
}

#' Create buffers around sf geometries in km
#'
#' Reprojects to UTM Zone 42N internally so buffer distances are
#' in kilometres, then returns buffers in the original CRS.
#'
#' @param x An sf object.
#' @param dist_km Numeric. Buffer distance in kilometres.
#' @return Returns an sf object with the same attributes as `x` but with
#'   geometries transformed to buffers of radius `dist_km` kilometres.
#'
#'   The output CRS is identical to the input CRS (reprojected back from UTM
#'   Zone 42N after buffering). This ensures buffers are circular in projected
#'   space with accurate kilometre distances.
#' @export
#' @examples
#' districts <- get_districts()
#' buffered <- pk_buffer(districts, dist_km = 10)
pk_buffer <- function(x, dist_km) {
  original_crs <- sf::st_crs(x)
  buffered     <- sf::st_buffer(sf::st_transform(x, 32642), dist = dist_km * 1000)
  sf::st_transform(buffered, original_crs)
}

#' Dissolve sf polygons by a grouping column
#'
#' Merges polygons sharing the same value in a grouping column and
#' recalculates area_km2.
#'
#' @param x An sf object.
#' @param by Character. Column name to group by.
#' @return Returns a dissolved sf object (class "sf" and "data.frame") with:
#'   \item{geometry}{MULTIPOLYGON geometries created by merging adjacent polygons}
#'   \item{by_column}{The unique grouping values (one row per group)}
#'   \item{area_km2}{Recalculated area in square kilometres for each dissolved polygon}
#'
#'   Polygons that are not spatially adjacent but share the same group value
#'   will become MULTIPOLYGON objects. Invalid geometries are repaired automatically
#'   using `sf::st_make_valid()`.
#' @export
#' @examples
#' tehsils <- get_tehsils()
#' by_district <- pk_union(tehsils, by = "district_name")
pk_union <- function(x, by) {
  x <- sf::st_make_valid(x)
  result <- x |>
    dplyr::group_by(.data[[by]]) |>
    dplyr::summarise(.groups = "drop")
  pk_area(result)
}

#' Intersect two sf objects
#'
#' Returns the geometric intersection of two sf objects with CRS
#' alignment handled automatically.
#'
#' @param x An sf object.
#' @param y An sf object.
#' @return Returns an sf object containing the geometric intersection of `x` and `y`:
#'   \item{geometry}{Points, lines, or polygons where `x` and `y` overlap}
#'   \item{...}{All attribute columns from both `x` and `y` (with suffixes if names conflict)}
#'
#'   The output CRS matches `x`. Empty geometries (no intersection) are dropped.
#'   Output represents areas/features common to both input layers.
#' @export
#' @examples
#' districts <- get_districts()
#' buffered <- pk_buffer(districts, dist_km = 10)
#' intersected <- pk_intersect(districts, buffered)
pk_intersect <- function(x, y) {
  sf::st_intersection(x, sf::st_transform(y, sf::st_crs(x)))
}
