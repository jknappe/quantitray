#' Convert IDEXX QuantiTray results to upper 95 \% confidence interval
#'
#' This function converts counts of positive wells (large and small) into upper
#' 95 \% confidence interval values in units of MPN/100ml for IDEXX
#' QuantiTray and QuantiTray/2000 trays.
#'
#' @param large Number of positve large wells (required for all methods).
#' @param small Number of positve small wells (required for 'qt-2000' method).
#' @param method Defines which QuantiTray method was used:
#'   \itemize{
#'     \item 'qt' for QuantiTray method with 51 wells.
#'     \item 'qt-2000' for QuantiTray/2000 method with 97 wells.
#'   }
#'
#' @return Numerical value: upper 95 \% confidence interval of MPN/100ml in
#'   sample.
#'
#' @references
#'   https://www.idexx.com/en/water/resources/mpn-generator/
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
#' quantify_95hi(large = 42, method = "qt")
#' quantify_95hi(large = 42, small = 42, method = "qt-2000")
#'

quantify_95hi <- function(large, small, method) {
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
    select(.data$MPN_95hi) %>%
    as.list()
  #
  result[[1]]
}
#~~~~~~~~
