setup <- function() {
  poly <- sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=71,ymin=30,ymax=31),crs=4326))
  poly <- sf::st_sf(id="test",geometry=poly)

  inside <- sf::st_as_sf(data.frame(lon=c(70.2,70.5),lat=c(30.2,30.5)),coords=c("lon","lat"),crs=4326)
  outside <- sf::st_as_sf(data.frame(lon=c(68,72),lat=c(28,32)),coords=c("lon","lat"),crs=4326)

  list(poly=poly, inside=inside, all=rbind(inside,outside))
}

test_that("pk_points_in joins attributes", {
  d <- setup()
  r <- pk_points_in(d$all, d$poly)
  expect_equal(nrow(r), nrow(d$all))
  expect_true("id" %in% colnames(r))
})

test_that("pk_points_in drops unmatch when FALSE", {
  d <- setup()
  r <- pk_points_in(d$all, d$poly, return_all=FALSE)
  expect_equal(nrow(r), nrow(d$inside))
})

test_that("pk_buffer works with km", {
  d <- setup()
  r <- pk_buffer(d$poly, 5)
  expect_s3_class(r, "sf")
  expect_gt(sf::st_area(r), sf::st_area(d$poly))
})

test_that("pk_union dissolves by group", {
  p1 <- sf::st_as_sfc(sf::st_bbox(c(xmin=70,xmax=70.5,ymin=30,ymax=30.5),crs=4326))
  p2 <- sf::st_as_sfc(sf::st_bbox(c(xmin=70.5,xmax=71,ymin=30,ymax=30.5),crs=4326))
  p3 <- sf::st_as_sfc(sf::st_bbox(c(xmin=72,xmax=73,ymin=31,ymax=32),crs=4326))
  polys <- sf::st_sf(group=c("A","A","B"), geometry=c(p1,p2,p3))

  r <- pk_union(polys, "group")
  expect_equal(nrow(r), 2)
  expect_true("area_km2" %in% colnames(r))
})

test_that("pk_intersect works", {
  d <- setup()

  overlap <- sf::st_as_sfc(
    sf::st_bbox(c(xmin = 70.5, xmax = 71.5, ymin = 30.5, ymax = 31.5), crs = 4326)
  )
  overlap <- sf::st_sf(geometry = overlap)

  expect_warning(
    r <- pk_intersect(d$poly, overlap),
    "attribute variables are assumed to be spatially constant"
  )
  expect_s3_class(r, "sf")
})
