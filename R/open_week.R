# ==============================================================================
# Open Week Folder in File Browser
# ==============================================================================
# Convenience function to open a downloaded week's folder in the system file
# browser (Explorer on Windows, Finder on Mac, file manager on Linux).
# ==============================================================================

# ------------------------------------------------------------------------------
# Open Week Folder
# ------------------------------------------------------------------------------
#' Open a downloaded week's folder in system file browser
#'
#' After downloading week materials with \code{download_week()}, this function
#' provides a quick way to open that folder in your system's default file
#' browser. Useful for viewing files, starting work, or verifying the download.
#'
#' @section How It Works:
#' The function looks for a folder named \code{week_XX} in the destination
#' directory. If found, it opens that folder. If not found (e.g., if you
#' haven't downloaded yet), it opens the parent directory instead.
#'
#' @param week Integer or character. Week number (e.g., 1, "01").
#'   Will be formatted to "week_01", "week_02", etc.
#' @param dest Character. Parent directory where the week folder resides.
#'   Should match the dest parameter used in download_week(). Defaults to
#'   current working directory (".").
#'   
#' @return Invisibly returns the path that was opened.
#' 
#' @section Typical Workflow:
#' \preformatted{
#' # Download materials
#' download_week("mc451", 1)
#' 
#' # Open the folder to start working
#' open_week(1)
#' }
#'
#' @export
#' @examples
#' \donttest{
#' # After downloading week 1
#' download_week("mc451", 1, ".")
#' open_week(1, ".")
#' 
#' # Open week 3 in custom location
#' open_week(3, dest = "~/coursework")
#' }
open_week <- function(week, dest = ".") {
  # Format week number with zero-padding
  week <- sprintf("%02d", as.integer(week))
  
  # Build expected path to week folder
  candidates <- file.path(dest, paste0("week_", week))
  
  # Fallback to parent directory if week folder doesn't exist yet
  if (!dir.exists(candidates)) candidates <- dest
  
  # Open in system file browser
  utils::browseURL(normalizePath(candidates))
  
  invisible(candidates)
}