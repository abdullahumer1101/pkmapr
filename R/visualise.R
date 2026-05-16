#' Produces a ggplot2 map for rapid exploratory visualisation.
#'
#' @param x An sf object.
#' @param fill Character. Column name to use as fill variable. NULL (default)
#'   produces an outline map.
#' @param title Character. Map title. NULL for no title.
#' @param ... Additional arguments passed to \code{ggplot2::geom_sf()}.
#' @param palette Character. Viridis palette option. One of "viridis" (default),
#'   "magma", "plasma", "inferno", or "cividis".
#' @param breaks Numeric vector. Custom legend break points. NULL (default)
#'   lets ggplot2 choose automatically.
#' @return Returns a ggplot object (class "gg" and "ggplot") representing
#'   a choropleth map.
#'
#'   When `fill = NULL`, the output is an outline map with grey90 fill
#'   and white borders, useful for context or reference.
#'
#'   When a `fill` variable is provided, the output uses a viridis color
#'   scale with automatic legend, for visualizing spatial distributions
#'   of continuous variables (e.g., area, population, density).
#'
#'   The returned ggplot object can be extended with additional layers,
#'   themes, or scales using standard ggplot2 syntax.
#' @export
#' @examples
#' # Outline map of provinces
#' pk_map(get_provinces())
#'
#' # Choropleth map with fill variable
#' pk_map(get_provinces(), fill = "area_km2", title = "Province areas")
pk_map <- function(x,
                   fill = NULL,
                   title = NULL,
                   palette = "viridis",
                   breaks = NULL, ...) {
  rlang::check_installed("ggplot2", reason = "to use pk_map()")

  if (is.null(fill)) {
    p <- ggplot2::ggplot(x) +
      ggplot2::geom_sf(fill = "grey90", color = "white",
                       linewidth = 0.3, ...)
  } else {
    p <- ggplot2::ggplot(x, ggplot2::aes(fill = .data[[fill]])) +
      ggplot2::geom_sf(color = "white", linewidth = 0.3, ...) +
      ggplot2::scale_fill_viridis_c(option = palette,
                                    breaks = breaks,
                                    na.value = "grey80")  }
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
#' @return Returns a leaflet object (class "leaflet" and "htmlwidget")
#'   representing an interactive web map.
#'
#'   When `fill = NULL`, the output shows polygon outlines only.
#'
#'   When a `fill` variable is provided, the output renders polygons with:
#'   \item{fillColor}{Color-coded by the fill variable using the viridis palette}
#'   \item{fillOpacity}{0.7 (semi-transparent for layer visibility)}
#'   \item{color}{White borders for polygon boundaries}
#'   \item{popup}{HTML popups showing selected attributes on click}
#'
#'   The map includes a legend for the fill variable and uses the
#'   CartoDB.Positron tile provider as the basemap.
#' @export
#' @examples
#' \donttest{
#' districts <- get_districts()
#' pk_map_interactive(districts,
#'                    fill = "area_km2",
#'                    popup = c("district_name", "area_km2"))
#' }
pk_map_interactive <- function(x, fill = NULL, popup = NULL, ...) {
  rlang::check_installed("leaflet", reason = "to use pk_map_interactive()")

  # Convert popup to list if it's a character vector (avoids jsonlite warning)
  if (!is.null(popup) && is.character(popup)) {
    popup <- as.list(popup)
  }

  x <- sf::st_transform(x, 4326)

  m <- leaflet::leaflet(x) |>
    leaflet::addProviderTiles("CartoDB.Positron")

  if (!is.null(fill)) {
    pal        <- leaflet::colorNumeric("viridis", domain = x[[fill]],
                                        na.color = "#808080")
    popup_html <- if (!is.null(popup)) {
      apply(sf::st_drop_geometry(x)[, unlist(popup), drop = FALSE], 1,
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
#' @return Returns a leaflet object (class "leaflet" and "htmlwidget")
#'   with the following configuration:
#'   \item{Provider tiles}{Specified tile provider (default: CartoDB.Positron)}
#'   \item{Bounds}{Pre-zoomed to Pakistan's extent:
#'     longitude 60.9°E to 77.8°E, latitude 23.5°N to 37.1°N}
#'
#'   The output is a fully customizable leaflet basemap ready for adding
#'   layers (e.g., administrative boundaries, point data, markers).
#'   Use this as a starting point for building custom interactive maps.
#' @export
#' @examples
#' \donttest{
#' # Default basemap with CartoDB.Positron tiles
#' pk_basemap()
#'
#' # Alternative tile provider
#' pk_basemap(provider = "OpenStreetMap")
#' }
pk_basemap <- function(provider = "CartoDB.Positron") {
  rlang::check_installed("leaflet", reason = "to use pk_basemap()")
  leaflet::leaflet() |>
    leaflet::addProviderTiles(provider) |>
    leaflet::fitBounds(lng1 = 60.9, lat1 = 23.5,
                       lng2 = 77.8, lat2 = 37.1)
}
