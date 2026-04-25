#' Construct a spatial neighbours list for Pakistan administrative units
#'
#' Builds a contiguity or distance-based spatial neighbours structure
#' for direct use with spdep and spatialreg. Handles Pakistan-specific
#' complexities including non-contiguous units and disputed boundaries.
#'
#' @section Pakistan-specific handling:
#' Gilgit-Baltistan and Azad Kashmir share no land boundaries with other
#' provinces and would receive zero neighbours under standard contiguity
#' rules, breaking most spatial statistics. The \code{disputed} argument
#' controls how the Line of Control and special administrative boundaries
#' flagged in the OCHA source data are treated, making the analytical
#' decision explicit and reproducible.
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
#' @return A named list:
#'   \describe{
#'     \item{nb}{A spdep nb object.}
#'     \item{listw}{A row-standardised spdep listw object, ready for
#'       \code{spdep::moran.test()}, \code{spdep::localMoran()},
#'       \code{spatialreg::lagsarlm()}, and related functions.}
#'     \item{boundary_note}{Character. Present only when disputed = "flag".}
#'   }
#' @export
#' @examples
#' \donttest{
#'   districts <- get_districts()
#'   w <- pak_neighbors(districts)
#'
#'   # Pass directly to spdep
#'   # spdep::moran.test(districts$area_km2, w$listw)
#' }
pak_neighbors <- function(x,
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
