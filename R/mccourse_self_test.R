# ==============================================================================
# Course Environment Self-Test
# ==============================================================================
# This file provides a simplified self-test function that verifies course
# templates are installed and discoverable. It's a lightweight alternative to
# the full check_env.R diagnostics, focusing only on template availability.
# ==============================================================================

# ------------------------------------------------------------------------------
# Minimal Self-Test for Course Templates
# ------------------------------------------------------------------------------
#' Minimal self-test for installed course templates
#'
#' Checks that installed course templates are discoverable in the package
#' and reports which courses and weeks are available. This is a lighter-weight
#' diagnostic than mccourse_self_test() from check_env.R, focusing only on
#' template availability rather than full environment checks.
#'
#' @section What It Checks:
#' * Verifies inst/courses/ directory exists in the package
#' * Lists all discoverable courses (e.g., "mc451", "mc501")
#' * For each course, lists available weeks
#' * Returns TRUE invisibly on success
#'
#' @section Typical Output:
#' \preformatted{
#' Found courses: mc451, mc501
#'   - mc451 weeks: week_01, week_02, week_03, ...
#'   - mc501 weeks: week_01, week_02, week_03, ...
#' }
#'
#' @return Logical (invisible). TRUE if templates are discoverable, otherwise
#'   stops with an error message.
#'   
#' @export
#' @examples
#' \donttest{
#' # Check what course materials are installed
#' mccourse_self_test()
#' }
mccourse_self_test <- function() {
  # Get base course directory
  base <- .mcp_courses_root()
  if (identical(base, "")) {
    stop("No installed templates found under inst/courses in this package.", call. = FALSE)
  }
  
  # List all available courses
  crs <- list_courses()
  if (!length(crs)) {
    message("No courses found under installed 'courses/'.")
    return(invisible(TRUE))
  }
  
  # Report courses and their weeks
  message("Found courses: ", paste(crs, collapse = ", "))
  for (c in crs) {
    w <- list_weeks(c)
    message(sprintf("  - %s weeks: %s", c, if (length(w)) paste(w, collapse = ", ") else "<none>"))
  }
  
  invisible(TRUE)
}