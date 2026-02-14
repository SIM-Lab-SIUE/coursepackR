#' Check for Package Updates
#'
#' Checks whether a newer version of coursepackR is available on GitHub and
#' optionally installs it.
#'
#' @param update Character: `"ask"` (default) prompts interactively, `"always"`
#'   updates without asking, `"never"` only checks.
#' @param repo Character GitHub repository in `"owner/repo"` format. Defaults to
#'   `getOption("coursepackR.repo", "SIM-Lab-SIUE/coursepackR")`.
#' @param quiet Logical; if `TRUE`, suppress informational messages.
#' @return Invisibly, `TRUE` if an update was performed, `FALSE` otherwise.
#' @export
#' @examples
#' \dontrun{
#' mccourse_update()
#' mccourse_update(update = "always")
#' }
mccourse_update <- function(update = c("ask", "always", "never"),
                            repo = NULL,
                            quiet = FALSE) {
  update <- match.arg(update)
  repo <- repo %||% getOption("coursepackR.repo", "SIM-Lab-SIUE/coursepackR")

  if (!rlang::is_installed("remotes")) {
    cli::cli_alert_info("Install {.pkg remotes} to enable update checking: {.code install.packages('remotes')}")
    return(invisible(FALSE))
  }

  # Check for newer version
  current <- utils::packageVersion("coursepackR")
  if (!quiet) cli::cli_alert_info("Current version: {.val {current}}")

  latest <- tryCatch(
    {
      tag <- remotes::github_release(repo)
      package_version(sub("^v", "", tag))
    },
    error = function(e) {
      if (!quiet) cli::cli_alert_warning("Could not check for updates: {conditionMessage(e)}")
      return(NULL)
    }
  )

  if (is.null(latest)) return(invisible(FALSE))

  if (current >= latest) {
    if (!quiet) cli::cli_alert_success("coursepackR is up to date ({.val {current}})")
    return(invisible(FALSE))
  }

  if (!quiet) cli::cli_alert_info("Update available: {.val {current}} -> {.val {latest}}")

  do_update <- switch(update,
    always = TRUE,
    never = FALSE,
    ask = {
      if (!interactive()) {
        if (!quiet) cli::cli_alert_info("Run {.code mccourse_update(update = 'always')} to update non-interactively.")
        FALSE
      } else {
        ans <- utils::menu(
          c("Yes, update now", "No, skip"),
          title = "Update coursepackR?"
        )
        ans == 1L
      }
    }
  )

  if (!do_update) return(invisible(FALSE))

  tryCatch(
    {
      remotes::install_github(repo, upgrade = "never", quiet = quiet)
      cli::cli_alert_success("Updated to {.val {latest}}. Restart R to use the new version.")
      invisible(TRUE)
    },
    error = function(e) {
      cli::cli_alert_danger("Update failed: {conditionMessage(e)}")
      invisible(FALSE)
    }
  )
}
