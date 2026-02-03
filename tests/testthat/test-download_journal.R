test_that("download_journal copies journal scaffold for an installed course", {
	base <- system.file("courses", package = "coursepackR")
	skip_if(identical(base, ""), "No courses installed with the package")

	courses <- list.dirs(base, recursive = FALSE, full.names = FALSE)
	with_journal <- courses[dir.exists(file.path(base, courses, "journal"))]
	skip_if(!length(with_journal), "No journal scaffold found in installed courses")

	course <- with_journal[[1]]
	td <- withr::local_tempdir()
	expect_invisible(download_journal(course, dest = td))

	# at least one file was copied
	copied <- list.files(td, recursive = TRUE, all.files = TRUE, full.names = TRUE, no.. = TRUE)
	copied <- copied[!dir.exists(copied)]
	expect_gt(length(copied), 0L)
})
