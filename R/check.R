#' Check Course Environment
#'
#' Runs a series of diagnostic checks to verify the student's environment
#' is properly configured. Checks R version, RStudio, Quarto CLI, Git, and
#' installed course templates.
#'
#' @param course Character course identifier to check templates for
#'   (default: `"mc451"`).
#' @param min_r Character minimum R version required (default: `"4.1.0"`).
#' @return A named list with logical results for each check:
#'   `r`, `rstudio`, `quarto`, `git`, `templates`.
#' @export
#' @examples
#' \dontrun{
#' mccourse_check()
#' }
mccourse_check <- function(course = "mc451", min_r = "4.1.0") {
  cli::cli_h1("coursepackR Environment Check")


  # R version

  r_ok <- getRversion() >= as.package_version(min_r)
  if (r_ok) {
    cli::cli_alert_success("R {getRversion()} (>= {min_r})")
  } else {
    cli::cli_alert_danger("R {getRversion()} is below minimum {min_r}")
  }


  # RStudio
#'
  rstudio_ok <- tryCatch(
    rlang::is_installed("rstudioapi") && rstudioapi::isAvailable(),
    error = function(e) FALSE
  )
  if (rstudio_ok) {
    cli::cli_alert_success("RStudio detected")
  } else {
    cli::cli_alert_info("RStudio not detected (recommended but not required)")
  }

  # Quarto CLI
  quarto_ok <- .has_exec("quarto")
  if (quarto_ok) {
    cli::cli_alert_success("Quarto CLI found")
  } else {
    cli::cli_alert_danger("Quarto CLI not found. Run {.code mccourse_setup()} or visit {.url https://quarto.org/docs/get-started/}")
  }

  # Git
  git_ok <- .has_exec("git")
  if (git_ok) {
    cli::cli_alert_success("Git found")
  } else {
    cli::cli_alert_danger("Git not found. Visit {.url https://git-scm.com/downloads}")
  }

  # Course templates
  courses <- list_courses()
  templates_ok <- course %in% courses
  if (templates_ok) {
    weeks <- list_weeks(course)
    cli::cli_alert_success("Course {.val {course}}: {length(weeks)} week{?s} available")
  } else if (length(courses) > 0L) {
    cli::cli_alert_warning("Course {.val {course}} not found. Available: {.val {courses}}")
  } else {
    cli::cli_alert_warning("No course templates installed")
  }

  result <- list(
    r = r_ok,
    rstudio = rstudio_ok,
    quarto = quarto_ok,
    git = git_ok,
    templates = templates_ok
  )

  cli::cli_h2("Summary")
  n_pass <- sum(unlist(result))
  n_total <- length(result)
  if (n_pass == n_total) {
    cli::cli_alert_success("All {n_total} checks passed!")
  } else {
    cli::cli_alert_info("{n_pass}/{n_total} checks passed")
  }

  invisible(result)
}
