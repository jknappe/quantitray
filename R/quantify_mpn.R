#' Convert IDEXX QuantiTray results to MPN
#'
#' This function converts counts of positive wells (large and small) into point
#' estimete MPN (most probable number) values in units of MPN/100ml for IDEXX
#' QuantiTray, QuantiTray/2000, and QuantiTray/Legiolert trays.
#'
#' @param large Number of positve large wells (required for all methods).
#' @param small Number of positve small wells (required for 'qt-2000' and
#'   'qt-legio' method).
#' @param method Defines which QuantiTray method was used:
#'   \itemize{
#'     \item 'qt' for QuantiTray method with 51 wells.
#'     \item 'qt-2000' for QuantiTray/2000 method with 97 wells.
#'     \item 'qt-legio' for QuantiTray/Legiolert method with 96 wells.
#'   }
#' @return Numerical value: Point estimate of MPN/100ml in sample.
#' @references
#'   https://www.idexx.com/en/water/resources/mpn-generator/
#' @author
#'   Jan Knappe, \email{jan.knappe@@gmail.com}
#' @import
#'   dplyr tidyr
#' @export
#' @examples
#' quantify_mpn(large = 42, method = "qt")
#' quantify_mpn(large = 42, small = 42, method = "qt-2000")
#' quantify_mpn(large = 5, small = 42, method = "qt-legio")
#'

quantify_mpn <- function(large, small, method) {
  #
  # Error handling
  # ~~~~~~~~~~~~~~~~
  #
  # set 'small' to dummy value if not provided (for method 'qt')
  if (method %in% "qt") {
    if (missing(small)) {
      small = "dummy"
    }
  }
  # 'method' must be provided
  if (missing(method)) {
    stop("Argument 'method' must be provided.")
  }
  #
  # 'method' must be valid character string
  if (!missing(method) & !method %in% c("qt", "qt-2000", "qt-legio")) {
    stop("Argument 'method' must have value 'qt', 'qt-2000', or 'qt-legio'.")
  }
  #
  # 'large' must be provided
  if (missing(large)) {
    stop("Argument 'large' must be provided.")
  }
  #
  # 'small' must be provided for method = qt-2000 or qt-legio
  if (method %in% c("qt-2000", "qt-legio")) {
    if (missing(small)) {
      stop("Argument 'small' must be provided for method 'qt-2000' and
           'qt-legio'.")
    }
  }
  #
  # 'small' must not be provided for method = qt
  if (method %in% "qt") {
    if (!small %in% "dummy") {
      stop("Argument 'small' must not be provided for method 'qt'.")
    }
  }
  #
  # 'large' must be integer
  if (!missing(large)) {
    if (!is.numeric(large)) {
      stop("Argument 'large' must be an integer.")
    }
    #
    if (large != as.integer(large)) {
      stop("Argument 'large' must be integer.")
    }
  }
  #
  # 'small' must be integer
  if (!missing(small) & !small %in% "dummy") {
    if (!is.numeric(small) ) {
      stop("Argument 'small' must be an integer >= 0.")
    }
    #
    if (small != as.integer(small)) {
      stop("Argument 'small' must be integer >= 0.")
    }
  }
  #
  # 'large' and 'small' must be within method-specific bounds
  if (method %in% "qt") {
    if (large < 0) {
      stop("Argument 'large' must be integer >= 0.")
    }
    if (large > 51) {
      stop("Argument 'large' must be non-negative integer <= 51 for method
           'qt.")
    }
  }
  if (method %in% "qt-2000") {
    if (large > 49) {
      if (large < 0) {
        stop("Argument 'large' must be integer >= 0.")
      }
      stop("Argument 'large' must be non-negative integer <= 49 for method
           'qt-2000'.")
    }
    if (small < 0) {
      stop("Argument 'small' must be integer >= 0.")
    }
    if (small > 48) {
      stop("Argument 'small' must be non-negative integer <= 48 for method
           'qt-2000'.")
    }
  }
  if (method %in% "qt-legio") {
    if (large > 6) {
      if (large < 0) {
        stop("Argument 'large' must be integer >= 0.")
      }
      stop("Argument 'large' must be non-negative integer <= 6 for method
           'qt-legio'.")
    }
    if (small < 0) {
      stop("Argument 'small' must be integer >= 0.")
    }
    if (small > 90) {
      stop("Argument 'small' must be non-negative integer <= 90 for method
           'qt-legio'.")
    }
  }
  #
  # Function
  # ~~~~~~~~~~~~~~~~
  #
  # for QuantiTray
  if (method %in% "qt") {
    result <-
      quanti_51 %>%
      filter(count_large == large) %>%
      select(MPN_mean) %>%
      as.numeric()
  }
  #
  # for QuantiTray/2000
  if (method %in% "qt-2000") {
    result <-
      quanti_97 %>%
      filter(count_large == large,
             count_small == small) %>%
      select(MPN_mean) %>%
      as.numeric()
  }
  #
  # for QuantiTray/Legiolert
  if (method %in% "qt-legio") {
    result <-
      quanti_96 %>%
      filter(count_large == large,
             count_small == small) %>%
      select(MPN_mean) %>%
      as.numeric()
  }
  #
  result
}
#~~~~~~~~
