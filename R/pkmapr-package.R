#' pkmapr: Pakistan Spatial Data Toolkit
#'
#' Provides a tidy interface to Pakistan's official administrative
#' boundary data from the United Nations Office for the Coordination of
#' Humanitarian Affairs (OCHA). Downloads and caches spatial data at
#' country, province, district, and tehsil levels as \code{sf} objects
#' compatible with the tidyverse and geospatial ecosystem.
#'
#' @section Key functions:
#' \describe{
#'   \item{Data loading}{
#'     \code{\link{get_districts}}, \code{\link{get_tehsils}},
#'     \code{\link{get_provinces}}, \code{\link{get_country}}:
#'     Download administrative boundaries at different levels.
#'   }
#'   \item{Lookup}{
#'     \code{\link{pk_dictionary}}:
#'     Look up official names and PBS geocodes.
#'   }
#'   \item{Joining}{
#'     \code{\link{pk_join}}:
#'     Join external data with administrative units, with match checking.
#'   }
#'   \item{Spatial weights}{
#'     \code{\link{pk_neighbors}}:
#'     Build spatial weights for spdep and spatialreg.
#'   }
#'   \item{Visualisation}{
#'     \code{\link{pk_map}}, \code{\link{pk_map_interactive}}:
#'     Quick choropleth maps with ggplot2 or leaflet.
#'   }
#' }
#'
#' @section Package options:
#' \code{pkmapr} uses the following global options:
#' \describe{
#'   \item{\code{pkmapr_use_cache}}{
#'     Logical. If \code{TRUE}, caches downloaded data in a persistent
#'     user directory. Default \code{FALSE} (uses temporary directory).
#'   }
#'   \item{\code{pkmapr_refresh}}{
#'     Logical. Re-download data even if cached copy exists.
#'     Default \code{FALSE}.
#'   }
#' }
#'
#' @references
#' United Nations Office for the Coordination of Humanitarian Affairs (OCHA).
#' Pakistan Administrative Boundaries. \url{https://data.humdata.org/}
#'
#' @seealso
#' Useful links:
#' \itemize{
#'   \item \href{https://abdullahumer1101.github.io/pkmapr/}{Package website}
#'   \item \href{https://github.com/abdullahumer1101/pkmapr/}{Source code}
#'   \item \href{https://github.com/abdullahumer1101/pkmapr/issues}{Bug reports}
#' }
#'
#' @docType package
#' @name pkmapr
#' @keywords internal
#' @return No return value, called for package documentation and namespace management.
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
