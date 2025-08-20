new_journal_entry <- function(week,
															date = Sys.Date(),
															template = "entry_template.qmd",
															prompts_file = NULL) {
	# 1) Locate prompts file if not supplied
	if (is.null(prompts_file)) {
		if (file.exists("prompts_mc451.csv")) prompts_file <- "prompts_mc451.csv"
		if (file.exists("prompts_mc501.csv")) prompts_file <- "prompts_mc501.csv"
	}
	if (is.null(prompts_file) || !file.exists(prompts_file)) {
		stop("Could not locate prompts file (prompts_mc451.csv or prompts_mc501.csv).", call. = FALSE)
	}

	# 2) Determine course + word ranges from file name
	course <- if (grepl("mc501", basename(prompts_file), ignore.case = TRUE)) "mc501" else "mc451"
	word_min <- if (course == "mc501") 450L else 250L
	word_max <- if (course == "mc501") 500L else 300L

	# 3) Check template + entries folder
	if (!file.exists(template)) {
		stop("Cannot find entry_template.qmd in this folder.", call. = FALSE)
	}
	if (!dir.exists("entries")) {
		dir.create("entries", recursive = TRUE)
	}

	# 4) Load prompts (robust read)
	pdat <- tryCatch(utils::read.csv(prompts_file, stringsAsFactors = FALSE),
									 error = function(e) NULL)
	if (is.null(pdat)) {
		stop(sprintf("Failed to read %s", prompts_file), call. = FALSE)
	}

	# Must have a 'week' column and a 'prompt' column.
	# Allow extra columns (e.g., prompt_id).
	if (!("week" %in% names(pdat)) || !("prompt" %in% names(pdat))) {
		stop("Prompts file must have at least columns: week, prompt", call. = FALSE)
	}

	# 5) Filter for this week (base R; avoid tidy-eval operators)
	week <- as.integer(week)
	week_prompts <- pdat[pdat$week == week, , drop = FALSE]

	if (nrow(week_prompts) != 3) {
		stop(sprintf("Week %d must have exactly 3 prompts in %s (found %d).",
								 week, prompts_file, nrow(week_prompts)), call. = FALSE)
	}

	# 6) Assign prompts
	p1 <- as.character(week_prompts$prompt[1])
	p2 <- as.character(week_prompts$prompt[2])
	p3 <- as.character(week_prompts$prompt[3])

	# Escaper for inline YAML injection
	escape_quotes <- function(x) gsub('"', '\\"', x, fixed = TRUE)

	# 7) Build output path
	day <- as.character(as.Date(date))
	out <- file.path("entries", paste0(day, ".qmd"))

	# 8) Read + inject template
	txt <- readLines(template, warn = FALSE)

	# Replace title line
	txt <- sub('^title:\\s*"YYYY-MM-DD"', paste0('title: "', day, '"'), txt)

	# Replace params block (course + word ranges)
	# We rewrite the entire params block regardless of what’s in the template
	params_pattern <- 'params:\\s*\\n\\s*course:\\s*".*?"\\s*\\n\\s*word_min:\\s*\\d+\\s*\\n\\s*word_max:\\s*\\d+'
	params_replacement <- paste0(
		'params:\n',
		'  course: "', course, '"\n',
		'  word_min: ', word_min, '\n',
		'  word_max: ', word_max
	)
	txt <- gsub(params_pattern, params_replacement, txt, perl = TRUE)

	# Inject the three prompts
	txt <- gsub('p1:\\s*""', paste0('p1: "', escape_quotes(p1), '"'), txt, perl = TRUE)
	txt <- gsub('p2:\\s*""', paste0('p2: "', escape_quotes(p2), '"'), txt, perl = TRUE)
	txt <- gsub('p3:\\s*""', paste0('p3: "', escape_quotes(p3), '"'), txt, perl = TRUE)

	# 9) Write the new chapter file
	writeLines(txt, out)
	message("Created: ", out)

	# 10) Update the book structure
	updater <- file.path("scripts", "update_chapters.R")
	if (file.exists(updater)) {
		source(updater)
		if (exists("update_chapters", mode = "function")) {
			update_chapters("_quarto.yml")
		} else {
			warning("update_chapters() not found after sourcing update_chapters.R; skipping TOC update.", call. = FALSE)
		}
	} else {
		warning("scripts/update_chapters.R not found; skipping TOC update.", call. = FALSE)
	}

	invisible(out)
}

# ---- Run directly: prompt for week (only when the file is sourced) ----
if (sys.nframe() == 0L) {
	pf <- if (file.exists("prompts_mc451.csv")) {
		"prompts_mc451.csv"
	} else if (file.exists("prompts_mc501.csv")) {
		"prompts_mc501.csv"
	} else {
		NULL
	}

	if (is.null(pf)) {
		stop("Could not find prompts_mc451.csv or prompts_mc501.csv in the current folder.", call. = FALSE)
	}

	# Basic console prompt
	cat("Enter the week number (2–14): ")
	wk <- suppressWarnings(as.integer(readLines(con = stdin(), n = 1L)))
	if (is.na(wk)) stop("Invalid week number.", call. = FALSE)

	new_journal_entry(week = wk, prompts_file = pf)
}
