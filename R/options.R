#' chickpea model options manager
#'
#' An options manager for configuring chickpea model parameters. This object provides
#' methods to get and set chickpea related parameters.
#'
#' @section Available Options:
#' \describe{
#'   \item{phenology.thermal_time.x}{Cardinal temperatures for thermal time calculation. Default: c(2, 30, 35)}
#'   \item{phenology.thermal_time.y}{Effective thermal time at corresponding cardinal temperatures. Default: c(0, 28, 0)}
#' }
#'
#' @section Methods:
#' \describe{
#'   \item{get(key)}{Retrieve the value of an option by its key (e.g., "phenology.thermal_time.x")}
#'   \item{set(key, value)}{Set the value of an option by its key}
#'   \item{reset()}{Reset all options to their default values}
#' }
#'
#' @export
#' @importFrom optree create_options_manager
#' @examples
#' # Get default thermal time cardinal temperatures
#' chickpea$get("phenology.thermal_time.x")
#' 
#' # Set custom values
#' chickpea$set("phenology.thermal_time.x" = c(0, 25, 40))
#' chickpea$set("phenology.thermal_time.y" = c(0, 25, 0))
#' 
#' # Reset to defaults
#' chickpea$reset()
chickpea <- optree::create_options_manager(
    defaults = list(
        phenology = list(
            thermal_time = list(
                x = c(0, 30, 40),
                y = c(0, 30, 0)
            )
        )
    ),
    validators = list(
        "phenology.thermal_time" = thermaltime_validator
    )
)
