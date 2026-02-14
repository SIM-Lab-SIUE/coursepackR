#' Open a Downloaded Week Folder
#'
#' Opens the specified week's folder in the system file browser (Finder, File
#' Explorer, etc.).
#'
#' @param week Integer or character week number.
#' @param dest Character parent directory where week folders were downloaded
#'   (default: current directory).
#' @return Invisibly, the path that was opened.
#' @export
#' @examples
#' \dontrun{
#' open_week(1)
#' }
open_week <- function(week, dest = ".") {
  week_padded <- sprintf("week_%02d", as.integer(week))
  target <- file.path(normalizePath(dest, mustWork = TRUE), week_padded)

  if (!dir.exists(target)) {
    cli::cli_alert_warning(
      "Folder {.path {week_padded}} not found. Opening parent directory instead."
    )
    target <- normalizePath(dest, mustWork = TRUE)
  }

  utils::browseURL(target)
  invisible(target)
}
