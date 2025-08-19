new_journal_entry <- function(week,
                              date = Sys.Date(),
                              template = "entry_template.qmd",
                              prompts_file = NULL) {
  # Locate prompts file if not supplied
  if (is.null(prompts_file)) {
    if (file.exists("prompts_mc451.csv")) prompts_file <- "prompts_mc451.csv"
    if (file.exists("prompts_mc501.csv")) prompts_file <- "prompts_mc501.csv"
  }
  if (is.null(prompts_file) || !file.exists(prompts_file)) {
    stop("Could not locate prompts file (prompts_mc451.csv or prompts_mc501.csv).", call. = FALSE)
  }

  # Determine course + word ranges from file name
  course <- if (grepl("mc501", basename(prompts_file), ignore.case = TRUE)) "mc501" else "mc451"
  word_min <- if (course == "mc501") 450L else 250L
  word_max <- if (course == "mc501") 500L else 300L

  # Check template + entries folder
  if (!file.exists(template)) stop("Cannot find entry_template.qmd in this folder.", call. = FALSE)
  if (!dir.exists("entries")) dir.create("entries", recursive = TRUE)

  # Load prompts
  pdat <- tryCatch(read.csv(prompts_file, stringsAsFactors = FALSE), error = function(e) NULL)
  if (is.null(pdat) || !"week" %in% names(pdat) || !"prompt" %in% names(pdat)) {
    stop("Prompts file must have at least columns: week, prompt_id, prompt", call. = FALSE)
  }

  # Filter for this week
  week_prompts <- subset(pdat, week == !!week)
  if (nrow(week_prompts) != 3) {
    stop(paste("Week", week, "does not have exactly 3 prompts in", prompts_file), call. = FALSE)
  }

  # Assign prompts
  p1 <- week_prompts$prompt[1]
  p2 <- week_prompts$prompt[2]
  p3 <- week_prompts$prompt[3]

  # Build output file
  day <- as.character(as.Date(date))
  out <- file.path("entries", paste0(day, ".qmd"))

  # Read + inject template
  txt <- readLines(template, warn = FALSE)
  txt <- sub('^title: "YYYY-MM-DD"', paste0('title: "', day, '"'), txt)
  txt <- gsub('params:\\s*\\n\\s*course: "mc451"\\s*\\n\\s*word_min: 250\\s*\\n\\s*word_max: 300',
              paste0('params:\n  course: "', course, '"\n  word_min: ', word_min, '\n  word_max: ', word_max),
              txt, perl = TRUE)
  txt <- gsub('p1: ""', paste0('p1: "', gsub('"', '\\"', p1, fixed = TRUE), '"'), txt, fixed = TRUE)
  txt <- gsub('p2: ""', paste0('p2: "', gsub('"', '\\"', p2, fixed = TRUE), '"'), txt, fixed = TRUE)
  txt <- gsub('p3: ""', paste0('p3: "', gsub('"', '\\"', p3, fixed = TRUE), '"'), txt, fixed = TRUE)

  writeLines(txt, out)
  message("Created: ", out)

  # Update book
  source(file.path("scripts", "update_chapters.R"))
  update_chapters("_quarto.yml")

  invisible(out)
}

# Direct sourcing: prompt for week
if (sys.nframe() == 0L) {
  pf <- if (file.exists("prompts_mc451.csv")) "prompts_mc451.csv" else
        if (file.exists("prompts_mc501.csv")) "prompts_mc501.csv" else NULL
  wk <- as.integer(readline("Enter the week number (2–14): "))
  new_journal_entry(week = wk, prompts_file = pf)
}
