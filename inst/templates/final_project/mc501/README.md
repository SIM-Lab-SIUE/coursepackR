# [Your Research Project Title]

This repository contains the RStudio project for [Your Course Name, e.g., MC 501].

## Abstract

[Insert your final, 250-word abstract here.]

## Project Structure

This project is organized as follows:

* `research_paper.qmd`: The main Quarto file containing the manuscript text, R code for analysis, and figure/table generation.
* `references.bib`: The bibliography file containing all 15-20 academic citations, managed by Zotero.
* `data/`: This folder contains the raw, original survey data.
    * `survey_data.csv`: The (dummy) data file used for analysis.
* `output/`: This folder contains the final rendered manuscript.
    * `research_paper.pdf`: The final APA 7th-formatted PDF.

---

## Step-by-Step Project Checklist

1. **Set up your project:**
    - Fill in your project details in `research_paper.qmd` (YAML header).
    - Replace the dummy data in `data/survey_data.csv` with your real survey data.
    - Export your bibliography from Zotero and update `references.bib`.

2. **Write your manuscript:**
    - Follow the APA outline and section comments in `research_paper.qmd`.
    - Synthesize 15-20 academic sources in your literature review.
    - Clearly state your two Research Questions (RQs) and/or Hypotheses (RHs).

3. **Analyze your data in RStudio:**
    - Use the example code chunks for data import, cleaning, and analysis.
    - Create at least two APA-formatted visualizations (tables/figures).

4. **Render your manuscript to PDF:**
    - In RStudio, click the 'Render' button, or run `quarto render research_paper.qmd` in the terminal.
    - The PDF will be saved in the `output/` folder.

5. **Finalize and submit:**
    - Edit for clarity, style, and APA formatting.
    - Check that all sources are cited correctly.
    - Push all files to your GitHub repository.
    - Submit your final PDF to Blackboard and your GitHub link to your instructor.

---

## Helpful Resources

- [Quarto Documentation](https://quarto.org/docs/)
- grad_technical_guide.md
- grad_github_guide.md
- grad_zotero_guide.md

For questions, contact your instructor or TA.