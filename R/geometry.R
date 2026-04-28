#' Internal geometry loader
#' @noRd
load_geometry <- function(level, simplified, crs, refresh) {
  key        <- paste0(level, if (simplified) "_simplified" else "_full")
  filename   <- PKMAPR_FILES[[key]]
  local_path <- pkmapr_download(filename, refresh = refresh)
  result     <- sf::st_read(local_path, quiet = TRUE)
  if (!is.na(crs) && crs != 4326) result <- sf::st_transform(result, crs)
  result
}

#' Internal filter with informative error
#' @noRd
filter_by_name <- function(data, value, column) {
  result <- dplyr::filter(data, .data[[column]] == value)
  if (nrow(result) == 0) {
    level <- gsub("_name", "", column)
    cli::cli_abort(c(
      "{level} {.val {value}} not found.",
      "i" = "Run {.code pk_dictionary('{level}s')} to see valid names.",
      "i" = "Names are case-sensitive and must match exactly."
    ))
  }
  result
}

#' Get Pakistan national boundary
#'
#' @param simplified Logical. Return simplified geometry for fast plotting
#'   (default TRUE) or full resolution for precise analysis (FALSE).
#' @param crs Integer EPSG code. Default 4326 (WGS84). Use 32642 for
#'   distance and area calculations. See [pk_crs_suggest()] for guidance.
#' @param refresh Logical. Force re-download even if cached. Default FALSE.
#' @return An sf object with columns: country_name, country_code,
#'   area_km2, geometry.
#' @export
#' @examples
#' \donttest{
#'   pak <- get_country()
#'   plot(sf::st_geometry(pak))
#' }
get_country <- function(simplified = TRUE, crs = 4326, refresh = FALSE) {
  load_geometry("country", simplified, crs, refresh)
}

#' Get Pakistan province boundaries
#'
#' @inheritParams get_country
#' @return An sf object with columns: province_name, province_code,
#'   area_km2, geometry.
#' @export
#' @examples
#' \donttest{
#'   provinces <- get_provinces()
#' }
get_provinces <- function(simplified = TRUE, crs = 4326, refresh = FALSE) {
  load_geometry("provinces", simplified, crs, refresh)
}

#' Get Pakistan district boundaries
#'
#' @param province Character. Filter to one province by exact name.
#'   Run \code{pk_dictionary("provinces")} to see valid names.
#'   NULL (default) returns all districts.
#' @inheritParams get_country
#' @return An sf object with columns: province_name, district_name,
#'   district_code, area_km2, geometry.
#' @export
#' @examples
#' \donttest{
#'   all_districts    <- get_districts()
#'   punjab_districts <- get_districts(province = "Punjab")
#' }
get_districts <- function(province   = NULL,
                          simplified = TRUE,
                          crs        = 4326,
                          refresh    = FALSE) {
  result <- load_geometry("districts", simplified, crs, refresh)
  if (!is.null(province)) result <- filter_by_name(result, province, "province_name")
  result
}

#' Get Pakistan tehsil boundaries
#'
#' @param district Character. Filter to one district by exact name. NULL
#'   returns all. If both district and province are supplied, district
#'   takes precedence.
#' @param province Character. Filter to one province by exact name.
#'   NULL returns all.
#' @inheritParams get_country
#' @return An sf object with columns: province_name, district_name,
#'   tehsil_name, tehsil_code, area_km2, geometry.
#' @export
#' @examples
#' \donttest{
#'   sindh_tehsils  <- get_tehsils(province = "Sindh")
#'   lahore_tehsils <- get_tehsils(district = "Lahore")
#' }
get_tehsils <- function(district   = NULL,
                        province   = NULL,
                        simplified = TRUE,
                        crs        = 4326,
                        refresh    = FALSE) {
  result <- load_geometry("tehsils", simplified, crs, refresh)
  if (!is.null(district)) {
    result <- filter_by_name(result, district, "district_name")
  } else if (!is.null(province)) {
    result <- filter_by_name(result, province, "province_name")
  }
  result
}
