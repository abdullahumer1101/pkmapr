#' Get the pkmapr cache directory
#' @noRd
pkmapr_cache_dir <- function() {
  use_cache <- isTRUE(getOption("pkmapr_use_cache", default = FALSE))
  if (use_cache) {
    dir <- tools::R_user_dir("pkmapr", which = "data")
    if (!dir.exists(dir)) dir.create(dir, recursive = TRUE)
    dir
  } else {
    tempdir()
  }
}

#' Download a file from the pkmapr data repository
#'
#' Downloads a named file to the cache directory if not already present.
#' Returns the local file path for use by geometry loading functions.
#' @param filename Character. File to download from the data repository.
#' @param refresh Logical. Re-download even if cached copy exists.
#' @return Character. Local path to the downloaded file.
#' @noRd
pkmapr_download <- function(filename, refresh = FALSE) {
  cache_dir  <- pkmapr_cache_dir()
  local_path <- file.path(cache_dir, filename)

  refresh <- refresh || isTRUE(getOption("pkmapr_refresh", default = FALSE))

  if (file.exists(local_path) && !refresh) {
    return(local_path)
  }

  url <- paste0(PKMAPR_BASE_URL, filename)

  cli::cli_progress_step("Downloading {filename}")

  response <- httr2::request(url) |>
    httr2::req_error(is_error = function(resp) FALSE) |>
    httr2::req_perform()

  if (httr2::resp_status(response) != 200) {
    cli::cli_abort(c(
      "Failed to download {.file {filename}}.",
      "x" = "HTTP status: {httr2::resp_status(response)}",
      "i" = "Check your internet connection.",
      "i" = "URL attempted: {.url {url}}"
    ))
  }

  writeBin(httr2::resp_body_raw(response), local_path)
  cli::cli_progress_done()

  local_path
}
