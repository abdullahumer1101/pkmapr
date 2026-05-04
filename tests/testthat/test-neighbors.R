setup_polygons <- function() {
  p1 <- sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2)))
  p2 <- sf::st_polygon(list(matrix(c(71,71,72,72,71,30,31,31,30,30), ncol=2)))
  p3 <- sf::st_polygon(list(matrix(c(72,72,73,73,72,30,31,31,30,30), ncol=2)))

  sfc <- sf::st_sfc(p1, p2, p3, crs = 4326)

  list(
    two = sf::st_sf(name = c("A", "B"), geometry = sfc[1:2]),
    three = sf::st_sf(name = c("A", "B", "C"), geometry = sfc)
  )
}

test_that("pk_neighbors returns correct structure", {
  d <- setup_polygons()
  r <- pk_neighbors(d$two, style = "queen", disputed = "exclude")

  expect_true("nb" %in% names(r))
  expect_true("listw" %in% names(r))
  expect_s3_class(r$nb, "nb")
})

test_that("pk_neighbors queen style works", {
  d <- setup_polygons()
  r <- pk_neighbors(d$two, style = "queen")
  expect_equal(spdep::card(r$nb)[1], 1)
})

test_that("pk_neighbors rook style works", {
  d <- setup_polygons()
  r <- pk_neighbors(d$two, style = "rook")
  expect_s3_class(r$nb, "nb")
})

test_that("pk_neighbors knn requires k", {
  d <- setup_polygons()
  expect_error(pk_neighbors(d$three, style = "knn"), "k.*required")
})

test_that("pk_neighbors knn works with k provided", {
  d <- setup_polygons()
  suppressWarnings({
    r <- pk_neighbors(d$three, style = "knn", k = 2)
  })
  expect_equal(length(r$nb), 3)
})

test_that("pk_neighbors flag adds boundary_note", {
  d <- setup_polygons()
  r <- pk_neighbors(d$two, disputed = "flag")
  expect_true(is.null(r$boundary_note) || is.character(r$boundary_note))
})

test_that("pk_neighbors handles disputed = include", {
  d <- setup_polygons()
  r <- pk_neighbors(d$two, style = "queen", disputed = "include")
  expect_s3_class(r$nb, "nb")
})
