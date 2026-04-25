#' Show pkmapr cache information
#'
#' Displays the cache directory location and lists files currently stored.
#'
#' @return A data frame of cached files and sizes, returned invisibly.
#' @export
#' @examples
#' pkmapr_cache_info()
pkmapr_cache_info <- function() {
  cache_dir <- pkmapr_cache_dir()
  files     <- list.files(cache_dir, full.names = TRUE)

  if (length(files) == 0) {
    cli::cli_inform(c(
      "i" = "No files currently cached.",
      "i" = "Cache directory: {.path {cache_dir}}"
    ))
    return(invisible(NULL))
  }

  sizes    <- file.size(files)
  total_mb <- round(sum(sizes) / 1e6, 1)

  cli::cli_inform(c(
    "i" = "Cache directory: {.path {cache_dir}}",
    "i" = "{length(files)} file(s), {total_mb} MB total"
  ))

  result <- data.frame(file = basename(files), size_mb = round(sizes / 1e6, 2))
  print(result)
  invisible(result)
}

#' Clear the pkmapr cache
#'
#' Deletes all locally cached files. They will be re-downloaded on the
#' next function call.
#'
#' @return NULL, invisibly.
#' @export
#' @examples
#' pkmapr_clear_cache()
pkmapr_clear_cache <- function() {
  cache_dir <- pkmapr_cache_dir()
  files     <- list.files(cache_dir, full.names = TRUE)

  if (length(files) == 0) {
    cli::cli_inform("Cache is already empty.")
    return(invisible(NULL))
  }

  file.remove(files)
  cli::cli_inform("Removed {length(files)} cached file(s).")
  invisible(NULL)
}
