## Test geoparser() ----

test_that("Check for error in geoparser() -------", {
  
  expect_error(geoparser(),                        "Argument 'x' is required")
  expect_error(geoparser(iris),                    "Argument 'x' must be a character")
  expect_error(geoparser(as.list(iris)),           "Argument 'x' must be a character")
  expect_error(geoparser(data.matrix(iris)),       "Argument 'x' must be a character")
  expect_error(geoparser(as.factor(iris$Species)), "Argument 'x' must be a character")
  expect_error(geoparser(iris$Sepal.Length),       "Argument 'x' must be a character")
})
