test_that("pk_dictionary returns all levels when level=NULL", {
  d <- pk_dictionary()
  expect_true(is.data.frame(d))
  expect_true(all(c("name","level","code","parent") %in% colnames(d)))
  expect_true(nrow(d) > 0)
})

test_that("pk_dictionary filters by level", {
  d <- pk_dictionary(level="districts")
  expect_true(all(d$level == "districts"))
  expect_false(any(d$level == "provinces"))
})

test_that("pk_dictionary filters by name (case-insensitive)", {
  d1 <- pk_dictionary(name="lahore")
  d2 <- pk_dictionary(name="LAHORE")
  d3 <- pk_dictionary(name="LahOrE")

  expect_equal(nrow(d1), nrow(d2))
  expect_equal(nrow(d1), nrow(d3))
  expect_true(all(grepl("lahore", tolower(d1$name))))
})

test_that("pk_dictionary filters by code", {
  d <- pk_dictionary(code="PK6")
  expect_true(all(grepl("pk6", tolower(d$code))))
})

test_that("pk_search returns matches (case-insensitive)", {
  r <- pk_search("lahore", fuzzy=FALSE)
  expect_true(is.data.frame(r) || is.null(r))
  if(!is.null(r)) {
    expect_true(all(grepl("lahore", tolower(r$name))))
  }
})

test_that("pk_search fuzzy matching works", {
  r <- pk_search("lahor", fuzzy=TRUE)
  if(!is.null(r)) {
    expect_true(any(grepl("lahore", tolower(r$name))))
  }
})

test_that("pk_search empty query returns NULL", {
  r <- pk_search("")
  expect_true(is.null(r))
})
