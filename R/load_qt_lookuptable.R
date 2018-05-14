#' Load data from QuantiTray lookup tables
#'
#' This function loads lookup tables for the quantify_ family of functions.
#' This function is and internal function for the package "quantitray".
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
#'
#' @return Tibble of numeric data values from lookup table.
#'
#' @author
#'   Jan Knappe, \email{jan.knappe@@gmail.com}
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr select
#' @importFrom dplyr tibble
#' @importFrom dplyr left_join
#' @importFrom rlang .data
#'
#' @export
#'

load_qt_lookuptable <- function(large, small, method) {
  #
  # Function
  # ~~~~~~~~~~~~~~~~
  #
  # convert input to tibble
  input <-
    tibble(count_large = large,
           count_small = small)
  #
  # for QuantiTray
  if (method %in% "qt") {
    result <-
      input %>%
      select(.data$count_large) %>%
      left_join(quanti_51,
                by = c("count_large" = "count_large"))
  }
  #
  # for QuantiTray/2000
  if (method %in% "qt-2000") {
    result <-
      input %>%
      left_join(quanti_97,
                by = c("count_large" = "count_large",
                       "count_small" = "count_small"))
  }
  #
  # for QuantiTray/Legiolert
  if (method %in% "qt-legio") {
    result <-
      input %>%
      left_join(quanti_96,
                by = c("count_large" = "count_large",
                       "count_small" = "count_small"))
  }
  result
}
#~~~~~~~~
