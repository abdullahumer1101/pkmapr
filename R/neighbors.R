#' Construct a spatial neighbours list for Pakistan administrative units
#'
#' Builds a contiguity or distance-based spatial neighbours structure
#' for direct use with spdep and spatialreg. Handles Pakistan-specific
#' complexities including non-contiguous units and disputed boundaries.
#'
#' @section Pakistan-specific handling:
#' Gilgit-Baltistan and Azad Kashmir might break some spatial statistics.
#' The \code{disputed} argument controls how the Line of Control and
#' special administrative boundaries flagged in the OCHA source data are
#' treated, offering better control over analytical decisions.
#'
#' @param x An sf object with polygon geometries.
#' @param style Character. Neighbour definition: "queen" (shared boundary
#'   point, default), "rook" (shared edge), or "knn" (k nearest centroids).
#' @param k Integer. Number of nearest neighbours. Required when
#'   \code{style = "knn"}.
#' @param disputed Character. Treatment of non-contiguous units and
#'   disputed boundaries:
#'   \describe{
#'     \item{exclude}{Default. Non-contiguous units receive one nearest
#'       neighbour as fallback. An informative message identifies affected units.}
#'     \item{include}{Treat all boundaries as normal shared boundaries.}
#'     \item{flag}{Include all boundaries but add a boundary_note element
#'       to the result documenting which units are affected.}
#'   }
#' @return Returns a named list (class "list") with the following:
#'   \item{nb}{An spdep nb object (class "nb") containing the neighbour
#'     relationships. Each element is an integer vector of neighbour indices.}
#'   \item{listw}{A row-standardised spdep listw object (class "listw"),
#'     ready for \code{spdep::moran.test()}, \code{spdep::localMoran()},
#'     \code{spatialreg::lagsarlm()}, and related spatial analysis functions.
#'     The weights are row-standardized (style = "W") with zero.policy = TRUE.}
#'   \item{boundary_note}{Character string. Present only when
#'     \code{disputed = "flag"}. Contains documentation of which units
#'     involve disputed or special administrative boundaries.}
#'
#'   The output is a complete spatial weights structure for
#'   use in spatial autocorrelation tests (Moran's I), local indicators of
#'   spatial association (LISA), and spatial regression models (SAR, SEM, etc.).
#'   The \code{nb} defines the neighbour graph; the \code{listw}
#'   provides the row-standardized weights matrix.
#' @export
#' @examples
#' \donttest{
#'   districts <- get_districts()
#'   w <- pk_neighbors(districts)
#'
#'   # Calculate Moran's I using spdep
#'   moran_result <- spdep::moran.test(districts$area_km2, w$listw)
#'   print(moran_result)
#'
#'   # Queen contiguity (default)
#'   w_queen <- pk_neighbors(districts, style = "queen")
#'
#'   # K-nearest neighbours (k=5)
#'   w_knn <- pk_neighbors(districts, style = "knn", k = 5)
#'
#'   # Flag disputed boundaries for documentation
#'   w_flagged <- pk_neighbors(districts, disputed = "flag")
#'   if (!is.null(w_flagged$boundary_note)) cat(w_flagged$boundary_note)
#' }
pk_neighbors <- function(x,
                         style    = c("queen", "rook", "knn"),
                         k        = NULL,
                         disputed = c("exclude", "include", "flag")) {

  style    <- rlang::arg_match(style)
  disputed <- rlang::arg_match(disputed)

  x <- sf::st_make_valid(x)

  if (style == "knn") {
    if (is.null(k)) cli::cli_abort("{.arg k} is required when style = 'knn'.")
    coords <- sf::st_coordinates(sf::st_centroid(sf::st_transform(x, 32642)))
    nb     <- spdep::knn2nb(spdep::knearneigh(coords, k = k))

  } else {
    nb      <- spdep::poly2nb(x, queen = (style == "queen"), snap = 1e-3)
    zero_nb <- which(spdep::card(nb) == 0)

    if (length(zero_nb) > 0) {
      name_col   <- grep("_name", names(x), value = TRUE)[1]
      unit_names <- x[[name_col]][zero_nb]

      if (disputed == "exclude") {
        cli::cli_inform(c(
          "i" = "{length(zero_nb)} unit(s) have no contiguous neighbours.",
          "i" = "Affected: {.val {unit_names}}",
          "i" = "A nearest-neighbour fallback (k=1) has been applied.",
          "i" = "Use {.code disputed = 'include'} to treat the Line of Control
                 as a shared boundary, or {.code style = 'knn'} for a
                 fully distance-based structure."
        ))
        coords <- sf::st_coordinates(
          sf::st_centroid(sf::st_transform(x, 32642))
        )
        knn1 <- spdep::knn2nb(spdep::knearneigh(coords, k = 1))
        for (i in zero_nb) nb[[i]] <- knn1[[i]]
      }
    }
  }

  listw  <- spdep::nb2listw(nb, style = "W", zero.policy = TRUE)
  result <- list(nb = nb, listw = listw)

  if (disputed == "flag") {
    code_col    <- grep("_code", names(x), value = TRUE)[1]
    name_col    <- grep("_name", names(x), value = TRUE)[1]
    flagged_idx <- which(spdep::card(nb) == 0 |
                           x[[code_col]] %in% c("PK1", "PK3"))
    if (length(flagged_idx) > 0) {
      result$boundary_note <- paste(
        "The following units involve disputed or special administrative",
        "boundaries per the OCHA/HDX source:",
        paste(x[[name_col]][flagged_idx], collapse = ", "),
        "Spatial statistics involving these units should be interpreted",
        "with caution and the boundary treatment documented explicitly."
      )
    }
  }

  result
}
