test_that("all deprecated functions work", {
  skip_if_not_installed("sf")

  p1 <- sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2)))
  p2 <- sf::st_polygon(list(matrix(c(71,71,72,72,71,30,31,31,30,30), ncol=2)))

  poly <- sf::st_sf(
    id = c("A", "B"),
    area_km2 = c(100, 200),
    geometry = sf::st_sfc(p1, p2, crs = 4326)
  )

  df <- data.frame(id = c("A", "B"), value = c(42, 84))

  expect_warning(pak_area(poly), "deprecated")
  expect_warning(pak_centroid(poly), "deprecated")
  expect_warning(pak_project(poly), "deprecated")
  expect_warning(pak_crs_suggest(poly), "deprecated")
  expect_warning(pak_distance(poly, poly), "deprecated")
  expect_warning(pak_neighbors(poly), "deprecated")
  expect_warning(pak_points_in(poly, poly), "deprecated")
  expect_warning(pak_buffer(poly, 5), "deprecated")
  expect_warning(pak_union(poly, by = "id"), "deprecated")
  expect_warning(pak_intersect(poly, poly), "deprecated")
  expect_warning(pak_dictionary(), "deprecated")
  expect_warning(pak_join(poly, df, by = "id"), "deprecated")
  expect_warning(pak_map(poly), "deprecated")
  expect_warning(pak_basemap(), "deprecated")
})
