#' Download a course's journal scaffold to a local folder
#'
#' Copies the journal scaffold for `course` into `dest`, preserving subfolders.
#' Supports both package layouts:
#'   - inst/courses/<course>/journal/
#'   - inst/extdata/courses/<course>/journal/
#'
#' @param course Character scalar. e.g., "mc451" or "mc501".
#' @param dest   Destination directory (default "." = current working dir).
#' @param package Package name that contains the scaffolds (default "mccoursepack").
#' @return (invisibly) a character vector of written file paths.
#' @export
download_journal <- function(course, dest = ".", package = "mccoursepack") {
  # ---- checks ----
  if (missing(course) || !is.character(course) || length(course) != 1L || !nzchar(course)) {
    stop('`course` must be a non-empty character scalar like "mc451".', call. = FALSE)
  }
  if (!is.character(dest) || length(dest) != 1L || !nzchar(dest)) {
    stop("`dest` must be a non-empty character path.", call. = FALSE)
  }

  # ---- locate scaffold roots (installed first, then dev-tree fallbacks) ----
  candidates <- character(0)

  # Installed package: inst/courses/...
  p1 <- system.file("courses", package = package)
  if (nzchar(p1)) candidates <- c(candidates, p1)

  # Installed package: inst/extdata/courses/...
  p2 <- system.file("extdata", "courses", package = package)
  if (nzchar(p2)) candidates <- c(candidates, p2)

  # Dev tree root
  pkg_path <- tryCatch(getNamespaceInfo(package, "path"), error = function(e) NULL)
  if (!is.null(pkg_path)) {
    # Dev: <pkg>/inst/courses
    p3 <- file.path(pkg_path, "inst", "courses")
    if (dir.exists(p3)) candidates <- c(candidates, p3)

    # Dev: <pkg>/inst/extdata/courses
    p4 <- file.path(pkg_path, "inst", "extdata", "courses")
    if (dir.exists(p4)) candidates <- c(candidates, p4)
  }

  # pick the first root that contains <course>/journal
  src <- NULL
  for (root in candidates) {
    cand <- file.path(root, course, "journal")
    if (dir.exists(cand)) { src <- cand; break }
  }

  if (is.null(src)) {
    # Build helpful message
    seen_courses <- unique(unlist(lapply(candidates, function(root) {
      if (dir.exists(root)) {
        b <- list.dirs(root, full.names = FALSE, recursive = FALSE)
        b[nzchar(b)]
      } else character(0)
    })))
    stop(sprintf(
      paste0(
        "No journal scaffold found for course \"%s\".\n",
        "I looked under these roots:\n - %s\n",
        "Expected subpath: <root>/%s/journal/\n",
        "Available courses seen: %s"
      ),
      course,
      if (length(candidates)) paste(candidates, collapse = "\n - ") else "(none)",
      course,
      if (length(seen_courses)) paste(seen_courses, collapse = ", ") else "(none)"
    ), call. = FALSE)
  }

  # ---- ensure dest exists ----
  if (!dir.exists(dest)) {
    ok <- dir.create(dest, recursive = TRUE, showWarnings = FALSE)
    if (!ok) stop(sprintf("Could not create destination directory: %s", dest), call. = FALSE)
  }

  # ---- copy recursively ----
  all_paths <- list.files(src, recursive = TRUE, all.files = TRUE, full.names = TRUE,
                          include.dirs = TRUE, no.. = TRUE)
  dir_paths  <- all_paths[dir.exists(all_paths)]
  file_paths <- setdiff(all_paths, dir_paths)

  rel <- function(p) substring(p, first = nchar(src) + 2L)

  # create directories first
  for (d in file.path(dest, vapply(dir_paths, rel, character(1L)))) {
    if (!dir.exists(d)) dir.create(d, recursive = TRUE, showWarnings = FALSE)
  }

  dest_files <- character(0)
  if (length(file_paths)) {
    dest_files <- file.path(dest, vapply(file_paths, rel, character(1L)))
    for (i in seq_along(file_paths)) {
      parent <- dirname(dest_files[i])
      if (!dir.exists(parent)) dir.create(parent, recursive = TRUE, showWarnings = FALSE)
      ok <- file.copy(from = file_paths[i], to = dest_files[i],
                      overwrite = TRUE, copy.mode = TRUE, copy.date = TRUE)
      if (!ok) stop(sprintf("Failed to copy: %s -> %s", file_paths[i], dest_files[i]), call. = FALSE)
    }
  }

  invisible(dest_files)
}
