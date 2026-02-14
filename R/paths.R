# Internal path helpers --------------------------------------------------------

#' Get root path for all course materials
#' @return Character path or empty string if not found
#' @noRd
.courses_root <- function() {

  system.file("courses", package = "coursepackR")
}

#' Get path to a specific course's weeks directory
#' @param course Character course identifier (e.g., "mc451")
#' @return Character path or empty string if not found
#' @noRd
.course_weeks_root <- function(course) {
  root <- .courses_root()
  if (!nzchar(root)) return("")
  path <- file.path(root, course, "weeks")
  if (dir.exists(path)) path else ""
}

#' List available week numbers for a course
#' @param course Character course identifier
#' @return Character vector of zero-padded week numbers (e.g., "01", "02")
#' @noRd
.weeks_for_course <- function(course) {
  weeks_dir <- .course_weeks_root(course)
  if (!nzchar(weeks_dir)) return(character(0))
  dirs <- list.dirs(weeks_dir, full.names = FALSE, recursive = FALSE)
  week_dirs <- grep("^week_\\d+$", dirs, value = TRUE)
  nums <- sub("^week_", "", week_dirs)
  sort(nums)
}

#' Get source path for a specific course/week
#' @param course Character course identifier
#' @param week Integer or character week number
#' @return Character path or empty string if not found
#' @noRd
.src_for_course_week <- function(course, week) {
  weeks_dir <- .course_weeks_root(course)
  if (!nzchar(weeks_dir)) return("")
  week_padded <- sprintf("week_%02d", as.integer(week))
  path <- file.path(weeks_dir, week_padded)
  if (dir.exists(path)) path else ""
}

#' Check if a command-line executable exists
#' @param cmd Character command name
#' @param args Character arguments to test (default "--version")
#' @return Logical
#' @noRd
.has_exec <- function(cmd, args = "--version") {
  found <- nzchar(Sys.which(cmd))
  if (!found) return(FALSE)
  tryCatch(
    {
      system2(cmd, args, stdout = TRUE, stderr = TRUE)
      TRUE
    },
    error = function(e) FALSE,
    warning = function(w) TRUE
  )
}
