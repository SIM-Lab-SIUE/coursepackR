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
  src_files <- list.files(src, full.names = FALSE, recursive = TRUE)
  if (length(src_files) > 0L) {
    src_full <- file.path(src, src_files)
    dest_files <- file.path(target, src_files)
    # Create subdirectories
    dest_dirs <- unique(dirname(dest_files))
    for (d in dest_dirs) {
      if (!dir.exists(d)) dir.create(d, recursive = TRUE)
    }
    file.copy(src_full, dest_files, overwrite = FALSE, copy.date = TRUE)
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

#' Download Journal Entry Template
#'
#' Creates a week-specific copy of the journal template. Each call produces a
#' uniquely named file (e.g., `Week_03_Journal.qmd`) so previous entries are
#' never overwritten.
#'
#' @param week Integer week number (1--17).
#' @param course Character course identifier (default: `"mc451"`).
#' @param dest Character destination directory (default: current directory).
#'   A `journal/` subdirectory is created automatically.
#' @return Invisibly, the path to the created file.
#' @export
#' @examples
#' \dontrun{
#' download_journal(3)
#' download_journal(5, dest = "~/my-course")
#' }
download_journal <- function(week, course = "mc451", dest = ".") {
  rlang::check_required(week)

  week_num <- as.integer(week)
  if (is.na(week_num) || week_num < 1L || week_num > 17L) {
    cli::cli_abort("{.arg week} must be a number between 1 and 17.")
  }

  # Find template
  root <- .courses_root()
  if (!nzchar(root)) {
    cli::cli_abort("No course materials found. Is {.pkg coursepackR} installed correctly?")
  }

  template <- file.path(root, course, "journal", "journal_template.qmd")
  if (!file.exists(template)) {
    cli::cli_abort(c(
      "Journal template not found for course {.val {course}}.",
      "i" = "Expected: {.path {template}}"
    ))
  }

  # Create destination
  dest <- normalizePath(dest, mustWork = TRUE)
  journal_dest <- file.path(dest, "journal")
  if (!dir.exists(journal_dest)) dir.create(journal_dest, recursive = TRUE)

  # Week-specific filename
  filename <- sprintf("Week_%02d_Journal.qmd", week_num)
  dest_file <- file.path(journal_dest, filename)

  if (file.exists(dest_file)) {
    cli::cli_alert_warning("{.file {filename}} already exists. Skipping to protect your work.")
    cli::cli_alert_info("Delete or rename the existing file if you want a fresh copy.")
    return(invisible(dest_file))
  }

  file.copy(template, dest_file, overwrite = FALSE)

  # Update the week param in the YAML
  lines <- readLines(dest_file, warn = FALSE)
  lines <- sub("^(  week:) .*$", paste0("\\1 ", week_num), lines)
  writeLines(lines, dest_file)

  cli::cli_alert_success("Created {.file {filename}} in {.path {journal_dest}}")
  cli::cli_alert_info("Open it in RStudio, update the params, and write your reflection.")

  invisible(dest_file)
}
