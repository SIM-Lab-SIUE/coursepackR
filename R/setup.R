#' One-Time Environment Setup
#'
#' Installs Quarto CLI support, TinyTeX for PDF rendering, and core R packages
#' needed for the course. Safe to run multiple times; only installs missing
#' components.
#'
#' @return Invisibly, `TRUE`.
#' @export
#' @examples
#' \dontrun{
#' mccourse_setup()
#' }
mccourse_setup <- function() {
  cli::cli_h1("coursepackR Setup")

  # Windows Rtools check
  if (.Platform$OS.type == "windows") {
    if (rlang::is_installed("pkgbuild")) {
      if (!pkgbuild::has_build_tools(debug = FALSE)) {
        cli::cli_alert_warning(
          "Rtools not detected. Some packages may not install from source."
        )
        cli::cli_alert_info("Download from {.url https://cran.r-project.org/bin/windows/Rtools/}")
      }
    }
  }

  # Quarto
  cli::cli_h2("Quarto CLI")
  if (.has_exec("quarto")) {
    cli::cli_alert_success("Quarto CLI already available")
  } else {
    cli::cli_alert_warning("Quarto CLI not found on PATH")
    cli::cli_alert_info("Install from {.url https://quarto.org/docs/get-started/}")
  }

  # TinyTeX
  cli::cli_h2("TinyTeX (PDF support)")
  if (rlang::is_installed("tinytex")) {
    if (tinytex::is_tinytex()) {
      cli::cli_alert_success("TinyTeX already installed")
    } else {
      cli::cli_alert_info("Installing TinyTeX...")
      tryCatch(
        {
          tinytex::install_tinytex(force = FALSE)
          cli::cli_alert_success("TinyTeX installed")
        },
        error = function(e) {
          cli::cli_alert_danger("TinyTeX installation failed: {conditionMessage(e)}")
          cli::cli_alert_info("You can try manually: {.code tinytex::install_tinytex()}")
        }
      )
    }
  } else {
    cli::cli_alert_info("Installing {.pkg tinytex} package...")
    tryCatch(
      {
        utils::install.packages("tinytex", quiet = TRUE)
        tinytex::install_tinytex(force = FALSE)
        cli::cli_alert_success("TinyTeX installed")
      },
      error = function(e) {
        cli::cli_alert_danger("Could not install TinyTeX: {conditionMessage(e)}")
      }
    )
  }

  # Core packages
  cli::cli_h2("Core R Packages")
  core_pkgs <- c("cli", "rlang", "rmarkdown", "quarto")
  for (pkg in core_pkgs) {
    if (rlang::is_installed(pkg)) {
      cli::cli_alert_success("{.pkg {pkg}} installed")
    } else {
      cli::cli_alert_info("Installing {.pkg {pkg}}...")
      tryCatch(
        utils::install.packages(pkg, quiet = TRUE),
        error = function(e) {
          cli::cli_alert_danger("Failed to install {.pkg {pkg}}: {conditionMessage(e)}")
        }
      )
    }
  }

  cli::cli_h2("Done")
  cli::cli_alert_success("Setup complete. Run {.code mccourse_check()} to verify your environment.")

  invisible(TRUE)
}
