# Calculate thermal time using cardinal temperatures

Calculate thermal time using cardinal temperatures

## Usage

``` r
thermal_time(
  mint,
  maxt,
  x_temp = chickpea$get("phenology.thermal_time.x"),
  y_temp = chickpea$get("phenology.thermal_time.y"),
  method = "HourlySinPpAdjusted",
  ...
)
```

## Arguments

- mint:

  The minimum temperature

- maxt:

  The maximum temperature

- x_temp:

  The cardinal temperatures using to calculate thermal time. The default
  values are c(2, 30, 35) defined in
  chickpea\$get("phenology.thermal_time.x").

- y_temp:

  The effective thermal time at the corresponding cardinal temperatures.
  The default values are c(0, 28, 0) defined in
  chickpea\$get("phenology.thermal_time.y").

- method:

  The method to calculate thermal time. The default is
  `"HourlySinPpAdjusted"`. Other options are `"3hr"` and `NULL` (mean
  temperature).

- ...:

  Additional arguments passed to the underlying
  [`tidyweather::thermal_time`](https://tidyweather.bangyou.me/reference/thermal_time.html)
  function.

## Value

The thermal time.

## Details

The daily thermal time is calculated by interpolating the effective
thermal time at three hour intervals between the daily minimum and
maximum temperatures, and then averaging these values to get the daily
thermal time. For more information about the chickpea phenology model,
see the [APSIM Next Generation chickpea
Documentation](https://notes.apsimng.bangyou.me/docs/Plants/chickpea/Phenology/ThermalTime.html).

## Examples

``` r
mint <- c(0, 10)
maxt <- c(30, 40)
date <- as.Date(c("2024-01-01", "2024-01-02"))
thermal_time(mint, maxt, date = date, lat = -27)
#> [1] 16.64386 24.88400
```
