test_that("download_week creates week folder and copies files", {
  skip_if(length(list_courses()) == 0L, "No courses installed")
  courses <- list_courses()
  weeks <- list_weeks(courses[1])
  skip_if(length(weeks) == 0L, "No weeks available")

  tmp <- withr::local_tempdir()
  week_num <- as.integer(sub("^week_", "", weeks[1]))
  result <- download_week(courses[1], week_num, dest = tmp)

  expect_type(result, "list")
  expect_true(dir.exists(result$dest))
  expect_equal(result$course, courses[1])
})

test_that("download_week errors on invalid course", {
  expect_error(download_week("nonexistent_course_xyz", 1))
})

test_that("download_journal errors on empty course", {
  expect_error(download_journal(""))
})
