test_that("download_journal copies journal scaffold for mc451", {
	td <- withr::local_tempdir()
	expect_invisible(download_journal("mc451", dest = td))

	# at least one expected file exists (adjust to a real file you ship)
	expect_true(file.exists(file.path(td, "index.qmd")) ||
		file.exists(file.path(td, "00__readme.md")))
})
