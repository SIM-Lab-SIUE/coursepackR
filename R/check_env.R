# ==============================================================================
# Environment Check Functions
# ==============================================================================
# This file contains internal helper functions to verify that required software
# components (R, RStudio, Quarto, Git) are properly installed and accessible.
# These functions are used primarily by mccourse_self_test() to diagnose
# student environment setup issues.
# ==============================================================================

# ------------------------------------------------------------------------------
# Internal helper: Check if an executable exists and responds
# ------------------------------------------------------------------------------
# Verifies that a command-line tool is available on the system PATH and
# responds to a version check. Used to detect Quarto, Git, etc.
#
# @param cmd Character. Name of the executable (e.g., "quarto", "git")
# @param args Character. Arguments to pass (default: "--version")
# @return Logical. TRUE if executable found and responds, FALSE otherwise
# @keywords internal
.has_exec <- function(cmd, args = "--version") {
  path <- Sys.which(cmd)
  if (!nzchar(path)) return(FALSE)
  ok <- tryCatch({
    out <- system2(path, args, stdout = TRUE, stderr = TRUE)
    length(out) > 0
  }, error = function(e) FALSE)
  ok
}


# ------------------------------------------------------------------------------
# Check R Version
# ------------------------------------------------------------------------------
# Verifies that the installed R version meets minimum requirements for the course.
# Students need R >= 4.3.0 for compatibility with modern Quarto and package features.
#
# @param min_version Character. Minimum required R version (default: "4.3.0")
# @return Logical. TRUE if R version is sufficient, FALSE otherwise
# @keywords internal
check_r_min <- function(min_version = "4.3.0") {
  ok <- getRversion() >= as.package_version(min_version)
  if (ok) cli::cli_alert_success("R {as.character(getRversion())} OK (>= {min_version}).")
  else    cli::cli_alert_danger("R {as.character(getRversion())} < {min_version}.")
  ok
}

# ------------------------------------------------------------------------------
# Check RStudio Availability
# ------------------------------------------------------------------------------
# Detects if running inside RStudio IDE. While not strictly required, most
# course workflows assume RStudio for its integrated Git, Quarto, and project
# management features.
#
# @return Logical. TRUE if RStudio detected, FALSE otherwise
# @keywords internal
check_rstudio <- function() {
  ok <- rlang::is_installed("rstudioapi") && rstudioapi::isAvailable()
  if (ok) cli::cli_alert_success("RStudio detected.")
  else    cli::cli_alert_warning("RStudio not detected (OK if using another editor).")
  ok
}

# ------------------------------------------------------------------------------
# Check Quarto CLI
# ------------------------------------------------------------------------------
# Verifies Quarto CLI installation. Quarto is essential for rendering .qmd files
# to HTML and PDF outputs. Students must have Quarto installed and on their PATH.
#
# @return Logical. TRUE if Quarto found, FALSE otherwise
# @keywords internal
check_quarto <- function() {
  ok <- .has_exec("quarto", "--version")
  if (ok) cli::cli_alert_success("Quarto found.")
  else    cli::cli_alert_danger("Quarto not found. Install from https://quarto.org/docs/get-started/")
  ok
}

# ------------------------------------------------------------------------------
# Check Git CLI
# ------------------------------------------------------------------------------
# Verifies Git installation for version control workflows. While not strictly
# required for all assignments, Git is needed for GitHub integration and
# collaborative work.
#
# @return Logical. TRUE if Git found, FALSE otherwise
# @keywords internal
check_git <- function() {
  ok <- .has_exec("git", "--version")
  if (ok) cli::cli_alert_success("Git found.")
  else    cli::cli_alert_danger("Git not found. Install from https://git-scm.com/downloads")
  ok
}

# ------------------------------------------------------------------------------
# Check Course Template Availability
# ------------------------------------------------------------------------------
# Validates that a specific course/week template bundle is installed within the
# package. This ensures students can download materials for their assignments.
#
# @param course Character. Course identifier (e.g., "mc451", "mc501")
# @param week Integer. Week number to check
# @return Logical. TRUE if template found, FALSE otherwise
# @keywords internal
check_course_tree <- function(course = "mc451", week = 1) {
  src <- system.file("courses", course, "weeks", sprintf("week_%02d", week), package = "mccoursepack")
  ok <- src != ""
  if (ok) cli::cli_alert_success("Course/week found in package: {course} week {week}.")
  else    cli::cli_alert_danger("Course/week not found in package: {course} week {week}.")
  ok
}

# ------------------------------------------------------------------------------
# Complete Environment Self-Test
# ------------------------------------------------------------------------------
#' Run diagnostic checks for mccoursepack environment
#' 
#' This is the main user-facing diagnostic function. It checks all critical
#' components needed for course work: R version, RStudio, Quarto, Git, and
#' course template availability. Results are returned as a tibble for easy
#' inspection.
#' 
#' @param course Character. Course to check (default: "mc451")
#' @param week Integer. Week number to verify (default: 1)
#' @return A tibble with TRUE/FALSE results for each check
#' @export
#' @examples
#' \dontrun{
#' # Check environment for MC451 Week 1
#' mccourse_self_test()
#' 
#' # Check specific course/week
#' mccourse_self_test(course = "mc501", week = 3)
#' }
mccourse_self_test <- function(course = "mc451", week = 1) {
  ver <- as.character(utils::packageVersion("mccoursepack"))
  cli::cli_inform("mccoursepack version: {ver}")
  
  # Note: tibble not in DESCRIPTION but used here - should add to Suggests
  tibble::tibble(
    r        = check_r_min("4.3.0"),
    rstudio  = check_rstudio(),
    quarto   = check_quarto(),
    git      = check_git(),
    course   = check_course_tree(course, week)
  )
}