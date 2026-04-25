#' Quick choropleth map of a pkmapr sf object
#'
#' Produces a ggplot2 map for rapid exploratory visualisation.
#' Returns a ggplot object that can be extended with standard ggplot2 layers.
#'
#' @param x An sf object.
#' @param fill Character. Column name to use as fill variable. NULL (default)
#'   produces an outline map.
#' @param title Character. Map title. NULL for no title.
#' @param ... Additional arguments passed to \code{ggplot2::geom_sf()}.
#' @return A ggplot object.
#' @export
#' @examples
#' \donttest{
#'   pak_map(get_provinces())
#'   pak_map(get_provinces(), fill = "area_km2", title = "Province areas")
#' }
pak_map <- function(x, fill = NULL, title = NULL, ...) {
  rlang::check_installed("ggplot2", reason = "to use pak_map()")

  if (is.null(fill)) {
    p <- ggplot2::ggplot(x) +
      ggplot2::geom_sf(fill = "grey90", color = "white",
                       linewidth = 0.3, ...)
  } else {
    p <- ggplot2::ggplot(x, ggplot2::aes(fill = .data[[fill]])) +
      ggplot2::geom_sf(color = "white", linewidth = 0.3, ...) +
      ggplot2::scale_fill_viridis_c(na.value = "grey80")
  }

  p + ggplot2::theme_void() + ggplot2::labs(title = title)
}

#' Interactive choropleth map of a pkmapr sf object
#'
#' Produces an interactive leaflet map. Returns a leaflet object that
#' can be extended with standard leaflet functions.
#'
#' @param x An sf object.
#' @param fill Character. Column name for choropleth fill. NULL produces
#'   an outline map.
#' @param popup Character vector. Column names to display in click popups.
#' @param ... Additional arguments passed to \code{leaflet::addPolygons()}.
#' @return A leaflet object.
#' @export
#' @examples
#' \donttest{
#'   pak_map_interactive(get_districts(),
#'                       fill  = "area_km2",
#'                       popup = c("district_name", "area_km2"))
#' }
pak_map_interactive <- function(x, fill = NULL, popup = NULL, ...) {
  rlang::check_installed("leaflet", reason = "to use pak_map_interactive()")
  x <- sf::st_transform(x, 4326)

  m <- leaflet::leaflet(x) |>
    leaflet::addProviderTiles("CartoDB.Positron")

  if (!is.null(fill)) {
    pal        <- leaflet::colorNumeric("viridis", domain = x[[fill]],
                                        na.color = "#808080")
    popup_html <- if (!is.null(popup)) {
      apply(sf::st_drop_geometry(x)[, popup, drop = FALSE], 1,
            function(row) paste(names(row), row, sep = ": ",
                                collapse = "<br>"))
    } else NULL

    m <- m |>
      leaflet::addPolygons(fillColor   = ~pal(x[[fill]]),
                           fillOpacity = 0.7,
                           color      = "white",
                           weight      = 1,
                           popup       = popup_html, ...) |>
      leaflet::addLegend(pal = pal, values = x[[fill]], title = fill)
  } else {
    m <- m |>
      leaflet::addPolygons(fill = FALSE, color = "#555555", weight = 1, ...)
  }
  m
}

#' Leaflet basemap centred on Pakistan
#'
#' Returns a leaflet map pre-zoomed to Pakistan's extent as a starting
#' point for building custom interactive maps.
#'
#' @param provider Character. Tile provider. Default "CartoDB.Positron".
#' @return A leaflet object.
#' @export
#' @examples
#' \donttest{
#'   pak_basemap()
#' }
pak_basemap <- function(provider = "CartoDB.Positron") {
  rlang::check_installed("leaflet", reason = "to use pak_basemap()")
  leaflet::leaflet() |>
    leaflet::addProviderTiles(provider) |>
    leaflet::fitBounds(lng1 = 60.9, lat1 = 23.5,
                       lng2 = 77.8, lat2 = 37.1)
}
