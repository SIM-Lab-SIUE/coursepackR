# ==============================================================================
# Download Weekly Course Materials
# ==============================================================================
# This file contains the primary function students use to copy weekly templates
# from the installed package to their local working directory. It handles both
# single-course and multi-course installations, with backward compatibility.
# ==============================================================================

# ------------------------------------------------------------------------------
# Download Week Template
# ------------------------------------------------------------------------------
#' Download a week's course template to local directory
#'
#' Copies the installed template files for a given course and week into a
#' subfolder named `week_XX` inside the destination directory. This is the
#' primary function students use to get their weekly assignment materials.
#'
#' @section Backward Compatibility:
#' If you call `download_week(1, dest)` with only a week number, the function
#' assumes there is exactly one installed course and uses it automatically.
#' If multiple courses are installed, you must specify the course explicitly.
#'
#' @section Empty Weeks:
#' Some weeks (e.g., holidays or break weeks) may have no files. In these cases,
#' the function still creates the `week_XX` folder but copies nothing into it.
#' This ensures consistent folder structure across all weeks.
#'
#' @param course Character. Course name (e.g., "mc451", "mc501"). For backward
#'   compatibility, you may pass only `week` as the first argument if exactly
#'   one course is installed.
#' @param week Integer or character. Week number as integer (1, 2, ...) or
#'   string ("01", "week_01"). Will be formatted as "week_01", "week_02", etc.
#' @param dest Character. Destination directory path (created if needed).
#'   Defaults to current working directory (".").
#'   
#' @return Invisibly returns a list with components:
#'   \describe{
#'     \item{dest}{Full normalized path to the created week folder}
#'     \item{course}{Course identifier used}
#'     \item{week}{Zero-padded week number ("01", "02", ...)}
#'     \item{n_copied}{Number of files successfully copied}
#'   }
#'   
#' @export
#' @examples
#' \dontrun{
#' # Download MC451 Week 1 to current directory
#' download_week("mc451", 1)
#' 
#' # Download to specific folder
#' download_week("mc451", 1, dest = "~/coursework")
#' 
#' # Backward compatible: single-course installation
#' download_week(1)  # Auto-detects course
#' 
#' # Use string week identifier
#' download_week("mc501", "week_03")
#' }
download_week <- function(course, week = NULL, dest = ".") {
  # Back-compat: allow download_week(week, dest) if only one course installed
  if (is.null(week)) {
    if (missing(course)) stop("Provide either (course, week) or at least 'week'.", call. = FALSE)
    if (length(course) == 1 && (is.numeric(course) || grepl("^\\d+$", course) || grepl("^week_\\d+$", course))) {
      week <- course
      crs <- list_courses()
      if (!length(crs)) stop("No installed courses found.", call. = FALSE)
      if (length(crs) > 1) {
        stop("Multiple courses installed (", paste(crs, collapse = ", "),
             "). Please call download_week(course, week, ...).", call. = FALSE)
      }
      course <- crs[[1L]]
    } else {
      stop("Usage: download_week(course, week, dest = '.')", call. = FALSE)
    }
  }

  # Accept "01" or "week_01"
  if (is.character(week) && grepl("^week_\\d+$", week)) {
    week_num <- sub("^week_", "", week)
  } else {
    week_num <- sprintf("%02d", as.integer(week))
  }

  src <- .mcp_src_for_course_week(course, week_num)
  if (!nzchar(src) || !dir.exists(src)) {
    stop("Template for course '", course, "' week ", week_num, " not found in the installed package.", call. = FALSE)
  }

  # Ensure destination and *week subfolder* exist
  if (!dir.exists(dest)) dir.create(dest, recursive = TRUE, showWarnings = FALSE)
  target_dir <- file.path(dest, paste0("week_", week_num))
  if (!dir.exists(target_dir)) dir.create(target_dir, recursive = TRUE, showWarnings = FALSE)

  # List files to copy (exclude directories)
  src_files <- list.files(src, recursive = TRUE, all.files = TRUE, full.names = TRUE, no.. = TRUE)
  src_files <- src_files[!dir.exists(src_files)]

  # Empty week: return after ensuring the folder exists
  if (length(src_files) == 0L) {
    return(invisible(list(dest = normalizePath(target_dir),
                          course = course, week = week_num, n_copied = 0L)))
  }

  # Normalize to forward slashes so sub() works on Windows too
  src_norm    <- normalizePath(src,       winslash = "/", mustWork = TRUE)
  files_norm  <- normalizePath(src_files, winslash = "/", mustWork = TRUE)

  # Relative paths from src -> used under target_dir
  rel <- sub(paste0("^", gsub("([\\^\\$\\\\.\\|\\(\\)\\[\\]\\*\\+\\?])", "\\\\\\1", src_norm), "/?"),
             "", files_norm)

  # Ensure subdirs under the target dir
  subdirs <- unique(dirname(rel))
  for (d in subdirs) {
    if (!identical(d, ".") && nzchar(d)) {
      dir.create(file.path(target_dir, d), recursive = TRUE, showWarnings = FALSE)
    }
  }

  ok <- file.copy(from = src_files, to = file.path(target_dir, rel),
                  overwrite = TRUE, copy.mode = TRUE, copy.date = TRUE)
  n_copied <- sum(ok)

  invisible(list(dest = normalizePath(target_dir),
                 course = course, week = week_num, n_copied = n_copied))
}

# internal helper (unchanged)
.mcp_src_for_course_week <- function(course, week_num) {
  root <- .mcp_course_weeks_root(course)
  if (!nzchar(root)) return("")
  file.path(root, paste0("week_", week_num))
}
