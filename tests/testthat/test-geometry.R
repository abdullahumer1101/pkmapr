test_that("get_country returns sf object", {
  skip_if_not_installed("sf")
  x <- get_country()
  expect_s3_class(x, "sf")
  expect_true("country_name" %in% colnames(x))
})

test_that("get_provinces returns sf object", {
  x <- get_provinces()
  expect_s3_class(x, "sf")
  expect_true("province_name" %in% colnames(x))
  expect_true(nrow(x) > 0)
})

test_that("get_districts returns all districts by default", {
  x <- get_districts()
  expect_s3_class(x, "sf")
  expect_true("district_name" %in% colnames(x))
  expect_true(nrow(x) > 0)
})

test_that("get_districts filters by province", {
  x <- get_districts(province = "Punjab")
  expect_true(all(x$province_name == "Punjab"))
})

test_that("get_districts case-insensitive", {
  x1 <- get_districts(province = "Punjab")
  x2 <- get_districts(province = "punjab")
  expect_equal(nrow(x1), nrow(x2))
})

test_that("get_districts errors on invalid province", {
  expect_error(get_districts(province = "NotARealProvince"), "not found")
})

test_that("get_tehsils returns sf object", {
  x <- get_tehsils()
  expect_s3_class(x, "sf")
  expect_true("tehsil_name" %in% colnames(x))
})

test_that("get_tehsils filters by district", {
  x <- get_tehsils(district = "Lahore")
  expect_true(all(x$district_name == "Lahore"))
})

test_that("get_tehsils filters by province", {
  x <- get_tehsils(province = "Sindh")
  expect_true(all(x$province_name == "Sindh"))
})

test_that("get_tehsils district takes precedence over province", {
  # This assumes Lahore is in Punjab, not Sindh
  x <- get_tehsils(district = "Lahore", province = "Sindh")
  expect_true(all(x$district_name == "Lahore"))
  expect_true(all(x$province_name == "Punjab"))
})

test_that("get_tehsils errors on invalid district", {
  expect_error(get_tehsils(district = "NotARealDistrict"), "not found")
})

test_that("CRS transforms work", {
  x <- get_districts(crs = 32642)
  expect_equal(sf::st_crs(x)$epsg, 32642)
})

test_that("filter_by_name trims whitespace", {
  # This indirectly tests the internal function
  x <- get_districts(province = "  Punjab  ")
  expect_true(all(x$province_name == "Punjab"))
})
