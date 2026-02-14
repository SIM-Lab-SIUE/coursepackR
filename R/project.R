#' Create Final Project Folder
#'
#' Scaffolds a final project directory with a Quarto document, bibliography,
#' data folder, and RStudio project file.
#'
#' @param course Character course identifier (e.g., `"mc451"`, `"mc501"`).
#' @param dest Character parent directory (default: current directory).
#' @return Invisibly, the path to the created project folder.
#' @export
#' @examples
#' \dontrun{
#' final_project("mc451")
#' }
final_project <- function(course, dest = ".") {
  rlang::check_required(course)
  course <- tolower(as.character(course))

  project_dir <- file.path(normalizePath(dest, mustWork = TRUE), paste0(course, "_final"))
  if (dir.exists(project_dir)) {
    cli::cli_abort("Directory {.path {project_dir}} already exists. Remove it first or choose a different location.")
  }

  # Create directory structure
  dir.create(project_dir, recursive = TRUE)
  dir.create(file.path(project_dir, "data"))
  dir.create(file.path(project_dir, "output"))

  # Research paper template
  writeLines(c(
    "---",
    paste0("title: \"", toupper(course), " Final Research Paper\""),
    "author: \"Your Name\"",
    "date: today",
    "format:",
    "  pdf:",
    "    toc: true",
    "    number-sections: true",
    "bibliography: references.bib",
    "---",
    "",
    "## Introduction",
    "",
    "Replace this with your research question and motivation.",
    "",
    "## Literature Review",
    "",
    "Summarize key sources here.",
    "",
    "## Method",
    "",
    "Describe your approach, sample, and measures.",
    "",
    "## Results",
    "",
    "```{r}",
    "#| label: analysis",
    "#| echo: true",
    "",
    "# Your analysis code here",
    "```",
    "",
    "## Discussion",
    "",
    "Interpret your findings.",
    "",
    "## References",
    ""
  ), file.path(project_dir, "research_paper.qmd"))

  # Bibliography
  writeLines(c(
    "@article{example2026,",
    "  author = {Author, Example},",
    "  title = {A Placeholder Reference},",
    "  journal = {Journal of Examples},",
    "  year = {2026},",
    "  volume = {1},",
    "  pages = {1--10}",
    "}"
  ), file.path(project_dir, "references.bib"))

  # README
  writeLines(c(
    paste0("# ", toupper(course), " Final Project"),
    "",
    "## Structure",
    "",
    "- `research_paper.qmd` - Your main paper (edit this)",
    "- `references.bib` - Bibliography entries",
    "- `data/` - Place your datasets here",
    "- `output/` - Rendered output goes here"
  ), file.path(project_dir, "README.md"))

  # RStudio project file
  writeLines(c(
    "Version: 1.0",
    "",
    "RestoreWorkspace: No",
    "SaveWorkspace: No",
    "AlwaysSaveHistory: Default",
    "",
    "EnableCodeIndexing: Yes",
    "UseSpacesForTab: Yes",
    "NumSpacesForTab: 2",
    "Encoding: UTF-8"
  ), file.path(project_dir, paste0(course, "_final.Rproj")))

  cli::cli_alert_success("Created final project at {.path {project_dir}}")
  cli::cli_alert_info("Open {.file {paste0(course, '_final.Rproj')}} in RStudio to get started.")

  invisible(project_dir)
}
