# ==============================================================================
# Path Utilities for Course Materials
# ==============================================================================
# Internal helper functions to locate course templates within the installed
# package structure. These functions abstract the file system layout so that
# other functions don't need to know the exact directory structure.
#
# Package Structure:
#   inst/courses/<course>/weeks/week_XX/
#   
# Example:
#   inst/courses/mc451/weeks/week_01/
#   inst/courses/mc501/weeks/week_01/
# ==============================================================================

# ------------------------------------------------------------------------------
# Get root path for all course materials
# ------------------------------------------------------------------------------
# Returns the base directory where all course folders are stored.
# This is typically inst/courses/ in the installed package.
#
# @return Character. Full path to courses directory, or "" if not found
# @keywords internal
.mcp_courses_root <- function() system.file("courses", package = "mccoursepack")

# ------------------------------------------------------------------------------
# Get path to a specific course's weeks directory
# ------------------------------------------------------------------------------
# Constructs the path to where all weekly materials for a given course are stored.
#
# @param course Character. Course identifier (e.g., "mc451", "mc501")
# @return Character. Full path to course/weeks directory, or "" if not found
# @keywords internal
.mcp_course_weeks_root <- function(course) {
  base <- .mcp_courses_root()
  if (identical(base, "")) return("")
  file.path(base, course, "weeks")
}

# ------------------------------------------------------------------------------
# List available weeks for a course (as numbers)
# ------------------------------------------------------------------------------
# Scans a course directory and returns the week numbers that have templates.
# Used internally to validate that requested weeks exist.
#
# @param course Character. Course identifier
# @return Character vector. Week numbers like "01", "02", etc., or empty vector
# @keywords internal
.mcp_weeks_for_course <- function(course) {
  root <- .mcp_course_weeks_root(course)
  if (!nzchar(root) || !dir.exists(root)) return(character(0))
  wk_dirs <- dir(root, pattern = "^week_\\d+$", full.names = FALSE)
  # Extract just the numeric part: "week_01" -> "01"
  sub("^week_", "", wk_dirs)
}

# ------------------------------------------------------------------------------
# Get path to a specific week's template directory
# ------------------------------------------------------------------------------
# Constructs the full path to a specific week's materials for a given course.
# This is the source directory that will be copied to students' local folders.
#
# @param course Character. Course identifier
# @param week Character or integer. Week number (will be formatted as "01", "02", etc.)
# @return Character. Full path to week directory, or "" if not found
# @keywords internal
.mcp_src_for_course_week <- function(course, week) {
  week <- sprintf("%02d", as.integer(week))
  root <- .mcp_course_weeks_root(course)
  if (!nzchar(root)) return("")
  file.path(root, paste0("week_", week))
}