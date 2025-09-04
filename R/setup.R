#' One-time setup for mccoursepack
#'
#' Installs Quarto CLI (via the \pkg{quarto} R package) and TinyTeX if missing,
#' then ensures a small set of core CRAN packages are available.
#' On Windows, warns if Rtools is not installed.
#'
#' Safe to re-run; it only installs what's missing.
#' @importFrom quarto quarto_install
#' @importFrom utils install.packages
#' @export
mccourse_setup <- function() {
	cli_h1 <- function(x) try(cli::cli_h1(x), silent = TRUE)
	cli_alert <- function(x) try(cli::cli_alert_info(x), silent = TRUE)
	cli_done <- function(x) try(cli::cli_alert_success(x), silent = TRUE)
	cli_warn <- function(x) try(cli::cli_alert_warning(x), silent = TRUE)

	# 0) Soft dependencies for nice messages
	required_for_msgs <- c("cli")
	for (p in required_for_msgs) if (!requireNamespace(p, quietly = TRUE)) {
		install.packages(p, quiet = TRUE)
	}

	cli_h1("mccoursepack: setup")

	# 1) Windows check for Rtools (build tools)
	if (.Platform$OS.type == "windows") {
		if (!requireNamespace("pkgbuild", quietly = TRUE)) {
			install.packages("pkgbuild", quiet = TRUE)
		}
		ok <- try(pkgbuild::check_build_tools(debug = FALSE), silent = TRUE)
		if (inherits(ok, "try-error") || isFALSE(ok)) {
			cli_warn(
				paste(
					"Rtools not detected. Install the version matching your R",
					"(e.g., R 4.5 -> Rtools 4.5):",
					"https://cran.rstudio.com/bin/windows/Rtools/"
				)
			)
		}
	}

	# 2) Quarto CLI
	if (!requireNamespace("quarto", quietly = TRUE)) {
		install.packages("quarto", quiet = TRUE)
	}
	has_quarto_cli <- nzchar(Sys.which("quarto"))
	if (!has_quarto_cli) {
		cli_alert("Quarto CLI not found; installing via {quarto}...")
		# NOTE: correct, lowercase namespace & function
		quarto_install()
		# Refresh PATH for current session if needed
		has_quarto_cli <- nzchar(Sys.which("quarto"))
	}
	if (has_quarto_cli) {
		cli_done(sprintf("Quarto available: %s", system2("quarto", "--version", stdout = TRUE)))
	} else {
		cli_warn("Quarto still not on PATH in this session. Restart RStudio after setup.")
	}

	# 3) TinyTeX (LaTeX for PDF)
	if (!requireNamespace("tinytex", quietly = TRUE)) {
		install.packages("tinytex", quiet = TRUE)
	}
	has_tinytex <- tryCatch({
		tinytex::is_tinytex()
	}, error = function(e) FALSE)

	if (!has_tinytex) {
		cli_alert("TinyTeX not found; installing minimal LaTeX distribution…")
		tinytex::install_tinytex(force = FALSE)
		has_tinytex <- tryCatch(tinytex::is_tinytex(), error = function(e) FALSE)
		if (has_tinytex) {
			cli_done("TinyTeX installed.")
		} else {
			cli_warn("TinyTeX did not report as installed yet. Restart RStudio, then try again.")
		}
	} else {
		cli_done("TinyTeX is already installed.")
	}

	# 4) Core CRAN packages you rely on
	core_pkgs <- c("fs", "rlang", "cli", "rstudioapi")
	to_get <- core_pkgs[!vapply(core_pkgs, requireNamespace, FUN.VALUE = logical(1), quietly = TRUE)]
	if (length(to_get)) {
		cli_alert(sprintf("Installing core packages: %s", paste(to_get, collapse = ", ")))
		install.packages(to_get, quiet = TRUE)
	}

	cli_done("Setup finished. If Quarto/TinyTeX were just installed, restart RStudio.")
	invisible(TRUE)
}
