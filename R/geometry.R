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
  # Case-insensitive matching with whitespace trimming
  value_lower <- tolower(trimws(value))
  data_lower <- tolower(data[[column]])

  result <- data[data_lower == value_lower, ]

  if (nrow(result) == 0) {
    level <- gsub("_name", "", column)
    # Get up to 5 valid options for the error message
    valid_options <- unique(data[[column]])[1:min(5, length(unique(data[[column]])))]
    cli::cli_abort(c(
      "{level} {.val {value}} not found.",
      "i" = "Valid options include: {.val {valid_options}}",
      "i" = "Matching is case-insensitive. Check spelling or whitespace."
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
#' @examplesIf interactive()
#'   pk <- get_country()
#'   plot(sf::st_geometry(pk))
get_country <- function(simplified = TRUE, crs = 4326, refresh = FALSE) {
  load_geometry("country", simplified, crs, refresh)
}

#' Get Pakistan province boundaries
#'
#' @inheritParams get_country
#' @return An sf object with columns: province_name, province_code,
#'   area_km2, geometry.
#' @export
#' @examplesIf interactive()
#'   pk <- get_provinces()
#'   plot(sf::st_geometry(pk))
get_provinces <- function(simplified = TRUE, crs = 4326, refresh = FALSE) {
  load_geometry("provinces", simplified, crs, refresh)
}

#' Get Pakistan district boundaries
#'
#' @param province Character. Filter to one province by exact name.
#'   Matching is case-insensitive. Run \code{pk_dictionary("provinces")}
#'   to see valid names. NULL (default) returns all districts.
#' @inheritParams get_country
#' @return An sf object with columns: province_name, district_name,
#'   district_code, area_km2, geometry.
#' @export
#' @examplesIf interactive()
#'   all_districts    <- get_districts()
#'   punjab_districts <- get_districts(province = "Punjab")
#'   punjab_districts <- get_districts(province = "punjab")  # Case-insensitive
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
#' @param district Character. Filter to one district by exact name.
#'   Matching is case-insensitive. NULL returns all.
#' @param province Character. Filter to one province by exact name.
#'   Matching is case-insensitive. NULL returns all.
#'   If both district and province are supplied, district takes precedence.
#' @inheritParams get_country
#' @return An sf object with columns: province_name, district_name,
#'   tehsil_name, tehsil_code, area_km2, geometry.
#' @export
#' @examplesIf interactive()
#'   sindh_tehsils  <- get_tehsils(province = "Sindh")
#'   sindh_tehsils  <- get_tehsils(province = "sindh")  # Case-insensitive
#'   lahore_tehsils <- get_tehsils(district = "Lahore")
#'   lahore_tehsils <- get_tehsils(district = "lahore")  # Case-insensitive
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
