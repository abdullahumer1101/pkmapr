test_that("pk_version returns invisible list", {
  v <- pk_version(quiet=TRUE)
  expect_type(v, "list")
  expect_true("installed" %in% names(v))
  expect_true("latest" %in% names(v))
})

test_that("pk_version installed version is character", {
  v <- pk_version(quiet=TRUE)
  expect_type(v$installed, "character")
  expect_true(grepl("^\\d+\\.\\d+\\.\\d+", v$installed))
})

test_that("pk_version prints when quiet=FALSE", {
  expect_output(pk_version(quiet=FALSE), "Installed version:")
})

test_that("pk_version latest is NA or character", {
  v <- pk_version(quiet=TRUE)
  expect_true(is.na(v$latest) || is.character(v$latest))
})
