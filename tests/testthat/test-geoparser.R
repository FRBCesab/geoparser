## Test geoparser() ----

test_that("Check for error in geoparser() -------", {
  
  expect_error(geoparser(), 
               "Argument 'x' is required")
  
  expect_error(geoparser(NULL),
               "Argument 'x' must be a character")
  
  expect_error(geoparser(iris),
               "Argument 'x' must be a character")
  expect_error(geoparser(as.list(iris)),
               "Argument 'x' must be a character")
  expect_error(geoparser(data.matrix(iris)),
               "Argument 'x' must be a character")
  expect_error(geoparser(as.factor(iris$Species)),
               "Argument 'x' must be a character")
  expect_error(geoparser(iris$Sepal.Length),
               "Argument 'x' must be a character")
  
  expect_error(geoparser(c("Lorem", NA, "ipsum")),
               "Argument 'x' cannot contain NA")
})


test_that("Check for geoparser() output -------", {
  
  test_data <- c(
    "
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
    tempor incididunt US labore et dolore magna aliqua. USA enim ad minim 
    veniam, quis nostrud exercitation ullamco laboris United States
    "
  )
  
  res <- geoparser(test_data)
  
  expect_equal(class(res), "data.frame")
  expect_equal(nrow(res), 1L)
  expect_equal(ncol(res), 4L)
  
  expect_equal(res[1, 1], "United States")
  expect_equal(res[1, 2], 1L)
  expect_equal(res[1, 3], 1L)
  expect_equal(res[1, 4], 3L)
  
  test_data <- c(
    "
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
    tempor incididunt US labore et dolore magna aliqua. USA enim ad minim 
    veniam, quis nostrud exercitation ullamco laboris United States
    ",
    "
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
    tempor incididunt US labore et dolore magna aliqua. USA enim ad minim 
    veniam, quis nostrud exercitation ullamco laboris Canada.
    "
  )
  
  res <- geoparser(test_data)
  
  expect_equal(class(res), "data.frame")
  expect_equal(nrow(res), 3L)
  expect_equal(ncol(res), 4L)
  
  expect_equal(res[1, 1], "United States")
  expect_equal(res[2, 1], "Canada")
  expect_equal(res[3, 1], "United States")
  
  expect_equal(res[1, 2], 2L)
  expect_equal(res[1, 3], 1L)
  expect_equal(res[1, 4], 3L)
  
  expect_equal(res[2, 2], 2L)
  expect_equal(res[2, 3], 2L)
  expect_equal(res[2, 4], 1L)
  
  expect_equal(res[3, 2], 2L)
  expect_equal(res[3, 3], 2L)
  expect_equal(res[3, 4], 2L)
})