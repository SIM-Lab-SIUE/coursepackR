#' Check Course Environment
#'
#' Runs a series of diagnostic checks to verify the student's environment
#' is properly configured. Checks R version, RStudio, Quarto CLI version,
#' Git, compiler toolchain (Rtools on Windows / Xcode CLT on macOS), course
#' R packages, installed course templates, and working directory path safety.
#'
#' @param course Character course identifier to check templates for
#'   (default: `"mc451"`).
#' @param min_r Character minimum R version required (default: `"4.1.0"`).
#' @return A named list with logical results for each check:
#'   `r`, `rstudio`, `quarto`, `git`, `templates`, `compiler`, `packages`, `path`.
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
    cli::cli_alert_info("Download the latest R from {.url https://cran.r-project.org/}")
  }


  # RStudio

  rstudio_ok <- tryCatch(
    rlang::is_installed("rstudioapi") && rstudioapi::isAvailable(),
    error = function(e) FALSE
  )
  if (rstudio_ok) {
    cli::cli_alert_success("RStudio detected")
  } else {
    cli::cli_alert_info("RStudio not detected (recommended but not required)")
  }

  # Quarto CLI — presence and minimum version (1.4.0)
  quarto_ok <- FALSE
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
    min_quarto <- as.package_version("1.4.0")
    quarto_ok <- quarto_ver >= min_quarto
    if (quarto_ok) {
      cli::cli_alert_success("Quarto {quarto_ver} (>= 1.4.0)")
    } else {
      cli::cli_alert_danger("Quarto {quarto_ver} is below minimum 1.4.0")
      cli::cli_alert_info("Update at {.url https://quarto.org/docs/get-started/}")
    }
  } else {
    cli::cli_alert_danger(
      "Quarto CLI not found. Run {.code mccourse_setup()} or visit {.url https://quarto.org/docs/get-started/}"
    )
  }

  # Git
  git_ok <- .has_exec("git")
  if (git_ok) {
    cli::cli_alert_success("Git found")
  } else {
    cli::cli_alert_danger("Git not found. Visit {.url https://git-scm.com/downloads}")
  }

  # Compiler toolchain (Rtools on Windows, Xcode CLT on macOS)
  compiler_ok <- if (.Platform$OS.type == "windows") {
    rlang::is_installed("pkgbuild") && pkgbuild::has_build_tools(debug = FALSE)
  } else {
    .has_exec("xcode-select", args = "-p")
  }
  if (compiler_ok) {
    cli::cli_alert_success("Compiler toolchain found")
  } else if (.Platform$OS.type == "windows") {
    cli::cli_alert_warning(
      "Rtools not found \u2014 some packages may fail to install from source"
    )
    cli::cli_alert_info(
      "Install from {.url https://cran.r-project.org/bin/windows/Rtools/}"
    )
  } else {
    cli::cli_alert_warning("Xcode Command Line Tools not found")
    cli::cli_alert_info("Run in Terminal: {.code xcode-select --install}")
  }

  # Course R packages
  course_pkgs <- c(
    "cli", "rlang", "rmarkdown", "quarto",
    "tidyverse", "knitr", "rcompanion", "effsize", "car", "sjstats"
  )
  missing_pkgs <- course_pkgs[!vapply(course_pkgs, rlang::is_installed, logical(1L))]
  packages_ok <- length(missing_pkgs) == 0L
  if (packages_ok) {
    cli::cli_alert_success("All {length(course_pkgs)} course packages installed")
  } else {
    cli::cli_alert_danger(
      "{length(missing_pkgs)} package{?s} missing: {.pkg {missing_pkgs}}"
    )
    cli::cli_alert_info("Run {.code mccourse_setup()} to install them")
  }

  # Course templates
  courses <- list_courses()
  templates_ok <- course %in% courses
  if (templates_ok) {
    weeks <- list_weeks(course)
    cli::cli_alert_success("Course {.val {course}}: {length(weeks)} week{?s} available")
  } else if (length(courses) > 0L) {
    cli::cli_alert_warning("Course {.val {course}} not found. Available: {.val {courses}}")
    cli::cli_alert_info("Reinstall the package: {.code remotes::install_github(\"SIM-Lab-SIUE/coursepackR\")}")
  } else {
    cli::cli_alert_warning("No course templates installed")
    cli::cli_alert_info("Reinstall the package: {.code remotes::install_github(\"SIM-Lab-SIUE/coursepackR\")}")
  }

  # Working directory path safety
  wd <- normalizePath(getwd(), winslash = "/", mustWork = FALSE)
  on_cloud <- grepl("OneDrive|Dropbox|Google.Drive|iCloud", wd, ignore.case = TRUE)
  has_spaces <- grepl(" ", wd)
  path_ok <- !on_cloud && !has_spaces
  if (path_ok) {
    cli::cli_alert_success("Working directory path looks safe")
  } else {
    if (on_cloud) {
      cli::cli_alert_warning(
        "Working directory is inside a cloud-sync folder: {.path {wd}}"
      )
      cli::cli_alert_info(
        "File locking can cause save failures. Move your project to {.path Documents/} or Desktop."
      )
    }
    if (has_spaces) {
      cli::cli_alert_warning(
        "Working directory path contains spaces \u2014 this can break Quarto rendering"
      )
      cli::cli_alert_info(
        "Move the project to a path without spaces, e.g. {.path C:/courses/mc451/}"
      )
    }
  }

  result <- list(
    r         = r_ok,
    rstudio   = rstudio_ok,
    quarto    = quarto_ok,
    git       = git_ok,
    templates = templates_ok,
    compiler  = compiler_ok,
    packages  = packages_ok,
    path      = path_ok
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
