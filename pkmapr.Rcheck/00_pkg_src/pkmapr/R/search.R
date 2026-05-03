#' Pakistan Administrative Boundaries Dictionary
#'
#' Search and explore administrative names and codes for Pakistan.
#'
#' @section Case Insensitivity:
#' All matching in `pk_dictionary()` is **case-insensitive**.
#' "Lahore", "lahore", and "LAHORE" all return the same results.
#'
#' @param level Character. One of: "provinces", "districts", "tehsils".
#'   NULL (default) returns all levels.
#' @param name Character. Filter by partial name (case-insensitive).
#' @param code Character. Filter by partial P-code (case-insensitive).
#' @return A data frame with columns: name, level, code, parent.
#' @export
#'
#' @examples
#' \dontrun{
#'   # All provinces
#'   pk_dictionary(level = "provinces")
#'
#'   # Case-insensitive search for districts containing "lahore"
#'   pk_dictionary(level = "districts", name = "lahore")
#'   pk_dictionary(level = "districts", name = "LAHORE")  # Same result
#'
#'   # Search by code
#'   pk_dictionary(code = "PK6")
#' }
pk_dictionary <- function(level = NULL, name = NULL, code = NULL) {
  # Load internal dictionary
  dict <- build_dictionary_from_geometry()

  # Filter by level
  if (!is.null(level)) {
    level_clean <- tolower(level)
    dict <- dict[tolower(dict$level) == level_clean, ]
  }

  # Filter by name (partial, case-insensitive)
  if (!is.null(name)) {
    name_clean <- tolower(name)
    dict <- dict[grepl(name_clean, tolower(dict$name)), ]
  }

  # Filter by code (partial, case-insensitive)
  if (!is.null(code)) {
    code_clean <- tolower(code)
    dict <- dict[grepl(code_clean, tolower(dict$code)), ]
  }

  # Ensure no row names
  rownames(dict) <- NULL

  return(dict)
}

#' Search Across All Administrative Levels
#'
#' Search for administrative units by partial name or code across
#' all levels (provinces, districts, tehsils).
#'
#' @section Case Insensitivity:
#' All matching in `pk_search()` is **case-insensitive** by default.
#' "Lahore", "lahore", and "LAHORE" all return the same results.
#'
#' @section Fuzzy Matching:
#' When `fuzzy = TRUE`, the function uses approximate string matching
#' to handle typos and spelling variations. For example, "lahor" will
#' match "Lahore". This is useful for interactive exploration but
#' may return unexpected results for ambiguous queries.
#'
#' @param query Character. Search term (partial match, case-insensitive).
#' @param fuzzy Logical. If TRUE, uses fuzzy matching for typos.
#'   Default FALSE. Warning: Fuzzy matching can be slower and may
#'   return unexpected matches for short or common queries.
#' @return A data frame with columns: name, level, code, parent.
#' @export
#'
#' @examples
#' \dontrun{
#'   # Case-insensitive search
#'   pk_search("lahore")   # Returns Lahore district and tehsils
#'   pk_search("LAHORE")   # Same result
#'
#'   # Fuzzy search for misspelled "lahore"
#'   pk_search("lahor", fuzzy = TRUE)
#'   pk_search("lahre", fuzzy = TRUE)
#'
#'   # Search by code
#'   pk_search("PK6")
#' }
pk_search <- function(query, fuzzy = FALSE) {
  dict <- build_dictionary_from_geometry()

  query_clean <- tolower(trimws(query))

  # Handle empty query
  if (query_clean == "") {
    cli::cli_alert_warning("Empty search query. Returning NULL.")
    return(invisible(NULL))
  }

  if (fuzzy) {
    # Fuzzy matching with informative message (once per session)
    if (!getOption("pkmapr.fuzzy_warned", FALSE)) {
      cli::cli_alert_info(
        "Fuzzy matching enabled. Results may include approximate matches.
         Set options(pkmapr.fuzzy_warned = TRUE) to suppress this message."
      )
      options(pkmapr.fuzzy_warned = TRUE)
    }

    name_matches <- agrep(query_clean, tolower(dict$name), ignore.case = TRUE)
    code_matches <- agrep(query_clean, tolower(dict$code), ignore.case = TRUE)
    idx <- unique(c(name_matches, code_matches))
  } else {
    # Partial string matching (case-insensitive)
    name_matches <- grepl(query_clean, tolower(dict$name))
    code_matches <- grepl(query_clean, tolower(dict$code))
    idx <- name_matches | code_matches
  }

  result <- dict[idx, ]
  rownames(result) <- NULL

  if (nrow(result) == 0) {
    cli::cli_alert_warning("No matches found for: {.val {query}}")
    if (!fuzzy) {
      cli::cli_alert_info("Try {.code pk_search('{query}', fuzzy = TRUE)} for approximate matching.")
    }
    return(invisible(NULL))
  }

  # Add message about result count
  cli::cli_alert_success("Found {nrow(result)} match(es) for: {.val {query}}")

  return(result)
}

#' Internal: Build dictionary from geometry functions
#' @noRd
build_dictionary_from_geometry <- function() {
  # Load all admin levels (simplified parameter removed)
  provinces <- get_provinces()  # was: get_provinces(simplified = TRUE)
  districts <- get_districts()  # was: get_districts(simplified = TRUE)
  tehsils <- get_tehsils()      # was: get_tehsils(simplified = TRUE)

  # Build dictionary rows with PLURAL levels
  dict <- data.frame(
    name = c(provinces$province_name,
             districts$district_name,
             tehsils$tehsil_name),
    level = c(rep("provinces", nrow(provinces)),
              rep("districts", nrow(districts)),
              rep("tehsils", nrow(tehsils))),
    code = c(provinces$province_code,
             districts$district_code,
             tehsils$tehsil_code),
    parent = c(rep(NA, nrow(provinces)),
               districts$province_name,
               tehsils$district_name),
    stringsAsFactors = FALSE
  )

  # Remove any rows with NA names (safety check)
  dict <- dict[!is.na(dict$name), ]

  return(dict)
}
