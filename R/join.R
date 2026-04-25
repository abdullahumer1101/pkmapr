#' Join data to a pkmapr sf object with match checking
#'
#' Performs a left join and warns explicitly when values in your data
#' do not match any administrative code, naming the unmatched values
#' and directing to \code{pak_dictionary()} for resolution.
#'
#' Join by code columns (e.g. district_code) rather than name columns
#' wherever possible. Codes are stable identifiers; names can have minor
#' spacing or capitalisation differences that cause silent failures.
#'
#' @param spatial An sf object from a pkmapr geometry function.
#' @param data A data frame to join.
#' @param by Character. Column name present in both spatial and data.
#' @return The spatial sf object with data columns joined.
#' @export
#' @examples
#' \donttest{
#'   districts <- get_districts()
#'   my_data   <- data.frame(district_code = "PK603", value = 42)
#'   joined    <- pak_join(districts, my_data, by = "district_code")
#' }
pak_join <- function(spatial, data, by) {
  unmatched <- setdiff(data[[by]], spatial[[by]])
  if (length(unmatched) > 0) {
    cli::cli_warn(c(
      "{length(unmatched)} value(s) in your data did not match any {by}.",
      "i" = "Unmatched: {.val {unmatched}}",
      "i" = "Run {.code pak_dictionary()} to check correct codes and names.",
      "i" = "These rows will have NA values in the joined result."
    ))
  }
  dplyr::left_join(spatial, data, by = by)
}
