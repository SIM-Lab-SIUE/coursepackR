
[![Website](https://img.shields.io/badge/docs-mccoursepack-blue)](https://sim-lab-siue.github.io/mccoursepack)
[![Reference](https://img.shields.io/badge/reference-index-blueviolet)](https://sim-lab-siue.github.io/mccoursepack/reference/index.html)
[![GitHub](https://img.shields.io/badge/source-GitHub-black)](https://github.com/sim-lab-siue/mccoursepack)

# mccoursepack

Course materials for **MC 451 (Undergraduate)** and **MC 501 (Graduate)** delivered as an R package.  
Install or update the package each week, then use its helper functions to pull your course scaffolds (Quarto docs, instructions, and any starter files) into your local folders. ([GitHub][1])

---

## What you’ll do with this package

- Install/update the package.
- List available weeks for your course.
- Download the scaffold for a specific week into a folder on your computer.
- Download the journal scaffold for your course.
- Open the Quarto (`.qmd`) files, complete the work, render to HTML/PDF as needed, and submit by pushing to GitHub.

> Some weeks are intentionally empty (e.g., holidays). Downloading those weeks will succeed but copy no files—that’s normal.

---

## Prerequisites (one-time)

1. Install [R](https://cran.r-project.org) and [RStudio](https://posit.co/download/rstudio/).
2. Make sure you have [Git](https://git-scm.com/downloads) installed and working with your GitHub account.
3. Install the package from GitHub:

```r
# install.packages("remotes")
remotes::install_github("sim-lab-siue/mccoursepack")
````

---

## Core functions

### List available weeks

```r
list_weeks("mc451")
list_weeks("mc501")
```

### Download a specific week

```r
download_week("mc451", week = 3, dest = ".")
```

* `course`: `"mc451"` or `"mc501"`
* `week`: week number to download
* `dest`: folder to copy files into (defaults to `"."`)

📖 [Function reference for `download_week()`](https://sim-lab-siue.github.io/mccoursepack/reference/download_week.html)

---

### Download the course journal

```r
download_journal("mc451")
```

* `course`: `"mc451"` or `"mc501"`
* `dest`: folder to copy files into (defaults to `"."`)

This copies the entire journal scaffold (templates, readme, assets) for your course.

📖 [Function reference for `download_journal()`](https://sim-lab-siue.github.io/mccoursepack/reference/download_journal.html)

---

## Workflow

1. Use `list_weeks()` to see what’s available.
2. Run `download_week()` to pull down your weekly scaffold.
3. Run `download_journal()` once to set up your course journal.
4. Open the `.qmd` files in RStudio, complete your work, render to HTML/PDF, and push to GitHub for submission.

---

[1]: https://github.com/sim-lab-siue/mccoursepack
