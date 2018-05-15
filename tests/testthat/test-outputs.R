context("Outputs")

test_that("quantify_mpn returns numeric value", {
  expect_true(is.numeric(quantify_mpn(large = 0, method = "qt")))
  expect_true(is.numeric(quantify_mpn(large = 0, small = 0, method = "qt-2000")))
  expect_true(is.numeric(quantify_mpn(large = 0, small = 0, method = "qt-legio")))
})

test_that("quantify_mpn returns NA for edge cases", {
  expect_true(is.na(quantify_mpn(large = 51, method = "qt")))
  expect_true(is.na(quantify_mpn(large = 49, small = 48, method = "qt-2000")))
  expect_true(is.na(quantify_mpn(large = 6, small = 90, method = "qt-legio")))
})

test_that("quantify_95lo returns numeric value", {
  expect_true(is.numeric(quantify_95lo(large = 0, method = "qt")))
  expect_true(is.numeric(quantify_95lo(large = 0, small = 0, method = "qt-2000")))
})

test_that("quantify_95hi returns numeric value", {
  expect_true(is.numeric(quantify_95hi(large = 0, method = "qt")))
  expect_true(is.numeric(quantify_95hi(large = 0, small = 0, method = "qt-2000")))
})

test_that("quantify_95hi returns NA for edge cases", {
  expect_true(is.na(quantify_95hi(large = 51, method = "qt")))
  expect_true(is.na(quantify_95hi(large = 49, small = 48, method = "qt-2000")))
})
