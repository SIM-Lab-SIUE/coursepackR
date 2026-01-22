# ==============================================================================
# Package Hooks and Helpers
# ==============================================================================
# This file contains functions that run during package loading and internal
# helper functions used across multiple package files. The .onAttach() hook
# runs when the package is loaded via library(mccoursepack).
# ==============================================================================

# ------------------------------------------------------------------------------
# Safe Evaluation Helper
# ------------------------------------------------------------------------------
# Wraps expressions in a try-catch to prevent errors from crashing the package.
# Useful for checking optional dependencies or external tools that may not be
# available on all systems.
#
# @param expr Expression to evaluate
# @param default Value to return if expr fails (default: FALSE)
# @return Result of expr, or default if error/warning occurs
# @keywords internal
.mcp_safe <- function(expr, default = FALSE) {
	tryCatch(expr, error = function(...) default, warning = function(...) default)
}

# ------------------------------------------------------------------------------
# Check Quarto CLI Availability
# ------------------------------------------------------------------------------
# Checks if Quarto CLI is available either on the system PATH or via the
# {quarto} R package. Quarto is required for rendering .qmd files.
#
# @return Logical. TRUE if Quarto is available, FALSE otherwise
# @keywords internal
.mcp_have_quarto <- function() {
	# First, check if 'quarto' command is on PATH
	if (nzchar(Sys.which("quarto"))) return(TRUE)

	# Fallback: check via the {quarto} R package
	if (!requireNamespace("quarto", quietly = TRUE)) return(FALSE)
	p <- .mcp_safe(quarto::quarto_path(), "")
	nzchar(p)
}

# ------------------------------------------------------------------------------
# Check TinyTeX Availability
# ------------------------------------------------------------------------------
# Checks if TinyTeX (lightweight LaTeX distribution) is installed via the
# {tinytex} R package. TinyTeX is required for rendering PDFs from .qmd files.
#
# @return Logical. TRUE if TinyTeX is installed, FALSE otherwise
# @keywords internal
.mcp_have_tinytex <- function() {
	if (!requireNamespace("tinytex", quietly = TRUE)) return(FALSE)
	isTRUE(.mcp_safe(tinytex::is_tinytex(), FALSE))
}

# ------------------------------------------------------------------------------
# Package Attach Hook
# ------------------------------------------------------------------------------
# This function runs automatically when the package is loaded with library().
# It displays helpful startup messages and checks for required external tools,
# alerting users if critical components are missing.
#
# @param libname Character. Library name (not used)
# @param pkgname Character. Package name (not used)
# @keywords internal
.onAttach <- function(libname, pkgname) {
	# Display general setup reminder
	packageStartupMessage(
		"mccoursepack: run `mccourse_setup()` once to install Quarto, TinyTeX, and core packages."
	)

	# Check for Quarto and remind user to install if missing
	if (!.mcp_have_quarto()) {
		packageStartupMessage(
			"-> Quarto CLI not detected. Run `mccourse_setup()` to install Quarto."
		)
	}

	invisible(TRUE)
}
