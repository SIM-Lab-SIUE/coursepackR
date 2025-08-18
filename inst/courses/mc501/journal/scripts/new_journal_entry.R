new_journal_entry <- function(date = Sys.Date(),
                              template = "entry_template.qmd",
                              prompts_file = NULL,
                              pick = FALSE) {
  # Determine course and word range from prompts file or folder name
  if (is.null(prompts_file)) {
    if (file.exists("prompts_mc451.csv")) prompts_file <- "prompts_mc451.csv"
    if (file.exists("prompts_mc501.csv")) prompts_file <- "prompts_mc501.csv"
  }
  if (is.null(prompts_file) || !file.exists(prompts_file)) {
    stop("Could not locate prompts file (prompts_mc451.csv or prompts_mc501.csv).", call. = FALSE)
  }

  course <- if (grepl("mc501", basename(prompts_file), ignore.case = TRUE)) "mc501" else "mc451"
  word_min <- if (course == "mc501") 450L else 250L
  word_max <- if (course == "mc501") 500L else 300L

  if (!file.exists(template)) stop("Cannot find entry_template.qmd in this folder.", call. = FALSE)
  if (!dir.exists("entries")) dir.create("entries", recursive = TRUE)

  # Load prompts, pick three (optionally let user choose)
  pdat <- tryCatch(read.csv(prompts_file, stringsAsFactors = FALSE), error = function(e) NULL)
  if (is.null(pdat) || nrow(pdat) < 3) {
    stop("Prompts file must contain at least 3 prompts.", call. = FALSE)
  }

  picks <- if (pick) {
    cat("\nAvailable prompts:\n")
    for (i in seq_len(nrow(pdat))) cat(sprintf("[%d] (%s) %s\n", i, pdat$category[i], pdat$prompt[i]))
    sel <- readline("Enter THREE prompt numbers separated by commas (e.g., 1,5,8): ")
    idx <- suppressWarnings(as.integer(strsplit(sel, ",")[[1]]))
    idx <- idx[!is.na(idx)]
    if (length(idx) != 3 || any(idx < 1 | idx > nrow(pdat))) {
      stop("You must select exactly three valid prompt numbers.", call. = FALSE)
    }
    idx
  } else {
    sample.int(nrow(pdat), 3L)
  }

  p1 <- pdat$prompt[picks[1]]
  p2 <- pdat$prompt[picks[2]]
  p3 <- pdat$prompt[picks[3]]

  # Build output file name
  day <- as.character(as.Date(date))
  out <- file.path("entries", paste0(day, ".qmd"))

  # Read template and inject params (course, word bounds, prompts, title)
  txt <- readLines(template, warn = FALSE)
  txt <- sub('^title: "YYYY-MM-DD"', paste0('title: "', day, '"'), txt)
  # course + word range
  txt <- gsub('params:\\s*\\n\\s*course: "mc451"\\s*\\n\\s*word_min: 250\\s*\\n\\s*word_max: 300',
              paste0('params:\n  course: "', course, '"\n  word_min: ', word_min, '\n  word_max: ', word_max),
              txt, perl = TRUE)
  # prompts
  txt <- gsub('p1: ""', paste0('p1: "', gsub('"', '\\"', p1, fixed = TRUE), '"'), txt, fixed = TRUE)
  txt <- gsub('p2: ""', paste0('p2: "', gsub('"', '\\"', p2, fixed = TRUE), '"'), txt, fixed = TRUE)
  txt <- gsub('p3: ""', paste0('p3: "', gsub('"', '\\"', p3, fixed = TRUE), '"'), txt, fixed = TRUE)

  writeLines(txt, out)
  message("Created: ", out)

  # Update the book chapters to include the new entry
  source(file.path("scripts", "update_chapters.R"))
  update_chapters("_quarto.yml")

  invisible(out)
}

# If sourced directly (e.g., source("scripts/new_journal_entry.R")):
if (sys.nframe() == 0L) {
  pf <- if (file.exists("prompts_mc451.csv")) "prompts_mc451.csv" else
        if (file.exists("prompts_mc501.csv")) "prompts_mc501.csv" else NULL
  new_journal_entry(prompts_file = pf, pick = interactive())
}
