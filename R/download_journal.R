#' Download a course's journal scaffold to a local folder
#'
#' Copies the entire `inst/extdata/courses/<course>/journal/` directory
#' into `dest`, preserving subfolders. Defaults to the current working directory.
#'
#' @param course Character scalar. Course identifier, e.g., "mc451" or "mc501".
#' @param dest Character path to a local folder to receive the files. Defaults to ".".
#' @return (Invisibly) a character vector of file paths written.
#' @export
#' @examples
#' \dontrun{
#' download_journal("mc451")
#' download_journal("mc501", dest = "my-journal")
#' }
download_journal <- function(course, dest = ".") {
	# basic checks
	if (missing(course) || !is.character(course) || length(course) != 1L || nchar(course) == 0L) {
		stop("`course` must be a non-empty character scalar like \"mc451\".", call. = FALSE)
	}
	if (!is.character(dest) || length(dest) != 1L || nchar(dest) == 0L) {
		stop("`dest` must be a non-empty character path.", call. = FALSE)
	}

	# locate the journal scaffold inside the installed package
	src <- system.file("extdata", "courses", course, "journal", package = utils::packageName())
	if (is.null(src) || identical(src, "")) {
		stop(sprintf("No journal scaffold found for course \"%s\". Expected under inst/extdata/courses/%s/journal/.",
			course, course), call. = FALSE)
	}

	# ensure dest exists
	if (!dir.exists(dest)) {
		ok <- dir.create(dest, recursive = TRUE, showWarnings = FALSE)
		if (!ok) stop(sprintf("Could not create destination directory: %s", dest), call. = FALSE)
	}

	# collect files to copy (recursive) and create subdirs at dest
	all_paths <- list.files(src, recursive = TRUE, all.files = TRUE, full.names = TRUE, include.dirs = TRUE, no.. = TRUE)

	# Create directories first
	dir_paths <- all_paths[dir.exists(all_paths)]
	file_paths <- setdiff(all_paths, dir_paths)

	rel_dir <- function(p) substr(p, nchar(src) + 2L, nchar(p)) # relative path inside journal/
	dest_dir_paths <- file.path(dest, vapply(dir_paths, rel_dir, character(1L)))
	dest_file_paths <- file.path(dest, vapply(file_paths, rel_dir, character(1L)))

	for (d in dest_dir_paths) {
		if (!dir.exists(d)) dir.create(d, recursive = TRUE, showWarnings = FALSE)
	}

	# Copy files
	copied <- logical(length(file_paths))
	if (length(file_paths)) {
		for (i in seq_along(file_paths)) {
			from <- file_paths[i]
			to <- dest_file_paths[i]
			# create parent just in case (idempotent)
			parent <- dirname(to)
			if (!dir.exists(parent)) dir.create(parent, recursive = TRUE, showWarnings = FALSE)
			copied[i] <- file.copy(from = from, to = to, overwrite = TRUE, copy.mode = TRUE, copy.date = TRUE)
		}
	}

	# return invisibly the files that were written
	invisible(dest_file_paths[copied])
}
