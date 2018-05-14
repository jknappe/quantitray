#' Conversion table from Quanti-Tray/Legiolert readings to MPN
#'
#' Results from an IDEXX Quanti-Tray/Legiolert are expressed in counts of
#' positive small and large wells. This is a lookup table to convert these
#' counts into MPN (most probable number) expressed in MPN/100 ml. The data set
#' includes the following columns:
#'
#' \itemize{
#'   \item count_large. number of positive large wells (0 -- 6)
#'   \item count_large. number of positive small wells (0 -- 90)
#'   \item MPN_mean. most probable number (0 -- 2272.6)
#' }
#'
#' @docType data
#'
#' @usage data(quanti_96)
#'
#' @format A tibble with 637 rows and 3 variables
#'
#' @keywords datasets
#'
#' @references IDEXX Technologies, Quanti-Tray MPN Table.
#' (\href{https://www.idexx.com/en/water/resources/mpn-generator/}{IDEXX Technologies Ltd})
#'
#' @source \href{https://idexxcom-live-b02da1e51e754c9cb292133b-9c56c33.aldryn-media.com/filer_public/c9/9b/c99b6023-59fa-4418-95ff-f075ec23962c/quanti-tray-legiolert-mpn-table.pdf}{IDEXX Technologies Ltd}
#'
#' @examples
#' data(quanti_96)
#'
"quanti_96"
