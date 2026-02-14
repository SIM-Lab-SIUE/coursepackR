#' List Available Courses
#'
#' Returns a character vector of course identifiers that have installed
#' weekly template materials.
#'
#' @return Character vector of course names (e.g., `"mc451"`), or an empty
#'   vector if no courses are installed.
#' @export
#' @examples
#' list_courses()
list_courses <- function() {
  root <- .courses_root()
  if (!nzchar(root) || !dir.exists(root)) return(character(0))

  dirs <- list.dirs(root, full.names = FALSE, recursive = FALSE)
  # Keep only directories that have a weeks/ subdirectory with week_XX folders

  has_weeks <- vapply(dirs, function(d) {
    weeks_path <- file.path(root, d, "weeks")
    if (!dir.exists(weeks_path)) return(FALSE)
    week_dirs <- list.dirs(weeks_path, full.names = FALSE, recursive = FALSE)
    any(grepl("^week_\\d+$", week_dirs))
  }, logical(1))

  sort(dirs[has_weeks])
}

#' List Available Weeks
#'
#' Returns the week identifiers available for a given course, or across all
#' courses if no course is specified.
#'
#' @param course Character course identifier (e.g., `"mc451"`). If `NULL`,
#'   returns the union of weeks across all installed courses.
#' @return Character vector of week identifiers (e.g., `"week_01"`, `"week_02"`),
#'   sorted numerically.
#' @export
#' @examples
#' list_weeks()
#' list_weeks("mc451")
list_weeks <- function(course = NULL) {
  if (is.null(course)) {
    courses <- list_courses()
    if (length(courses) == 0L) return(character(0))
    all_weeks <- unique(unlist(lapply(courses, function(c) {
      paste0("week_", .weeks_for_course(c))
    })))
  } else {
    nums <- .weeks_for_course(course)
    if (length(nums) == 0L) return(character(0))
    all_weeks <- paste0("week_", nums)
  }

  # Sort numerically
  nums <- as.integer(sub("^week_", "", all_weeks))
  all_weeks[order(nums)]
}
