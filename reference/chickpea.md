# chickpea model options manager

An options manager for configuring chickpea model parameters. This
object provides methods to get and set chickpea related parameters.

## Usage

``` r
chickpea
```

## Available Options

- phenology.thermal_time.x:

  Cardinal temperatures for thermal time calculation. Default: c(2, 30,
  35)

- phenology.thermal_time.y:

  Effective thermal time at corresponding cardinal temperatures.
  Default: c(0, 28, 0)

- phenology.vernalisation_time.x:

  Cardinal temperatures for vernalisation time calculation. Default:
  c(0, 2, 8, 15)

- phenology.vernalisation_time.y:

  Effective vernalisation time at corresponding cardinal temperatures.
  Default: c(0, 1, 0.5, 0.0)

## Methods

- get(key):

  Retrieve the value of an option by its key (e.g.,
  "phenology.thermal_time.x")

- set(key, value):

  Set the value of an option by its key

- reset():

  Reset all options to their default values

## Examples

``` r
# Get default thermal time cardinal temperatures
chickpea$get("phenology.thermal_time.x")
#> [1]  0 30 40

# Get default vernalisation time parameters
chickpea$get("phenology.vernalisation_time.x")
#> [1]  0.0  4.7  8.0 14.0
chickpea$get("phenology.vernalisation_time.y")
#> [1] 0.0 1.0 0.5 0.0

# Set custom values
chickpea$set("phenology.thermal_time.x" = c(0, 25, 40))
chickpea$set("phenology.thermal_time.y" = c(0, 25, 0))

# Reset to defaults
chickpea$reset()
```
