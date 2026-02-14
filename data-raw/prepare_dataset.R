# Prepare the unified music dataset for inclusion in the package
# Run this script from the package root directory:
#   source("data-raw/prepare_dataset.R")

unified_music <- read.csv(
  file.path(
    "..", "coursepackR", "claude_book", "data", "final_unified_dataset.csv"
  ),
  stringsAsFactors = FALSE
)

cat("Rows:", nrow(unified_music), "\n")
cat("Cols:", ncol(unified_music), "\n")
cat("Column names:", paste(names(unified_music), collapse = ", "), "\n")

usethis::use_data(unified_music, overwrite = TRUE, compress = "xz")
