#' Download Weekly Course Materials
#'
#' Copies a week's template files from the installed package to a local
#' directory. Creates a `week_XX` subdirectory at the destination.
#'
#' @param course Character course identifier (e.g., `"mc451"`). If only one
#'   course is installed, this can be an integer week number for convenience.
#' @param week Integer or character week number. Accepts `1`, `"01"`, or
#'   `"week_01"` formats.
#' @param dest Character destination directory (default: current directory).
#' @return Invisibly, a list with components `dest`, `course`, `week`, and
#'   `n_copied`.
#' @export
#' @examples
#' \dontrun{
#' download_week("mc451", 1)
#' download_week("mc451", 1, dest = "~/my-course")
#' }
download_week <- function(course, week = NULL, dest = ".") {
  # Backward compatibility: download_week(1) when one course installed

  if (is.null(week) && is.numeric(course)) {
    courses <- list_courses()
    if (length(courses) == 1L) {
      week <- course
      course <- courses[1L]
    } else {
      cli::cli_abort("Multiple courses installed. Please specify both {.arg course} and {.arg week}.")
    }
  }

  rlang::check_required(week)

  # Normalize week format

  week_str <- as.character(week)
  week_str <- sub("^week_", "", week_str)
  week_num <- as.integer(week_str)
  if (is.na(week_num)) {
    cli::cli_abort("{.arg week} must be a number or 'week_XX' format, not {.val {week}}.")
  }
  week_padded <- sprintf("%02d", week_num)
  week_label <- paste0("week_", week_padded)

  # Find source

  src <- .src_for_course_week(course, week_num)
  if (!nzchar(src)) {
    available <- .weeks_for_course(course)
    if (length(available) == 0L) {
      cli::cli_abort(c(
        "No weeks found for course {.val {course}}.",
        "i" = "Available courses: {.val {list_courses()}}"
      ))
    }
    cli::cli_abort(c(
      "Week {.val {week_label}} not found for course {.val {course}}.",
      "i" = "Available weeks: {.val {paste0('week_', available)}}"
    ))
  }

  # Create destination
  target <- file.path(normalizePath(dest, mustWork = TRUE), week_label)
  if (!dir.exists(target)) dir.create(target, recursive = TRUE)

  # Copy files
  src_files <- list.files(src, full.names = TRUE, recursive = TRUE)
  if (length(src_files) > 0L) {
    # Preserve subdirectory structure
    rel_paths <- sub(paste0("^", gsub("([\\[\\](){}\\\\^$.|?*+])", "\\\\\\1", src), "[\\\\/]?"), "", src_files)
    dest_files <- file.path(target, rel_paths)
    # Create subdirectories
    dest_dirs <- unique(dirname(dest_files))
    for (d in dest_dirs) {
      if (!dir.exists(d)) dir.create(d, recursive = TRUE)
    }
    file.copy(src_files, dest_files, overwrite = FALSE, copy.date = TRUE)
    n_copied <- length(src_files)
  } else {
    n_copied <- 0L
  }

  cli::cli_alert_success("Downloaded {.val {week_label}} for {.val {course}} ({n_copied} file{?s}) to {.path {target}}")

  invisible(list(
    dest = target,
    course = course,
    week = week_padded,
    n_copied = n_copied
  ))
}

#' Download Journal Scaffold
#'
#' Copies the journal template directory for a course to a local folder.
#'
#' @param course Character course identifier (e.g., `"mc451"`).
#' @param dest Character destination directory (default: current directory).
#' @return Invisibly, a character vector of file paths that were written.
#' @export
#' @examples
#' \dontrun{
#' download_journal("mc451")
#' }
download_journal <- function(course, dest = ".") {
  rlang::check_required(course)

  if (!is.character(course) || length(course) != 1L || !nzchar(course)) {
    cli::cli_abort("{.arg course} must be a single non-empty string.")
  }

  # Search for journal directory
  root <- .courses_root()
  if (!nzchar(root)) {
    cli::cli_abort("No course materials found. Is {.pkg coursepackR} installed correctly?")
  }

  journal_dir <- file.path(root, course, "journal")
  if (!dir.exists(journal_dir)) {
    available <- list_courses()
    cli::cli_abort(c(
      "No journal scaffold found for course {.val {course}}.",
      "i" = "Available courses: {.val {available}}"
    ))
  }

  # Copy to destination
  dest <- normalizePath(dest, mustWork = TRUE)
  journal_dest <- file.path(dest, "journal")
  if (!dir.exists(journal_dest)) dir.create(journal_dest, recursive = TRUE)

  src_files <- list.files(journal_dir, full.names = TRUE, recursive = TRUE)
  if (length(src_files) == 0L) {
    cli::cli_alert_warning("Journal scaffold for {.val {course}} is empty.")
    return(invisible(character(0)))
  }

  rel_paths <- sub(paste0("^", gsub("([\\[\\](){}\\\\^$.|?*+])", "\\\\\\1", journal_dir), "[\\\\/]?"), "", src_files)
  dest_files <- file.path(journal_dest, rel_paths)
  dest_dirs <- unique(dirname(dest_files))
  for (d in dest_dirs) {
    if (!dir.exists(d)) dir.create(d, recursive = TRUE)
  }
  file.copy(src_files, dest_files, overwrite = FALSE, copy.date = TRUE)

  cli::cli_alert_success("Downloaded journal scaffold for {.val {course}} ({length(src_files)} file{?s}) to {.path {journal_dest}}")

  invisible(dest_files)
}
