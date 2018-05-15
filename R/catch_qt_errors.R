#' Catch input errors before using lookup tables
#'
#' This function catches input errors for the \code{quantify_} family of
#' functions.
#' This function is an internal function for the package \pkg{quantitray}.
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
#' @return Error if any input erro is detected; nothing if not.
#'
#' @author
#'   Jan Knappe, \email{jan.knappe@@gmail.com}
#'
#' @export
#'

catch_qt_errors <- function(large, small, method) {
  #
  # Function
  # ~~~~~~~~~~~~~~~~
  #
  # set 'small' to dummy value if not provided (for method 'qt')
  if (method %in% "qt") {
    if (!missing(small)) {
      stop("Argument 'small' must not be provided for method 'qt'.")
    }
    small <- "dummy"
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
  # 'small' must be provided for method = qt-2000
  if (method %in% c("qt-2000")) {
    if (missing(small)) {
      stop("Argument 'small' must be provided for method 'qt-2000'")
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
    if (all(large != as.integer(large))) {
      stop("Argument 'large' must be integer.")
    }
  }
  #
  # 'small' must be integer
  if (!missing(small) & all(!small %in% "dummy")) {
    if (!is.numeric(small) ) {
      stop("Argument 'small' must be an integer >= 0.")
    }
    #
    if (all(small != as.integer(small))) {
      stop("Argument 'small' must be integer >= 0.")
    }
  }
  #
  # 'large' and 'small' must be within method-specific bounds
  if (method %in% "qt") {
    if (all(large < 0)) {
      stop("Argument 'large' must be integer >= 0.")
    }
    if (all(large > 51)) {
      stop("Argument 'large' must be non-negative integer <= 51 for method
           'qt.")
    }
  }
  if (method %in% "qt-2000") {
    if (all(large > 49)) {
      if (all(large < 0)) {
        stop("Argument 'large' must be integer >= 0.")
      }
      stop("Argument 'large' must be non-negative integer <= 49 for method
           'qt-2000'.")
    }
    if (all(small < 0)) {
      stop("Argument 'small' must be integer >= 0.")
    }
    if (all(small > 48)) {
      stop("Argument 'small' must be non-negative integer <= 48 for method
           'qt-2000'.")
    }
  }
}
#~~~~~~~~
