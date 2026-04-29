#' Join data to a pkmapr sf object with match checking
#'
#' Performs a left join. Join by code columns (e.g. district_code) rather than name columns
#' wherever possible.
#'
#' @note After joining, always inspect `names(result)` to check for column name
#' conflicts. If your data shares column names with the spatial object (e.g.,
#' `province_name`, `district_name`), both versions will be preserved with
#' `.x` and `.y` suffixes. Rename or select the appropriate columns before
#' further analysis.
#'
#' @param spatial An sf object from a pkmapr geometry function.
#' @param data A data frame to join.
#' @param by Character. Column name present in both spatial and data.
#' @return The spatial sf object with data columns joined.
#' @export
#' @examplesIf interactive()
#'   districts <- get_districts()
#'   my_data   <- data.frame(district_code = "PK603", value = 42)
#'   joined    <- pk_join(districts, my_data, by = "district_code")
pk_join <- function(spatial, data, by) {
  unmatched <- setdiff(data[[by]], spatial[[by]])
  if (length(unmatched) > 0) {
    cli::cli_warn(c(
      "{length(unmatched)} value(s) in your data did not match any {by}.",
      "i" = "Unmatched: {.val {unmatched}}",
      "i" = "Run {.code pk_dictionary()} to check correct codes and names.",
      "i" = "These rows will have NA values in the joined result."
    ))
  }
  dplyr::left_join(spatial, data, by = by)
}
