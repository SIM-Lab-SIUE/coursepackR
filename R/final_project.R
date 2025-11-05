#' Create a final project folder structure for a given class
#' @importFrom utils write.csv
#' @importFrom grDevices pdf dev.off
#'
#' @param class_no Character. The class number, e.g., "mc451" or "mc501".
#' @return Invisibly returns the path to the created project folder.
#' @export
final_project <- function(class_no) {

  # Define structure for each class
  structures <- list(
    mc501 = list(
      files = c(
        "research_paper.qmd",
        "references.bib",
        "README.md",
        ".Rproj"
      ),
      folders = c("data", "output"),
      data_file = "data/survey_data.csv",
      pdf_file = "output/research_paper.pdf"
    ),
    mc451 = list(
      files = c(
        "research_paper.qmd",
        "references.bib",
        "README.md",
        ".Rproj"
      ),
      folders = c("data", "output"),
      data_file = "data/survey_data.csv",
      pdf_file = "output/research_paper.pdf"
    )
  )

  if (!class_no %in% names(structures)) {
    stop("Unknown class_no. Supported: ", paste(names(structures), collapse = ", "))
  }

  project_name <- class_no
  dir.create(project_name, showWarnings = FALSE)
  for (folder in structures[[class_no]]$folders) {
    dir.create(file.path(project_name, folder), showWarnings = FALSE)
  }

  # Create main files with placeholder content
  file.create(file.path(project_name, structures[[class_no]]$files))
  writeLines("---\ntitle: 'Research Paper'\n---\n\n# Introduction\n\nWrite your introduction here.", file.path(project_name, "research_paper.qmd"))
  writeLines("@article{dummy2025,\n  title={Dummy Reference},\n  author={Doe, Jane},\n  journal={Journal of Examples},\n  year={2025}\n}", file.path(project_name, "references.bib"))
  writeLines("# Project Abstract\n\nThis is a dummy README for your research project.", file.path(project_name, "README.md"))
  writeLines("Version: 1.0\n\nDummy RStudio Project file.", file.path(project_name, ".Rproj"))

  # Create dummy survey data
  survey_data <- data.frame(ID = 1:5, Q1 = sample(1:5, 5, TRUE), Q2 = sample(1:5, 5, TRUE))
  write.csv(survey_data, file.path(project_name, "data", "survey_data.csv"), row.names = FALSE)

  # Create placeholder PDF
  pdf_path <- file.path(project_name, "output", "research_paper.pdf")
  pdf(pdf_path)
  plot(1:10, main = "Placeholder PDF")
  dev.off()

  message("Project folder created: ", project_name)
  invisible(project_name)
}
