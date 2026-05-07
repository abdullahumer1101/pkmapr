#' Geometry loader
#' @noRd
#' @return No return value, called internally for side effects.
load_geometry <- function(level, crs) {

  filenames <- list(
    country   = "pk_country.gpkg",
    provinces = "pk_provinces.gpkg",
    districts = "pk_districts.gpkg",
    tehsils   = "pk_tehsils.gpkg"
  )

  filename <- filenames[[level]]
  if (is.null(filename)) {
    stop("Unknown level: ", level, call. = FALSE)
  }

  # Path to embedded file
  file_path <- system.file("extdata", filename, package = "pkmapr")

  if (file_path == "") {
    stop("Data file '", filename, "' not found. Please reinstall pkmapr.",
         call. = FALSE)
  }

  result <- sf::st_read(file_path, quiet = TRUE)

  if (!is.na(crs) && crs != 4326) {
    result <- sf::st_transform(result, crs)
  }

  result
}

#' Internal filter
#' @noRd
#' @return No return value, called internally for side effects.
filter_by_name <- function(data, value, column) {
  # Case-insensitive matching + trimming whitespace
  value_lower <- tolower(trimws(value))
  data_lower <- tolower(data[[column]])

  result <- data[data_lower == value_lower, ]

  if (nrow(result) == 0) {
    level <- gsub("_name", "", column)
    valid_options <- unique(data[[column]])[1:min(5, length(unique(data[[column]])))]
    cli::cli_abort(c(
      "{level} {.val {value}} not found.",
      "i" = "Valid options include: {.val {valid_options}}",
      "i" = "Matching is case-insensitive. Check spelling or whitespace."
    ))
  }
  result
}

#' Get national boundary for Pakistan.
#'
#' @param crs Integer EPSG code. Default 4326 (WGS84). Use 32642 for
#'   distance and area calculations. See [pk_crs_suggest()] for guidance.
#' @return Returns an sf object (class "sf" and "data.frame") with:
#'   \item{country_name}{Character. Name of the country ("Pakistan")}
#'   \item{country_code}{Character. ISO country code}
#'   \item{area_km2}{Numeric. Area in square kilometres}
#'   \item{geometry}{MULTIPOLYGON. The national boundary geometry}
#'
#'   The output represents the complete national boundary of Pakistan.
#' @export
#' @examples
#' pakistan <- get_country()
#' plot(sf::st_geometry(pakistan))
#' print(pakistan$area_km2)
get_country <- function(crs = 4326) {
  load_geometry("country", crs)
}

#' Get Pakistan province boundaries
#'
#' @param crs Integer EPSG code. Default 4326 (WGS84). Use 32642 for
#'   distance and area calculations. See [pk_crs_suggest()] for guidance.
#' @return Returns an sf object (class "sf" and "data.frame") with:
#'   \item{province_name}{Character. Name of the province (e.g., "Punjab", "Sindh")}
#'   \item{province_code}{Character. Unique province identifier code}
#'   \item{area_km2}{Numeric. Area in square kilometres for each province}
#'   \item{geometry}{MULTIPOLYGON. Province boundary geometries}
#'
#'   The output represents the administrative boundaries of Pakistan's
#'   provinces and territories.
#' @export
#' @examples
#' provinces <- get_provinces()
#' plot(sf::st_geometry(provinces))
#' head(provinces)
get_provinces <- function(crs = 4326) {
  load_geometry("provinces", crs)
}

#' Get Pakistan district boundaries
#'
#' @param province Character. Filter to one province by exact name.
#'   Matching is case-insensitive. Run \code{pk_dictionary("provinces")}
#'   to see valid names. NULL (default) returns all districts.
#' @param crs Integer EPSG code. Default 4326 (WGS84). Use 32642 for
#'   distance and area calculations. See [pk_crs_suggest()] for guidance.
#' @return Returns an sf object (class "sf" and "data.frame") with:
#'   \item{province_name}{Character. Parent province name}
#'   \item{district_name}{Character. District name}
#'   \item{district_code}{Character. Unique district identifier code (e.g., "PK603")}
#'   \item{area_km2}{Numeric. Area in square kilometres for each district}
#'   \item{geometry}{MULTIPOLYGON. District boundary geometries}
#'
#'   When `province` is specified, the output contains only districts
#'   within that province. The output represents administrative boundaries
#'   at the district level.
#' @export
#' @examples
#' # All districts
#' all_districts <- get_districts()
#'
#' # Filter to Punjab province (case-insensitive)
#' punjab_districts <- get_districts(province = "Punjab")
#' punjab_districts <- get_districts(province = "punjab")  # Same result
#'
#' plot(sf::st_geometry(punjab_districts))
get_districts <- function(province = NULL, crs = 4326) {
  result <- load_geometry("districts", crs)
  if (!is.null(province)) {
    result <- filter_by_name(result, province, "province_name")
  }
  result
}

#' Get Pakistan tehsil boundaries
#'
#' @param district Character. Filter to one district by exact name.
#'   Matching is case-insensitive. NULL returns all.
#' @param province Character. Filter to one province by exact name.
#'   Matching is case-insensitive. NULL returns all.
#'   If both district and province are supplied, district takes precedence.
#' @param crs Integer EPSG code. Default 4326 (WGS84). Use 32642 for
#'   distance and area calculations. See [pk_crs_suggest()] for guidance.
#' @return Returns an sf object (class "sf" and "data.frame") with:
#'   \item{province_name}{Character. Parent province name}
#'   \item{district_name}{Character. Parent district name}
#'   \item{tehsil_name}{Character. Tehsil name}
#'   \item{tehsil_code}{Character. Unique tehsil identifier code}
#'   \item{area_km2}{Numeric. Area in square kilometres for each tehsil}
#'   \item{geometry}{MULTIPOLYGON. Tehsil boundary geometries}
#'
#'   The output represents the finest available administrative boundaries
#'   in pkmapr, suitable for high-resolution spatial analysis, local-level
#'   mapping, and joining with tehsil-level census or survey data.
#' @export
#' @examples
#' # All tehsils
#' all_tehsils <- get_tehsils()
#'
#' # Filter to Sindh province
#' sindh_tehsils <- get_tehsils(province = "Sindh")
#' sindh_tehsils <- get_tehsils(province = "sindh")  # Case-insensitive
#'
#' # Filter to Lahore district
#' lahore_tehsils <- get_tehsils(district = "Lahore")
#' lahore_tehsils <- get_tehsils(district = "lahore")  # Case-insensitive
#'
#' plot(sf::st_geometry(lahore_tehsils))
get_tehsils <- function(district = NULL, province = NULL, crs = 4326) {
  result <- load_geometry("tehsils", crs)
  if (!is.null(district)) {
    result <- filter_by_name(result, district, "district_name")
  } else if (!is.null(province)) {
    result <- filter_by_name(result, province, "province_name")
  }
  result
}
