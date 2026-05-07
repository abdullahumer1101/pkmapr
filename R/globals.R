#' Declares global variables used by pkmapr functions.
#'
#' @keywords internal
#' @noRd
#' @return No return value, called for side effects.
utils::globalVariables(c(
  ".data", "geometry", "province_name", "province_code",
  "district_name", "district_code", "tehsil_name", "tehsil_code"
))
