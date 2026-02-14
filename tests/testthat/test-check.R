test_that("mccourse_check returns named list", {
  result <- mccourse_check()
  expect_type(result, "list")
  expect_named(result, c("r", "rstudio", "quarto", "git", "templates"))
  # All values should be logical
  expect_true(all(vapply(result, is.logical, logical(1))))
})

test_that("R version check passes for current R", {
  result <- mccourse_check()
  expect_true(result$r)
})
