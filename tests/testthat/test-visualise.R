
test_that("pk_map returns ggplot object", {
  skip_if_not_installed("ggplot2")

  poly <- sf::st_sf(
    area_km2 = 100,
    geometry = sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31), crs=4326))
  )

  p <- pk_map(poly)
  expect_s3_class(p, "ggplot")
})

test_that("pk_map works with fill", {
  skip_if_not_installed("ggplot2")

  poly <- sf::st_sf(
    area_km2 = 100,
    geometry = sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31), crs=4326))
  )

  p <- pk_map(poly, fill = "area_km2")
  expect_s3_class(p, "ggplot")
})

test_that("pk_map adds title", {
  skip_if_not_installed("ggplot2")

  poly <- sf::st_sf(
    geometry = sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31), crs=4326))
  )

  p <- pk_map(poly, title = "Test Map")
  expect_true("Test Map" %in% p$labels$title)
})

test_that("pk_basemap returns leaflet object", {
  skip_if_not_installed("leaflet")

  m <- pk_basemap()
  expect_s3_class(m, "leaflet")
})


test_that("pk_map_interactive returns leaflet object (mock)", {
  skip_if_not_installed("leaflet")

  poly <- sf::st_sf(
    area_km2 = 100,
    geometry = sf::st_sfc(sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2))))
  )
  sf::st_crs(poly) <- 4326

  # leaflet works in non-interactive mode, just can't display
  m <- pk_map_interactive(poly, fill = "area_km2")
  expect_s3_class(m, "leaflet")
  expect_true("leaflet" %in% class(m))
})

test_that("pk_map_interactive works without fill", {
  skip_if_not_installed("leaflet")

  poly <- sf::st_sf(
    geometry = sf::st_sfc(sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2))))
  )
  sf::st_crs(poly) <- 4326

  m <- pk_map_interactive(poly, fill = NULL)
  expect_s3_class(m, "leaflet")
})

test_that("pk_map_interactive handles popup parameter", {
  skip_if_not_installed("leaflet")

  poly <- sf::st_sf(
    name = "Test Area",
    area_km2 = 100,
    geometry = sf::st_sfc(sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2))))
  )
  sf::st_crs(poly) <- 4326

  m <- pk_map_interactive(poly, fill = "area_km2", popup = c("name", "area_km2"))
  expect_s3_class(m, "leaflet")
})

test_that("pk_basemap uses custom provider", {
  skip_if_not_installed("leaflet")

  m <- pk_basemap(provider = "OpenStreetMap")
  expect_s3_class(m, "leaflet")
})
