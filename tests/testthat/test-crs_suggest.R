test_that("pk_crs_suggest returns correct structure", {
  # Test sf object
  test_points <- sf::st_as_sf(
    data.frame(
      lon = c(67, 70, 74),  # West, central, east Pakistan
      lat = c(30, 30, 30)
    ),
    coords = c("lon", "lat"),
    crs = 4326
  )

  result <- pk_crs_suggest(test_points)

  # Test output structure
  expect_type(result, "list")
  expect_named(result, c("epsg", "name", "rationale"))
  expect_true(is.integer(result$epsg))
  expect_true(is.character(result$name))
  expect_true(is.character(result$rationale))
})

test_that("pk_crs_suggest returns UTM Zone 42N for central Pakistan", {
  # Centered around 70°E
  central_points <- sf::st_as_sf(
    data.frame(lon = c(69, 70, 71), lat = c(30, 30, 30)),
    coords = c("lon", "lat"),
    crs = 4326
  )

  result <- pk_crs_suggest(central_points)
  expect_equal(result$epsg, 32642L)
})

test_that("pk_crs_suggest returns Albers Equal Area for large extent", {
  # Points spanning most of Pakistan (lon range > 8 degrees)
  large_points <- sf::st_as_sf(
    data.frame(lon = c(62, 75), lat = c(24, 37)),  # Western to eastern, southern to northern
    coords = c("lon", "lat"),
    crs = 4326
  )

  result <- pk_crs_suggest(large_points)
  expect_equal(result$epsg, 102025L)
})

test_that("pk_crs_suggest works with polygon sf objects", {
  # Minimal polygon
  poly_bbox <- sf::st_as_sfc(
    sf::st_bbox(c(xmin = 70, xmax = 71, ymin = 30, ymax = 31), crs = 4326)
  )
  poly_sf <- sf::st_sf(geometry = poly_bbox)

  result <- pk_crs_suggest(poly_sf)

  expect_type(result, "list")
  expect_true(result$epsg %in% c(32641L, 32642L, 32643L, 102025L))
})
