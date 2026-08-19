#' Calculate vernalisation time using cardinal temperatures
#'
#' @details 
#' 
#' The daily vernalisation time is calculated by interpolating the effective vernalisation time at three hour intervals between the daily minimum and maximum temperatures, and then averaging these values to get the daily vernalisation time. 
#' 
#' For more information about the Chickpea phenology model, see the 
#' [APSIM Next Generation Chickpea Documentation](https://apsimng-notes.bangyou.me/docs/Plants/Chickpea/Phenology/Vegetative.html).
#' 
#' 
#' @param mint The minimum temperature
#' @param maxt The maximum temperature
#' @param x_temp The cardinal temperatures used to calculate vernalisation time. The default values are defined in chickpea$get("phenology.vernalisation_time.x").
#' @param y_temp The effective vernalisation time at the corresponding cardinal temperatures. The default values are defined in chickpea$get("phenology.vernalisation_time.y").
#' @return The vernalisation time (days).
#' @export
#' @examples 
#' mint <- c(0, 10)
#' maxt <- c(30, 40)
#' vernalisation_days(mint, maxt)
vernalisation_days <- function(mint, maxt,
        x_temp = chickpea$get("phenology.vernalisation_time.x"), 
        y_temp = chickpea$get("phenology.vernalisation_time.y")) {
    stopifnot(is.numeric(mint), is.numeric(maxt), length(mint) == length(maxt))
    stopifnot(sum(is.na(mint)) == 0, sum(is.na(maxt)) == 0)
    stopifnot(all(mint <= maxt))
    stopifnot(is.numeric(x_temp), is.numeric(y_temp), length(x_temp) == length(y_temp))
    stopifnot(sum(is.na(x_temp)) == 0, sum(is.na(y_temp)) == 0)
    temp_3hr <- tidyweather::interpolate_3hr(mint, maxt)
    tt <- matrix(tidyweather::interpolation_function(x = x_temp, y = y_temp, values = temp_3hr), ncol = 8)
    res <- apply(tt, 1, mean)
    return(res)
}

