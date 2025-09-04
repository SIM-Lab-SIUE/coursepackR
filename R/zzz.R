# R/zzz.R

# --- internal safe-eval helper -----------------------------------------------
.mcp_safe <- function(expr, default = FALSE) {
	tryCatch(expr, error = function(...) default, warning = function(...) default)
}

# --- internal: do we have Quarto CLI? ----------------------------------------
.mcp_have_quarto <- function() {
	# On PATH?
	if (nzchar(Sys.which("quarto"))) return(TRUE)

	# Via the {quarto} R pkg?
	if (!requireNamespace("quarto", quietly = TRUE)) return(FALSE)
	p <- .mcp_safe(quarto::quarto_path(), "")
	nzchar(p)
}

# --- internal: do we have TinyTeX? -------------------------------------------
.mcp_have_tinytex <- function() {
	if (!requireNamespace("tinytex", quietly = TRUE)) return(FALSE)
	isTRUE(.mcp_safe(tinytex::is_tinytex(), FALSE))
}

# --- package attach hook ------------------------------------------------------
.onAttach <- function(libname, pkgname) {
	packageStartupMessage(
		"mccoursepack: run `mccourse_setup()` once to install Quarto, TinyTeX, and core packages."
	)

	if (!.mcp_have_quarto()) {
		packageStartupMessage(
			"-> Quarto CLI not detected. Run `mccourse_setup()` or do:\n",
			"   install.packages('quarto'); quarto::quarto_install()"
		)
	}

	invisible(TRUE)
}
