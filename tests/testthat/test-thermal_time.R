test_that("Thermal time", {
    old <- options(digits = 20)
    chickpea$reset()
    # The daily thermal time
    mint <- c(0, 10)
    maxt <- c(30, 40)
    date <- as.Date(c("2024-01-01", "2024-01-02"))
    res <- thermal_time(mint, maxt, date = date, latitude = -27)
    expect_equal(round(res, 1), c(16.6, 24.9), tolerance=1e-3)
    
    #expect_equal(res$value[1], 16.391951095089993, tolerance=1e-3)
    # Read weather records
    met_file <- system.file("extdata/ppd_72150.met", package = "tidyweather")
    records <- tidyweather::read_weather(met_file)
    res <- thermal_time(records$mint, records$maxt, date = records$date, latitude = records$latitude[1])
    expect_equal(round(res[1], 1), 21.9, tolerance=1e-3)

    expect_equal(length(res), length(records$mint))
    expect_true(all(is.finite(res)))

    options(old)
})
