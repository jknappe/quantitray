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
  # Missing argument 'large'
  if (missing(large)) {
    stop("Argument 'large' must be provided.")
  }
  #
  # Missing argument 'small'
  if (missing(small)) {
    small = -999 # dummy value for small in 'qt'
    if (method %in% c("qt-2000", "qt-legio")) {
      stop("Argument 'small' must be provided.")
    }
  }
  #
  # Missing argument 'method'
  if (missing(method)) {
    stop("Argument 'method' must be provided.")
  }
  #
  # Valid argument 'method'
  if (!missing(method)) {
    if (!method %in% c("qt", "qt-2000", "qt-legio")) {
      stop("Argument 'method' must be either: 'qt', 'qt-2000', 'qt-legio'.")
    }
  }
  #
  # Valid method-specific numerical value of argument 'large'
  if (!missing(large)) {
    if (large < 0) {
      stop("Argument 'large' must be non-negative.")
    } else if (method %in% "qt") {
      if (large > 51) {
        stop("Argument 'large' must be 50 or lower for method 'qt'.")
      }
    } else if (method %in% "qt-2000") {
      if (large > 49) {
        stop("Argument 'large' must be 49 or lower for method 'qt-2000'.")
      }
    } else if (method %in% "qt-legio") {
      if (large > 6) {
        stop("Argument 'large' must be 6 or lower for method 'qt-legio'.")
      }
    }
  }
  #
  # Valid method-specific numerical value of argument 'small'
  if (!missing(small)) {
    if (method %in% "qt") {
      if (small != -999) {
        small = -999
        warning("Argument 'small' is ignored in method 'qt'.")
      }
    } else {
      if (small < 0) {
        stop("Argument 'small' must be non-negative.")
      } else if (method %in% "qt-2000") {
        if (small > 48) {
          stop("Argument 'small' must be 48 or lower for method 'qt-2000'.")
        }
      } else if (method %in% "qt-legio") {
        if (small > 90) {
          stop("Argument 'small' must be 90 or lower for method 'qt-legio'.")
        }
      }
    }
  }
  #
  # Argument 'large' must be integer
  if (!missing(large)) {
    if (!is.numeric(large)) {
      stop("Argument 'large' must be integer.")
    }#
    if (any(large != as.integer(large))) {
      stop("Argument 'large' must be integer.")
    }
  }
  #
  # Argument 'small' must be integer
  if (!missing(small)) {
    if (!is.numeric(small) ) {
      stop("Argument 'small' must be integer.")
    }
    #
    if (all(small != as.integer(small))) {
      stop("Argument 'small' must be integer.")
    }
  }
  #
}
#~~~~~~~~
