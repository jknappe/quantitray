#' Convert IDEXX QuantiTray results to MPN
#'
#' This function converts counts of positive wells (large and small) into point
#' estimete MPN (most probable number) values in units of MPN/100ml for IDEXX
#' QuantiTray, QuantiTray/2000, and QuantiTray/Legiolert trays.
#'
#' @param large Number of positve large wells (required for all methods).
#' @param small Number of positve small wells (required for method
#' \code{qt-2000} and \code{qt-legio}).
#' @param method Defines which QuantiTray method was used:
#'   \itemize{
#'     \item \code{qt} for QuantiTray method with 51 wells.
#'     \item \code{qt-2000} for QuantiTray/2000 method with 97 wells.
#'     \item \code{qt-legio} for QuantiTray/Legiolert method with 96 wells.
#'   }
#'
#' @return Numerical value: Point estimate of MPN/100ml in sample.
#'
#' @references
#'   \url{https://www.idexx.com/en/water/resources/mpn-generator/}
#'
#' @author
#'   Jan Knappe, \email{jan.knappe@@gmail.com}
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr select
#' @importFrom rlang .data
#'
#' @export
#'
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
  catch_qt_errors(large, small, method)
  #
  # set 'small' to dummy value if not provided (for method 'qt')
  if (method %in% "qt") {
    small <- "dummy"
  }
  #
  # Function
  # ~~~~~~~~~~~~~~~~
  #
  result <-
    load_qt_lookuptable(large, small, method) %>%
    select(.data$MPN_mean) %>%
    as.list()
  #
  result[[1]]
}
#~~~~~~~~
