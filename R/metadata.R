#' Check package version and update status
#'
#' @param quiet Logical. If FALSE (default), prints to console.
#' @return Invisibly, a list with installed and latest versions.
#' @export
#'
#' @examples
#' pk_version()
pk_version <- function(quiet = FALSE) {
  installed <- as.character(utils::packageVersion("pkmapr"))

  # Try to fetch latest version from GitHub
  latest <- tryCatch(
    {
      url <- "https://api.github.com/repos/abdullahumer1101/pkmapr/releases/latest"
      tag <- jsonlite::fromJSON(url)$tag_name
      gsub("^v", "", tag)  # Remove 'v' prefix if present
    },
    error = function(e) NA
  )

  if (!quiet) {
    cat("Installed version:", installed, "\n")
    if (!is.na(latest)) {
      cat("Latest version:   ", latest, "\n")
      if (installed != latest) {
        cat("Update available! Run: remotes::install_github('abdullahumer1101/pkmapr')\n")
      } else {
        cat("You have the latest version\n")
      }
    } else {
      cat("Could not check latest version (check internet connection)\n")
    }
  }

  invisible(list(installed = installed, latest = latest))
}
