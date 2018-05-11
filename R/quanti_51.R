#' Conversion table from Quanti-Tray readings to MPN
#'
#' Results from an IDEXX Quanti-Tray are expressed in counts of positive
#' wells. This is a lookup table to convert these counts into MPN (most
#' probable number) with upper and lower 95% confidence limits expressed
#' in MPN/100 ml. The data set includes the following columns:
#'
#' \itemize{
#'   \item count_large. number of positive wells (0 -- 51)
#'   \item MPN_95lo. lower 95% confidence interval (0 -- 146.1)
#'   \item MPN_mean. most probable number (0 -- 200.5)
#'   \item MPN_95hi. upper 95% confidence interval (3.67 -- 387.6)
#' }
#'
#' @docType data
#'
#' @usage data(quanti_51)
#'
#' @format A tibble with 52 rows and 4 variables
#'
#' @keywords datasets
#'
#' @references IDEXX Technologies, Quanti-Tray MPN Table.
#' (\href{https://www.idexx.com/en/water/resources/mpn-generator/}{IDEXX Technologies Ltd})
#'
#' @source \href{https://idexxcom-live-b02da1e51e754c9cb292133b-9c56c33.aldryn-media.com/filer_public/0f/45/0f4542b3-2b85-432b-aa79-e480ce5ad99f/qt51mpntable.pdf}{IDEXX Technologies Ltd}
#'
#' @examples
#' data(quanti_51)
#'
"quanti_51"
