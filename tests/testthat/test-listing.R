test_that("list_courses returns character vector", {
  courses <- list_courses()
  expect_type(courses, "character")
})

test_that("list_courses includes mc451 when templates installed", {
  courses <- list_courses()
  skip_if(length(courses) == 0L, "No courses installed")
  expect_true("mc451" %in% courses)
})

test_that("list_weeks returns sorted week identifiers", {
  weeks <- list_weeks()
  skip_if(length(weeks) == 0L, "No weeks available")
  expect_true(all(grepl("^week_\\d+$", weeks)))
  # Check numeric sort order
  nums <- as.integer(sub("^week_", "", weeks))
  expect_equal(nums, sort(nums))
})

test_that("list_weeks filters by course", {
  courses <- list_courses()
  skip_if(length(courses) == 0L, "No courses installed")
  weeks <- list_weeks(courses[1])
  expect_type(weeks, "character")
  expect_true(length(weeks) > 0L)
})
