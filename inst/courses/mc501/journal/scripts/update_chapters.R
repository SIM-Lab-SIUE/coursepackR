# Rewrites the "chapters" section of _quarto.yml to include entries/ in date order.
update_chapters <- function(qyml = "_quarto.yml") {
  if (!file.exists(qyml)) stop("Cannot find _quarto.yml", call. = FALSE)
  y <- readLines(qyml, warn = FALSE)

  beg <- grep("^\\s*# BEGIN AUTO\\s*$", y)
  end <- grep("^\\s*# END AUTO\\s*$", y)
  if (length(beg) != 1 || length(end) != 1 || end <= beg) {
    stop("Auto-managed markers not found or out of order in _quarto.yml", call. = FALSE)
  }

  files <- list.files("entries", pattern = "\\.qmd$", full.names = TRUE)
  if (length(files)) {
    rel <- file.path("entries", basename(sort(files)))
    lines <- paste0("    - ", rel)
  } else {
    rel <- character()
    lines <- "    # (no entries yet)"
  }

  y_new <- c(y[1:beg], lines, y[end:length(y)])
  writeLines(y_new, qyml)
  invisible(rel)
}

if (sys.nframe() == 0L) update_chapters()
