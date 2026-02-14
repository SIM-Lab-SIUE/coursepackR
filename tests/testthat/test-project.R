test_that("final_project creates expected structure", {
  tmp <- withr::local_tempdir()
  path <- final_project("mc451", dest = tmp)

  expect_true(dir.exists(path))
  expect_true(dir.exists(file.path(path, "data")))
  expect_true(dir.exists(file.path(path, "output")))
  expect_true(file.exists(file.path(path, "research_paper.qmd")))
  expect_true(file.exists(file.path(path, "references.bib")))
  expect_true(file.exists(file.path(path, "README.md")))
  expect_true(file.exists(file.path(path, "mc451_final.Rproj")))
})

test_that("final_project errors if directory exists", {
  tmp <- withr::local_tempdir()
  final_project("mc451", dest = tmp)
  expect_error(final_project("mc451", dest = tmp))
})
