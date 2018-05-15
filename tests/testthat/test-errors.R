context("Test Errors")

test_that("catch_qt_errors throws error when argument 'large' is missing", {
  expect_error(catch_qt_errors(method = "qt"), "large")
  expect_error(catch_qt_errors(small = 0, method = "qt-2000"), "large")
  expect_error(catch_qt_errors(small = 0, method = "qt-legio"), "large")
})

test_that("catch_qt_errors throws error when argument 'small' is missing", {
  expect_error(catch_qt_errors(large = 0, method = "qt-2000"), "small")
  expect_error(catch_qt_errors(large = 0, method = "qt-legio"), "small")
})

test_that("catch_qt_errors throws error when argument 'method' is missing", {
  expect_error(catch_qt_errors(large = 0, small = 0), "method")
})

test_that("catch_qt_errors throws error when argument 'large' is not valid", {
  expect_error(catch_qt_errors(large = -1, method = "qt"), "large")
  expect_error(catch_qt_errors(large = -1, small = 0, method = "qt-2000"), "large")
  expect_error(catch_qt_errors(large = -1, small = 0, method = "qt-legio"), "large")
  expect_error(catch_qt_errors(large = 52, method = "qt"), "large")
  expect_error(catch_qt_errors(large = 50, small = 0, method = "qt-2000"), "large")
  expect_error(catch_qt_errors(large = 7, small = 0, method = "qt-legio"), "large")
})

test_that("catch_qt_errors throws error when argument 'small' is not valid", {
  expect_error(catch_qt_errors(large = 0, small = -1, method = "qt-2000"), "small")
  expect_error(catch_qt_errors(large = 0, small = -1, method = "qt-legio"), "small")
  expect_error(catch_qt_errors(large = 0, small = 49, method = "qt-2000"), "small")
  expect_error(catch_qt_errors(large = 0, small = 91, method = "qt-legio"), "small")
})

test_that("catch_qt_errors throws warning when argument 'small' is provided for method 'qt'", {
  expect_warning(catch_qt_errors(large = 0, small = 0, method = "qt"), "small")
})

test_that("catch_qt_errors throws error when argument 'method' is not valid", {
  expect_error(catch_qt_errors(large = 0, small = 0, method = "a"), "method")
  expect_error(catch_qt_errors(large = 0, small = 0, method = 0), "method")
  expect_error(catch_qt_errors(large = 0, small = 0, method = NA), "method")
})

test_that("catch_qt_errors throws error when argument 'large' is not integer", {
  expect_error(catch_qt_errors(large = 1.5, method = "qt"), "large")
  expect_error(catch_qt_errors(large = "a", method = "qt"), "large")
  expect_error(catch_qt_errors(large = "0", method = "qt"), "large")
  expect_error(catch_qt_errors(large = 1.5, small = 0, method = "qt-2000"), "large")
  expect_error(catch_qt_errors(large = "a", small = 0, method = "qt-2000"), "large")
  expect_error(catch_qt_errors(large = "0", small = 0, method = "qt-2000"), "large")
  expect_error(catch_qt_errors(large = 1.5, small = 0, method = "qt-legio"), "large")
  expect_error(catch_qt_errors(large = "a", small = 0, method = "qt-legio"), "large")
  expect_error(catch_qt_errors(large = "0", small = 0, method = "qt-legio"), "large")
})

test_that("catch_qt_errors throws error when argument 'small' is not integer", {
  expect_error(catch_qt_errors(large = 0, small = 1.5, method = "qt-2000"), "small")
  expect_error(catch_qt_errors(large = 0, small = "a", method = "qt-2000"), "small")
  expect_error(catch_qt_errors(large = 0, small = "0", method = "qt-2000"), "small")
  expect_error(catch_qt_errors(large = 0, small = 1.5, method = "qt-legio"), "small")
  expect_error(catch_qt_errors(large = 0, small = "a", method = "qt-legio"), "small")
  expect_error(catch_qt_errors(large = 0, small = "0", method = "qt-legio"), "small")
})

