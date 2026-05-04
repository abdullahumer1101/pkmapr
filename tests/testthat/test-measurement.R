test_that("pk_area adds area_km2 column", {
  poly <- sf::st_sf(geometry=sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31),crs=4326)))
  r <- pk_area(poly)
  expect_true("area_km2" %in% colnames(r))
  expect_true(is.numeric(r$area_km2))
  expect_gt(r$area_km2, 0)
})

test_that("pk_distance works with centroid", {
  p1 <- sf::st_sf(geometry=sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31),crs=4326)))
  p2 <- sf::st_sf(geometry=sf::st_as_sfc(sf::st_bbox(c(xmin=72,xmax=73,ymin=30,ymax=31),crs=4326)))
  d <- pk_distance(p1, p2, by="centroid")
  expect_true(is.numeric(d))
  expect_gt(d, 0)
})

test_that("pk_distance works with edge", {
  p1 <- sf::st_sf(geometry=sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31),crs=4326)))
  p2 <- sf::st_sf(geometry=sf::st_as_sfc(sf::st_bbox(c(xmin=71,xmax=72,ymin=30,ymax=31),crs=4326)))
  d <- pk_distance(p1, p2, by="edge")
  expect_true(is.numeric(d))
})

test_that("pk_centroid returns points", {
  poly <- sf::st_sf(
    geometry = sf::st_sfc(sf::st_polygon(list(matrix(c(70,70,71,71,70,30,31,31,30,30), ncol=2)))),
    area_km2 = 100
  )
  sf::st_crs(poly) <- 4326

  c <- pk_centroid(poly)
  expect_s3_class(c, "sfc")
  expect_true(all(sf::st_geometry_type(c) == "POINT"))
})

test_that("pk_project changes CRS", {
  poly <- sf::st_sf(geometry=sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31),crs=4326)))
  r <- pk_project(poly, crs=32642)
  expect_equal(sf::st_crs(r)$epsg, 32642)
})

test_that("pk_project defaults to 32642", {
  poly <- sf::st_sf(geometry=sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31),crs=4326)))
  r <- pk_project(poly)
  expect_equal(sf::st_crs(r)$epsg, 32642)
})
