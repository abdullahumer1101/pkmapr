#' Construct a spatial neighbours list for Pakistan administrative units
#'
#' Builds a contiguity or distance-based spatial neighbours structure
#' for direct use with `spdep` and `spatialreg`.
#'
#' @section Disputed units:
#' GB and AJK are present in the OCHA/HDX boundary data and share polygon
#' edges with KP and Punjab, so under `disputed = "include"` (the default)
#' they participate in the neighbour graph as normal administrative units.
#' Use `"exclude_gb"`, `"exclude_ajk"`, or `"exclude_both"` to drop one or
#' both units before building the weights. The returned `data` element is
#' always the `sf` object actually used to build the weights — identical to
#' the input when `disputed = "include"`, subsetted otherwise. Always use
#' `w$data` rather than the original input for all subsequent analysis and
#' mapping, regardless of which `disputed` option is chosen.
#'
#' @param x An `sf` object with polygon geometries, typically the output of
#'   `get_districts()` or `get_provinces()`.
#' @param style Character. Neighbour definition: `"queen"` (shared boundary
#'   point, default), `"rook"` (shared edge), or `"knn"` (k nearest centroids).
#' @param k Integer. Number of nearest neighbours. Required when
#'   `style = "knn"`.
#' @param disputed Character. Controls whether Gilgit-Baltistan and/or
#'   Azad Jammu & Kashmir are included in the spatial weights structure:
#'   \describe{
#'     \item{`"include"`}{Default. Both units are treated as normal
#'       administrative units and participate in the neighbour graph.}
#'     \item{`"exclude_both"`}{Both GB and AJK are dropped from `x` before
#'       building the weights. The returned `data` element contains the
#'       subsetted `sf` object.}
#'     \item{`"exclude_gb"`}{Only Gilgit-Baltistan is dropped.}
#'     \item{`"exclude_ajk"`}{Only Azad Jammu & Kashmir is dropped.}
#'   }
#'
#' @return A named list with the following elements:
#'   \item{`nb`}{An `spdep` `nb` object containing the neighbour
#'     relationships. Each element is an integer vector of neighbour indices.}
#'   \item{`listw`}{A row-standardised `spdep` `listw` object (style = `"W"`,
#'     `zero.policy = TRUE`), ready for `spdep::moran.test()`,
#'     `spdep::localmoran()`, `spatialreg::lagsarlm()`, and related functions.}
#'   \item{`data`}{The `sf` object used to build the weights. Identical to
#'     the input `x` when `disputed = "include"`. When any units are excluded
#'     this is the subsetted `sf`, always in row-for-row alignment with `nb`
#'     and `listw`. Always use `w$data` rather than the original input when
#'     mapping or attaching analysis results.}
#'
#' @export
#' @examples
#' \donttest{
#'   districts <- get_districts()
#'
#'   # Default: all units included
#'   w <- pk_neighbors(districts)
#'   moran_result <- spdep::moran.test(w$data$area_km2, w$listw)
#'   print(moran_result)
#'
#'   # Rook contiguity
#'   w_rook <- pk_neighbors(districts, style = "rook")
#'
#'   # K-nearest neighbours (k = 5)
#'   w_knn <- pk_neighbors(districts, style = "knn", k = 5)
#'
#'   # Exclude both GB and AJK for sensitivity analysis
#'   w_excl <- pk_neighbors(districts, disputed = "exclude_both")
#'   # Use w_excl$data — not the original districts — for subsequent analysis
#'   moran_excl <- spdep::moran.test(w_excl$data$area_km2, w_excl$listw)
#'
#'   # Exclude only Gilgit-Baltistan
#'   w_no_gb <- pk_neighbors(districts, disputed = "exclude_gb")
#'
#'   # Exclude only Azad Jammu & Kashmir
#'   w_no_ajk <- pk_neighbors(districts, disputed = "exclude_ajk")
#' }
pk_neighbors <- function(x,
                         style    = c("queen", "rook", "knn"),
                         k        = NULL,
                         disputed = c("include",
                                      "exclude_both",
                                      "exclude_gb",
                                      "exclude_ajk")) {

  style    <- rlang::arg_match(style)
  disputed <- rlang::arg_match(disputed)

#Disputed unit handling
  prov_col  <- "province_code"
  gb_codes  <- "PK3"
  ajk_codes <- "PK1"

  drop_idx <- integer(0)

  if (disputed != "include") {
    codes <- x[[prov_col]]
    if (disputed %in% c("exclude_both", "exclude_gb")) {
      drop_idx <- c(drop_idx, which(codes %in% gb_codes))
    }
    if (disputed %in% c("exclude_both", "exclude_ajk")) {
      drop_idx <- c(drop_idx, which(codes %in% ajk_codes))
    }
  }

  if (length(drop_idx) > 0) {
    n_dropped <- length(drop_idx)
    name_col  <- grep("_name", names(x), value = TRUE)[1]
    dropped   <- if (!is.na(name_col)) x[[name_col]][drop_idx] else drop_idx
    cli::cli_inform(c(
      "i" = "{n_dropped} unit(s) excluded per {.code disputed = '{disputed}'}:",
      "i" = "{.val {dropped}}",
      "i" = "Use {.code w$data} for all subsequent analysis and mapping."
    ))
    x <- x[-drop_idx, ]
  }

#Geometry validation
  x <- sf::st_make_valid(x)

#Neighbour construction
  if (style == "knn") {
    if (is.null(k)) cli::cli_abort("{.arg k} is required when style = 'knn'.")
    coords <- sf::st_coordinates(sf::st_centroid(sf::st_transform(x, 32642)))
    nb     <- spdep::knn2nb(spdep::knearneigh(coords, k = k))

  } else {
    nb      <- spdep::poly2nb(x, queen = (style == "queen"), snap = 1e-3)
    zero_nb <- which(spdep::card(nb) == 0)

    if (length(zero_nb) > 0) {
      name_col   <- grep("_name", names(x), value = TRUE)[1]
      unit_names <- if (!is.na(name_col)) x[[name_col]][zero_nb] else zero_nb
      cli::cli_inform(c(
        "i" = "{length(zero_nb)} unit(s) have no contiguous neighbours.",
        "i" = "Affected: {.val {unit_names}}",
        "i" = "A nearest-neighbour fallback (k = 1) has been applied.",
        "i" = "Consider using {.code style = 'knn'} for a fully
               distance-based structure."
      ))
      coords <- sf::st_coordinates(
        sf::st_centroid(sf::st_transform(x, 32642))
      )
      knn1 <- spdep::knn2nb(spdep::knearneigh(coords, k = 1))
      for (i in zero_nb) nb[[i]] <- knn1[[i]]
    }
  }

#Weights matrix
  listw <- spdep::nb2listw(nb, style = "W", zero.policy = TRUE)

  list(nb = nb, listw = listw, data = x)
}
