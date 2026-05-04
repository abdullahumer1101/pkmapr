test_that("pk_join joins successfully", {
  # Create sf object correctly
  poly <- sf::st_sf(
    code = c("PK1", "PK2", "PK3"),
    geometry = sf::st_sfc(
      sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2))),
      sf::st_polygon(list(matrix(c(71,71,72,72,71,30,31,31,30,30), ncol=2))),
      sf::st_polygon(list(matrix(c(72,72,73,73,72,30,31,31,30,30), ncol=2)))
    )
  )
  sf::st_crs(poly) <- 4326

  data <- data.frame(code = c("PK1", "PK2"), value = c(10, 20))

  r <- suppressWarnings(pk_join(poly, data, by = "code"))
  expect_true("value" %in% colnames(r))
  expect_equal(nrow(r), 3)
})

test_that("pk_join warns about unmatched values", {
  poly <- sf::st_sf(
    code = c("PK1", "PK2"),
    geometry = sf::st_sfc(
      sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2))),
      sf::st_polygon(list(matrix(c(71,71,72,72,71,30,31,31,30,30), ncol=2)))
    )
  )
  sf::st_crs(poly) <- 4326

  data <- data.frame(code = c("PK1", "PK999"), value = c(10, 20))

  expect_warning(pk_join(poly, data, by = "code"), "value.s. in your data did not match")
})

test_that("pk_join preserves sf class", {
  poly <- sf::st_sf(
    code = "PK1",
    geometry = sf::st_sfc(sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2))))
  )
  sf::st_crs(poly) <- 4326

  data <- data.frame(code = "PK1", value = 42)

  r <- suppressWarnings(pk_join(poly, data, by = "code"))
  expect_s3_class(r, "sf")
})
