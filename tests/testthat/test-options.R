
test_that("get returns correct default values", {
    chickpea$reset()
    expect_equal(chickpea$get("phenology.thermal_time.x"), c(0, 30, 40))
    expect_equal(chickpea$get("phenology.thermal_time.y"), c(0, 30, 0))
    expect_equal(chickpea$get("phenology.thermal_time.method"), "HourlySinPpAdjusted")
})

test_that("set updates values correctly", {
    chickpea$set(phenology = list(thermal_time = list(x = c(5, 25, 40), y = c(0, 20, 0))))
    expect_equal(chickpea$get("phenology.thermal_time.x"), c(5, 25, 40))
    expect_equal(chickpea$get("phenology.thermal_time.y"), c(0, 20, 0))

    chickpea$set(phenology = list(thermal_time = list(method = "3hr")))
    expect_equal(chickpea$get("phenology.thermal_time.method"), "3hr")
})

test_that("set enforces group validation", {
    # Missing y
    expect_no_error(
        chickpea$set(phenology = list(thermal_time = list(x = c(1, 2, 3))))
    )

    # x and y different length
    expect_error(
        chickpea$set(phenology = list(thermal_time = list(x = c(1, 2), y = c(0, 1, 2))))
    )

    expect_error(
        chickpea$set(phenology = list(thermal_time = list(method = "default")))
    )
})
