# coursepackR - Instructor Customization Guide

Welcome! This guide walks you through customizing `coursepackR` for your
courses. The goal is to transform this template into a production-ready
package that your students will love.

------------------------------------------------------------------------

## 📋 Overview: 5-Step Customization

1.  **Configure Package Metadata** (5 min)
2.  **Organize Your Courses** (15 min)
3.  **Create Weekly Materials** (Ongoing)
4.  **Customize R Functions** (Optional, 20 min)
5.  **Test and Publish** (15 min)

------------------------------------------------------------------------

## Step 1: Configure Package Metadata

Edit the file: **`DESCRIPTION`**

``` r
Package: mystatcourse          # Change from 'coursepackR' - use lowercase, no spaces
Type: Package
Title: Introduction to Statistics with R   # Your course title(s)
Version: 01.00.00              # Start with version 01.00.00
Authors@R: person(
  "Your Name", 
  email = "you@university.edu", 
  role = c("aut", "cre")
)
Description: A course package providing weekly scaffolds and R/RStudio setup
    for [YOUR COURSE DESCRIPTION]. Students access materials and manage
    their projects through this package.
License: MIT + file LICENSE
Encoding: UTF-8
Roxygen: list(markdown = TRUE)
RoxygenNote: 7.3.2
```

**Key fields:** - `Package`: Technical name (lowercase, no spaces, no
hyphens). This is what students type in
[`remotes::install_github()`](https://remotes.r-lib.org/reference/install_github.html) -
`Title`: Human-readable name of your package/course(s) - `Version`:
Start at `01.00.00`, increment minor version (`02.00.00`) for major
changes - `Description`: 2-3 sentences about what this package provides

------------------------------------------------------------------------

## Step 2: Organize Your Courses

### Directory Structure

Create one folder per course under `inst/courses/`:

    inst/courses/
    ├── mystat101/                    ← Course code/name (lowercase)
    │   ├── weeks/
    │   │   ├── week_01/              ← Week 1 materials
    │   │   │   ├── 01-assignment.qmd
    │   │   │   ├── starter_code.R
    │   │   │   └── data.csv
    │   │   ├── week_02/
    │   │   └── week_15/
    │   └── journal/
    │       └── journal_template.qmd  ← Optional: reflection template
    │
    ├── mystat501/                    ← Add more courses as needed
    │   ├── weeks/
    │   │   ├── week_01/
    │   │   └── ...
    │   └── journal/
    │
    └── template_course/              ← Keep as example (or delete)
        ├── weeks/
        │   └── week_01/
        └── journal/

**Important naming conventions:** - Course directories: lowercase (e.g.,
`mystat101`, `stat_201`) - Week directories: `week_01`, `week_02`, …
`week_15` (zero-padded) - Files can be anything: `.qmd` files, R
scripts, CSV data, PDFs, etc.

### What Goes in Each Week Folder?

**Recommended structure for week_01/:**

    week_01/
    ├── 01-assignment.qmd        # Main assignment (Quarto template)
    ├── starter_code.R           # Code skeleton for students
    ├── data.csv                 # Data file(s)
    ├── rubric.md                # Grading rubric (optional)
    └── hints.md                 # Helpful hints (optional)

**For a .qmd file, use a template like:**

``` yaml
---
title: "Week 1: Getting Started with R"
subtitle: "My Statistics Course"
author: "Your Name"
date: last-modified
format:
  html:
    embed-resources: true
    toc: true
---

## Overview

Welcome to Week 1! This week you'll...

## Assignment 1: Explore the Data

1. Load the data with...
2. Calculate...
3. Create a visualization...

## Submission

...
```

------------------------------------------------------------------------

## Step 3: Create Weekly Materials

For each week, decide what students need:

- **Minimal**: Just `.qmd` file with assignment description
- **Scaffolded**: `.qmd` + `starter_code.R` + data files
- **Guided**: Above + hints + rubric + video links

### Examples

#### Example 1: Data Analysis Assignment

    week_03/
    ├── 03-tidyverse-wrangling.qmd
    ├── starter_code.R              # Partially-filled code for students to complete
    ├── messy_data.csv
    └── rubric.md

#### Example 2: Open-Ended Project Week

    week_14/
    ├── 14-final-project.qmd        # Project description & requirements
    ├── project_template.Rmd        # R Markdown template
    ├── sample_dataset.csv
    └── resources.md                # Reading list, helpful links

#### Example 3: Literature Review (pairs with Obsidian later)

    week_01/
    ├── 01-literature-review.qmd
    ├── starter_questions.md
    └── recommended_papers.md

------------------------------------------------------------------------

## Step 4: Customize R Functions (Optional)

The main functions work out-of-the-box, but you can customize them:

### Function: `mccourse_setup()`

**File:** `R/setup.R`

This runs during student setup. Customize to install: - Your
domain-specific packages (`tidyverse`, `ggplot2`, etc.) - Your
university’s authentication tools - Custom R packages you’ve developed

``` r
# Around line 80, add:
if (interactive()) {
  cli::cli_alert_info("Installing domain-specific packages...")
  install.packages(c("tidyverse", "ggplot2", "brms", "bayesplot"))
}
```

### Function: `download_week()`

**File:** `R/download_week.R`

This is the main student-facing function. You can: - Add pre-download
hooks (e.g., create `.Rproj` file) - Add validation checks - Print
helpful messages

No changes needed for basic use!

### Function: `list_courses()` & `list_weeks()`

**File:** `R/listing.R`

These **automatically discover** your `inst/courses/` structure. No
customization needed!

### Function: `final_project()`

**File:** `R/final_project.R`

Customize to create capstone scaffolds with: - Required file structure -
Submission checklists - Rubrics - Timeline helpers

------------------------------------------------------------------------

## Step 5: Test and Publish

### Local Testing

``` r
# Install from your local directory
remotes::install_local("/path/to/your/coursepackR")

# Test the functions
list_courses()
#> [1] "mystat101" "mystat501"

list_weeks("mystat101")
#> [1] "week_01" "week_02" ... "week_15"

download_week("mystat101", 1)
#> ✓ Downloaded week 1 materials to week_01/
```

### Prepare for GitHub

1.  Create a GitHub repository (e.g., `mystat-coursepack`)
2.  Push your customized code to GitHub
3.  Share the installation command with students:

``` r
remotes::install_github("yourusername/mystat-coursepack")
```

### Make Updates

When you make changes (new weeks, bug fixes, etc.):

``` bash
git add .
git commit -m "Add week 10 materials"
git push
```

Students update with:

``` r
mccourse_update()
```

------------------------------------------------------------------------

## Advanced: Multipl Courses in One Package

You can bundle multiple courses in a single package:

    Package: departmentname
    Courses included: stat101, stat201, stat501, biostat301

    inst/courses/
    ├── stat101/weeks/...
    ├── stat201/weeks/...
    ├── stat501/weeks/...
    └── biostat301/weeks/...

Students just specify the course:

``` r
list_courses()
#> [1] "stat101" "stat201" "stat501" "biostat301"

download_week("stat201", 1)
```

------------------------------------------------------------------------

## Troubleshooting

**Q: Students get an error “Course ‘mystat101’ not found”**

A: Check: - Directory name matches exactly (lowercase):
`inst/courses/mystat101/` - It has a `weeks/` subdirectory with at least
one `week_01/` folder - You’ve run
[`remotes::install_github()`](https://remotes.r-lib.org/reference/install_github.html)
recently (not old installation)

**Q: Week folder downloads but is empty**

A: This is OK! Empty weeks create the folder anyway. If you want to add
content: - Create files in `inst/courses/mystat101/weeks/week_01/` - Run
[`remotes::install_github()`](https://remotes.r-lib.org/reference/install_github.html)
again to pull latest

**Q: Function names don’t match what I want**

A: The function names (`mccourse_setup`, `download_week`, etc.) are
exported from `R/*.R` files. If you want different names, edit those
files. For example, to rename
[`mccourse_setup()`](https://sim-lab-siue.github.io/coursepackR/reference/mccourse_setup.md)
→ `mystat_setup()`, edit `R/setup.R` and update the `@export` tag.

**Q: How do I add custom packages to setup?**

A: Edit `R/setup.R` around line 85 and add your packages:

``` r
install.packages(c("tidyverse", "shiny", "mypackage"))
```

------------------------------------------------------------------------

## Next Steps: Obsidian Integration

Once you have coursepackR working, you can enhance it with **Obsidian
integration** for research-driven courses.

See `OBSIDIAN_INTEGRATION.md` for: - Setting up a linked Obsidian
vault - Creating backlinks from RStudio to research notes - Example
workflow: Literature Review → Data Analysis → Writing

------------------------------------------------------------------------

## Support & Questions

For issues with coursepackR itself, see the template documentation at: -
GitHub:
[SIM-Lab-SIUE/coursepackR](https://github.com/SIM-Lab-SIUE/coursepackR) -
Issue tracker for bug reports

For customization help, review the R function help files:

``` r
?mccourse_setup
?download_week
?list_courses
```

Good luck! Happy customizing! 🎓
