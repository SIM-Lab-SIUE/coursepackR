# ==============================================================================
# Course and Week Listing Functions
# ==============================================================================
# These functions help students discover what materials are available in the
# installed package. They scan the package's inst/courses/ directory and
# return available courses and week numbers.
#
# Typical workflow:
#   1. list_courses() -> see what courses are available
#   2. list_weeks("mc451") -> see what weeks exist for that course
#   3. download_week("mc451", 1) -> get the materials
# ==============================================================================

# ------------------------------------------------------------------------------
# List Available Courses
# ------------------------------------------------------------------------------
#' List available courses with installed templates
#'
#' Scans the package installation and returns names of courses that have
#' weekly templates available. A course is included only if it has at least
#' one week folder under inst/courses/<course>/weeks/.
#'
#' @return Character vector of course names (e.g., c("mc451", "mc501")), or
#'   empty vector if no courses found.
#'   
#' @section Package Structure:
#' This function expects the following directory structure:
#' \preformatted{
#'   inst/courses/
#'     mc451/weeks/week_01/
#'     mc501/weeks/week_01/
#' }
#'
#' @export
#' @examples
#' # See what courses are available
#' list_courses()
#' #> [1] "mc451" "mc501"
list_courses <- function() {
  base <- .mcp_courses_root()
  if (identical(base, "")) return(character(0))
  
  # List all directories under inst/courses/
  dirs <- dir(base, full.names = FALSE, recursive = FALSE)
  
  # Keep only those that have a weeks/ subdirectory with week_XX folders
  keep <- vapply(dirs, function(d) {
    wr <- file.path(base, d, "weeks")
    dir.exists(wr) && length(dir(wr, pattern = "^week_\\d+$", full.names = FALSE)) > 0
  }, logical(1))
  
  sort(dirs[keep])
}

# ------------------------------------------------------------------------------
# List Available Weeks
# ------------------------------------------------------------------------------
#' List available week templates
#'
#' Returns the directory names (e.g., "week_01", "week_02") for available
#' weekly templates. Can be called for a specific course or across all courses.
#'
#' @param course Character or NULL. If provided (e.g., "mc451"), returns weeks
#'   for that course only. If NULL (default), aggregates across all courses
#'   and returns unique week folder names.
#'   
#' @return Character vector of week directory names like "week_01", "week_02", 
#'   sorted numerically. Returns empty vector if no weeks found.
#'
#' @section Usage Notes:
#' * Week names include the "week_" prefix and are zero-padded (e.g., "week_01")
#' * If course is NULL, you'll get the union of all weeks across all courses
#' * Different courses may have different weeks available
#'
#' @export
#' @examples
#' # List all weeks across all courses
#' list_weeks()
#' #> [1] "week_01" "week_02" "week_03" ...
#' 
#' # List weeks for a specific course
#' \donttest{
#' list_weeks("mc451")
#' }
list_weeks <- function(course = NULL) {
  base <- .mcp_courses_root()
  if (identical(base, "")) return(character(0))
  
  # If no course specified, aggregate across all courses
  if (is.null(course)) {
    crs <- list_courses()
    if (!length(crs)) return(character(0))
    
    # Collect all week folders from all courses and get unique set
    uniq <- unique(unlist(lapply(crs, function(c) {
      wr <- file.path(base, c, "weeks")
      dir(wr, pattern = "^week_\\d+$", full.names = FALSE)
    }), use.names = FALSE))
    
    return(sort(uniq))
  }
  
  # For a specific course, list its weeks
  wr <- .mcp_course_weeks_root(course)
  if (!nzchar(wr) || !dir.exists(wr)) return(character(0))
  sort(dir(wr, pattern = "^week_\\d+$", full.names = FALSE))
}