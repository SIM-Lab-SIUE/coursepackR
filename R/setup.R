#' One-time setup for MC course tools
#'
#' Installs Quarto (for rendering), TinyTeX (for PDF), and core CRAN packages
#' if they are missing. Safe to re-run; it only installs what's missing.
#'
#' @param ask Prompt before large installs (default TRUE).
#' @param pkgs Character vector of CRAN packages to ensure are installed.
#' @return Invisibly TRUE.
#' @examples
#' \dontrun{
#' mccourse_setup()
#' }
#' @export
mccourse_setup <- function(
  ask  = TRUE,
  pkgs = c("tidyverse","janitor","here","readr","dplyr","ggplot2",
           "stringr","lubridate","knitr","rmarkdown")
) {
  # 1) core CRAN pkgs
  miss <- pkgs[!pkgs %in% rownames(installed.packages())]
  if (length(miss)) utils::install.packages(miss)

  # 2) Quarto CLI
  if (!.mcp_have_quarto()) {
    if (!ask || !interactive() || .mcp_yesno("Quarto not found. Install now? [Y/n]: ")) {
      .mcp_install_quarto()
    } else return(invisible(FALSE))
  }

  # 3) TinyTeX for PDF
  if (!.mcp_have_tinytex()) {
    if (!ask || !interactive() || .mcp_yesno("TinyTeX not found (~200–300MB). Install now? [Y/n]: ")) {
      .mcp_install_tinytex()
    } else return(invisible(FALSE))
  }

  invisible(TRUE)
}

# --- internals ---

.mcp_yesno <- function(prompt) {
  ans <- readline(prompt)
  !(nzchar(ans) && tolower(substr(ans, 1, 1)) == "n")
}

.mcp_have_quarto <- function() {
  if (!requireNamespace("quarto", quietly = TRUE)) return(FALSE)
  qp <- get("quarto_path", asNamespace("quarto"))
  p  <- tryCatch(qp(), error = function(e) "")
  is.character(p) && nzchar(p)
}

.mcp_install_quarto <- function() {
  if (!requireNamespace("quarto", quietly = TRUE)) utils::install.packages("quarto")
  qi <- get("quarto_install", asNamespace("quarto"))
  tryCatch(qi(), error = function(e) stop("Failed to install Quarto: ", e$message, call. = FALSE))
}

.mcp_have_tinytex <- function() {
  if (!requireNamespace("tinytex", quietly = TRUE)) return(FALSE)
  is_tt <- get("is_tinytex", asNamespace("tinytex"))
  isTRUE(is_tt())
}

.mcp_install_tinytex <- function() {
  if (!requireNamespace("tinytex", quietly = TRUE)) utils::install.packages("tinytex")
  it <- get("install_tinytex", asNamespace("tinytex"))
  tryCatch(it(), error = function(e) stop("Failed to install TinyTeX: ", e$message, call. = FALSE))
}
