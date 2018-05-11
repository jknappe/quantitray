#' Conversion table from Quanti-Tray/2000 readings to MPN
#'
#' Results from an IDEXX Quanti-Tray/2000 are expressed in counts of positive
#' small and large wells. This is a lookup table to convert these counts into
#' MPN (most probable number) counts with upper and lower 95% confidence limits
#' expressed in MPN/100 ml. The data set includes the following columns:
#'
#' \itemize{
#'   \item count_large. number of positive large wells (0 -- 49)
#'   \item count_small. number of positive small wells (0 -- 48)
#'   \item MPN_95lo. lower 95% confidence interval (0 -- 1630.37)
#'   \item MPN_mean. most probable number (0 -- 2419.57)
#'   \item MPN_95hi. upper 95% confidence interval (3.67 -- 4716.10)
#' }
#'
#' @docType data
#'
#' @usage data(quanti_2000)
#'
#' @format A tibble with 2450 rows and 5 variables
#'
#' @keywords datasets
#'
#' @references IDEXX Technologies, Quanti-Tray/2000 MPN Table.
#' (\href{https://www.idexx.com/en/water/resources/mpn-generator/}{IDEXX Technologies Ltd})
#'
#' @source \href{http://www.idexx.co.uk/files/water-en-gb/qt97mpntable.pdf}{IDEXX Technologies Ltd}
#'
#' @examples
#' data(quanti_97)
#'
"quanti_97"
