#' Look up Pakistan administrative unit names and codes
#'
#' Returns a tibble of official administrative unit names and PBS geocodes
#' from the OCHA/HDX source. Use this to find the exact names and codes
#' expected by geometry functions and \code{pk_join()} before attempting
#' joins or filters.
#'
#' @param level Character. Administrative level. One of "provinces",
#'   "districts", or "tehsils".
#' @param province Character. Filter to a specific province. Applies when
#'   level is "districts" or "tehsils". NULL returns all.
#' @param district Character. Filter to a specific district. Applies when
#'   level is "tehsils". NULL returns all.
#' @param refresh Logical. Force re-download. Default FALSE.
#' @return A tibble.
#' @export
#' @examplesIf interactive()
#'   pk_dictionary("provinces")
#'   pk_dictionary("districts", province = "Punjab")
#'   pk_dictionary("tehsils", district = "Lahore")
#'   pk_dictionary("tehsils", province = "Sindh")
pk_dictionary <- function(level    = c("provinces", "districts", "tehsils"),
                          province = NULL,
                          district = NULL,
                          refresh  = FALSE) {

  level      <- rlang::arg_match(level)
  local_path <- pkmapr_download(PKMAPR_FILES$dictionary, refresh = refresh)
  dict       <- readr::read_csv(local_path, show_col_types = FALSE)

  result <- switch(level,

                   provinces = dict |>
                     dplyr::filter(.data$level == "province") |>
                     dplyr::select(province_name, province_code),

                   districts = {
                     d <- dict |>
                       dplyr::filter(.data$level == "district") |>
                       dplyr::select(province_name, district_name, district_code)
                     if (!is.null(province)) d <- dplyr::filter(d, .data$province_name == province)
                     d
                   },

                   tehsils = {
                     t <- dict |>
                       dplyr::filter(.data$level == "tehsil") |>
                       dplyr::select(province_name, district_name, tehsil_name, tehsil_code)
                     if (!is.null(district)) {
                       t <- dplyr::filter(t, .data$district_name == district)
                     } else if (!is.null(province)) {
                       t <- dplyr::filter(t, .data$province_name == province)
                     }
                     t
                   }
  )

  dplyr::distinct(result)
}
