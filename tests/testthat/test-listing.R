test_that("list_weeks returns weeks for an installed course", {
  courses <- list_courses()
  skip_if(!length(courses), "No course directories found under inst/courses")

  weeks <- list_weeks(courses[[1]])
  expect_gt(length(weeks), 0L)
})
