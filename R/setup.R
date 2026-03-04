#' One-Time Environment Setup
#'
#' Installs Quarto CLI support, TinyTeX for PDF rendering, and all R packages
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

  # Compiler toolchain check
  cli::cli_h2("Compiler Toolchain")
  if (.Platform$OS.type == "windows") {
    if (rlang::is_installed("pkgbuild")) {
      if (!pkgbuild::has_build_tools(debug = FALSE)) {
        cli::cli_alert_warning(
          "Rtools not detected. Some packages may not install from source."
        )
        cli::cli_alert_info(
          "Download from {.url https://cran.r-project.org/bin/windows/Rtools/}"
        )
      } else {
        cli::cli_alert_success("Rtools found")
      }
    }
  } else if (Sys.info()[["sysname"]] == "Darwin") {
    if (.has_exec("xcode-select", args = "-p")) {
      cli::cli_alert_success("Xcode Command Line Tools found")
    } else {
      cli::cli_alert_warning("Xcode Command Line Tools not detected")
      cli::cli_alert_info("Run in Terminal: {.code xcode-select --install}")
      cli::cli_alert_info(
        "After installing, restart RStudio and run {.code mccourse_setup()} again."
      )
    }
  } else {
    cli::cli_alert_info("Compiler toolchain check skipped on this platform")
  }

  # Quarto
  cli::cli_h2("Quarto CLI")
  if (.has_exec("quarto")) {
    ver_raw <- tryCatch(
      system2("quarto", "--version", stdout = TRUE, stderr = FALSE),
      error = function(e) character(0)
    )
    ver_raw <- ver_raw[nzchar(ver_raw)]
    ver_str <- if (length(ver_raw) > 0L) trimws(ver_raw[[1L]]) else "0.0.0"
    quarto_ver <- tryCatch(
      as.package_version(ver_str),
      error = function(e) as.package_version("0.0.0")
    )
    if (quarto_ver >= as.package_version("1.4.0")) {
      cli::cli_alert_success("Quarto {quarto_ver} already available")
    } else {
      cli::cli_alert_warning("Quarto {quarto_ver} is outdated (need >= 1.4.0)")
      cli::cli_alert_info("Update at {.url https://quarto.org/docs/get-started/}")
    }
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

  # Course R packages
  cli::cli_h2("Course R Packages")
  core_pkgs <- c(
    "cli", "rlang", "rmarkdown", "quarto",
    "tidyverse", "knitr", "rcompanion", "effsize", "car", "sjstats"
  )
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
  cli::cli_alert_success(
    "Setup complete. Run {.code mccourse_check()} to verify your environment."
  )

  invisible(TRUE)
}
