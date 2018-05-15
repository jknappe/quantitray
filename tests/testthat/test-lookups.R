context("Lookups")

test_that("load_qt_lookuptable returns tibble", {
  expect_true(is.tibble(load_qt_lookuptable(large = 0, small = 0, method = "qt")))
  expect_true(is.tibble(load_qt_lookuptable(large = 0, small = 0, method = "qt-2000")))
  expect_true(is.tibble(load_qt_lookuptable(large = 0, small = 0, method = "qt-legio")))
})

names_qt      <- c("count_large", "MPN_95lo", "MPN_mean", "MPN_95hi")
names_qt2000  <- c("count_large", "count_small", "MPN_95lo", "MPN_mean", "MPN_95hi")
names_qtlegio <- c("count_large", "count_small", "MPN_mean")

test_that("load_qt_lookuptable returns tibble with correct columns", {
  expect_equal(names(load_qt_lookuptable(large = 0, small = 0, method = "qt")), names_qt)
  expect_equal(names(load_qt_lookuptable(large = 0, small = 0, method = "qt-2000")), names_qt2000)
  expect_equal(names(load_qt_lookuptable(large = 0, small = 0, method = "qt-legio")), names_qtlegio)
})

test_that("load_qt_lookuptable returns correct values for 95lo", {
  expect_equal((load_qt_lookuptable(large = 40, small = 0, method = "qt"))$MPN_95lo[1], 56.4)
  expect_equal((load_qt_lookuptable(large = 40, small = 0, method = "qt-2000"))$MPN_95lo[1], 51.2)
})

test_that("load_qt_lookuptable returns correct values for MPN", {
  expect_equal((load_qt_lookuptable(large = 40, small = 0, method = "qt"))$MPN_mean[1], 78.2)
  expect_equal((load_qt_lookuptable(large = 40, small = 0, method = "qt-2000"))$MPN_mean[1], 73.84)
  expect_equal((load_qt_lookuptable(large = 5, small = 10, method = "qt-legio"))$MPN_mean[1], 33.5)
})

test_that("load_qt_lookuptable returns correct values for 95hi", {
  expect_equal((load_qt_lookuptable(large = 0, small = 0, method = "qt"))$MPN_95hi[1], 3.7)
  expect_equal((load_qt_lookuptable(large = 0, small = 0, method = "qt-2000"))$MPN_95hi[1], 3.67)
})

