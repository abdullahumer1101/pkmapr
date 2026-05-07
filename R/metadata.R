#' Check package version and update status
#'
#' Compares the installed version of pkmapr with the latest release
#' available on GitHub.
#'
#' @param quiet Logical. If FALSE (default), prints status messages to console.
#'   If TRUE, returns the version information silently.
#' @return Returns invisibly a list (class "list") with the following components:
#'   \item{installed}{Character string. The currently installed version number.}
#'   \item{latest}{Character string or NA. The latest version number from GitHub,
#'     or NA if the check failed (e.g., no internet connection).}
#'
#' @export
#'
#' @examples
#' \donttest{
#' pk_version()
#'
#' # Silent mode for programmatic use
#' vers <- pk_version(quiet = TRUE)
#' if (!is.na(vers$latest) && vers$installed != vers$latest) {
#'   message("Update recommended!")
#' }
#' }
pk_version <- function(quiet = FALSE) {
  installed <- as.character(utils::packageVersion("pkmapr"))

  # Try to fetch latest version from GitHub
  latest <- tryCatch(
    {
      url <- "https://api.github.com/repos/abdullahumer1101/pkmapr/releases/latest"
      tag <- jsonlite::fromJSON(url)$tag_name
      gsub("^v", "", tag)
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
