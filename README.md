# coursepackR

![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen) ![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)

[MIT](https://opensource.org/licenses/MIT)

**Template Author:** Dr. Alex P. Leith ([aleith\@siue.edu](mailto:aleith@siue.edu))\
**Lab Page:** [SIM Lab](https://sim-lab-siue.github.io/)\
**Research Page:** [Dr. Alex P. Leith](https://apleith.github.io/)

**Version:** 02.00.00 (Instructor Template)

---

## 📦 About This Package

`coursepackR` is a **flexible template framework** for social science instructors to create R-based course packages. It provides a structured, extensible system for delivering weekly course materials, managing student projects, and scaffolding the R/RStudio learning experience.

Rather than being tied to specific courses, **this is a template you customize for your own courses**. It includes:

- ✅ Automated environment setup (Quarto, TinyTeX, essential packages)
- ✅ Scaffolded weekly materials and assignment templates
- ✅ Student-friendly functions for accessing course content
- ✅ Journal/reflection templates for structured learning
- ✅ Integration hooks for Obsidian research notes and RStudio workflows
- ✅ Self-check diagnostics to verify student environments

### 🎯 What's New in This Version

This is a **generalized template release** extracted from a successful implementation:

- ✅ **De-coupled from specific courses** - Renamed from "mccoursepack" to generic framework
- ✅ **Instructor-focused documentation** - Guides for customization and adaptation
- ✅ **Template structure** - Ready-to-fill placeholder course directories
- ✅ **Configuration system** - Easy customization without code changes
- ✅ **Obsidian integration ready** - Hooks for research note/code workflow

------------------------------------------------------------------------

## 🚀 Quick Start for Instructors

### Option 1: Copy and Customize (Recommended)

1. **Fork or clone this repository** as a starting point for your course package
2. **Rename** your package to something specific to your course/institution
3. **Update** `DESCRIPTION`, `README.md`, and function documentation 
4. **Customize** `inst/courses/` with your course(s) and weekly materials
5. **Install** locally and test with `remotes::install_local()`
6. **Push to GitHub** and your students install with `remotes::install_github()`

### Option 2: Manual Setup from This Template

1. Create a new R package structure in RStudio
2. Copy the R functions from this repository into your `R/` directory
3. Structure your course materials in `inst/courses/<coursename>/weeks/`
4. Customize the package metadata and functions as needed

---

## 📂 Package Structure for Customization

```
your-coursepack/
├── R/
│   ├── setup.R                    # mccourse_setup() - environment setup
│   ├── check_env.R                # mccourse_self_test() - diagnostics
│   ├── listing.R                  # list_courses(), list_weeks()
│   ├── download_week.R            # download_week() - student main function
│   ├── download_journal.R         # download_journal() - reflection template
│   ├── open_week.R                # open_week() - helper
│   ├── update.R                   # mccourse_update() - version management
│   ├── final_project.R            # final_project() - capstone support
│   ├── utils-paths.R              # Internal path utilities
│   └── zzz.R                       # Package startup message
│
├── inst/courses/
│   ├── mycourse101/
│   │   ├── weeks/
│   │   │   ├── week_01/
│   │   │   │   └── [.qmd files, starter code, etc.]
│   │   │   ├── week_02/
│   │   │   └── ...
│   │   └── journal/
│   │       └── journal_template.qmd
│   │
│   └── [add more courses here]
│
├── inst/guides/
│   ├── final_submission_checklist.md
│   └── [course guides, rubrics, etc.]
│
├── inst/extdata/
│   └── [datasets for examples and assignments]
│
├── inst/templates/
│   └── [reusable template files]
│
└── DESCRIPTION
```

---

## 🎯 How to Customize

### 1. **Rename Your Package**

Edit `DESCRIPTION`:
```r
Package: mystatcourse    # Change from 'coursepackR'
Title: Introduction to Statistics with R at MyUniversity
```

### 2. **Add Your Courses**

Create directory structure:
```bash
inst/courses/stat101/weeks/week_01/
inst/courses/stat101/weeks/week_02/
# ... etc
```

Place your course materials (`.qmd` files, starter code, data files) in each week folder.

### 3. **Update Function Names (Optional)**

If you prefer function names specific to your course, edit the R functions:

```r
# Instead of mccourse_setup(), rename to mystat_setup()
# Instead of download_week("stat101", 1), students call download_week(1)
```

### 4. **Customize Documentation**

- Update `README.md` with your course context
- Edit function help pages (`R/*.R` @export sections) 
- Add course-specific guidance in `inst/guides/`

---

## ✨ Student Workflow (Post-Customization)

Once your students install your customized package:

1. **Initial Setup**: `mccourse_setup()` → Install Quarto, TinyTeX, packages
2. **Verify Environment**: `mccourse_self_test()` → Run diagnostic checks
3. **List Materials**: `list_courses()` & `list_weeks()` → See what's available
4. **Download Work**: `download_week(course, week)` → Copy templates to computer
5. **Open & Work**: `open_week()` → Browse materials and start coding
6. **Update Package**: `mccourse_update()` → Get latest materials/fixes

---

## 🔧 Functions You'll Customize

### `mccourse_setup()`
Installs system dependencies. Customize to add:
- Domain-specific packages (e.g., tidyverse, ggplot2, brms)
- Your institution's authentication tools
- Additional software (e.g., Zotero, Obsidian helpers)

### `download_week()` & `download_journal()`
These are the **main student-facing functions**. They'll work as-is but you can:
- Add custom file templates
- Implement pre-download hooks (e.g., create RStudio Projects)
- Add validation checks

### `list_courses()` & `list_weeks()`
These **automatically discover** your `inst/courses/` structure. No changes needed!

### `final_project()`
Scaffold for capstone projects. Customize with:
- Your rubrics and checklists
- Required files and structure
- Submission guidelines

---

## 🧑‍💼 For Instructors: Integration with Obsidian

`coursepackR` is designed to work seamlessly with **Obsidian** for research-driven courses:

### Workflow Integration
- Students maintain **research notes in Obsidian** (literature, ideas, findings)
- **RStudio Project** automatically linked to Obsidian vault
- Built-in functions to reference and cite notes from analysis code
- Bidirectional sync: notes inform analysis, results update notes

### Getting Started
See `OBSIDIAN_INTEGRATION.md` for:
- Setting up Obsidian vault alongside course package
- Linking RStudio projects to note collections
- Creating citation links from code to research notes
- Example workflows (literature review → data analysis → writing)

---

## 📚 Reference Implementation

This template was extracted from a successful implementation at Southern Illinois University Edwardsville:

**Original Package**: `siue-mccoursepack` branch  
**Original Courses**: MC451 (Undergraduate) & MC501 (Graduate)  
**Student Count**: 50+ per semester  
**Success Metric**: 95%+ environment setup success rate

See the `siue-mccoursepack` branch if you want to examine a working example before customizing your own.

---

## ❓ Troubleshooting

**Q: Students get "pak" or "quarto" warnings**

A: These are harmless. The package uses fully qualified calls (e.g., `pak::pkg_diff()`). As long as `pak` and `quarto` are installed, everything works. They can safely ignore the warnings.

**Q: A student's week folder doesn't appear after `download_week()`**

A: This might mean:
- The week doesn't exist in `inst/courses/<course>/weeks/`
- The week folder exists but is empty (this is OK—the folder is created anyway)
- The course name is misspelled

Use `list_courses()` and `list_weeks()` to verify what's available.

**Q: How do students install and stay updated?**

A: One-time installation:
```r
remotes::install_github("yourusername/yourcoursepack")
```

Check for updates anytime:
```r
mccourse_update()  # Downloads latest from GitHub
```

---

## ✨ Core Functions Reference

### Environment Setup
- **`mccourse_setup()`** - One-time system setup (Quarto, TinyTeX, R packages)
- **`mccourse_self_test()`** - Diagnostic checks for student environments
- **`mccourse_update()`** - Install latest package version from GitHub

### Course Materials  
- **`list_courses()`** - See available courses
- **`list_weeks(course)`** - See available weeks for a course
- **`download_week(course, week, dest)`** - Copy week template to computer
- **`download_journal(course)`** - Copy journal template

### Utilities
- **`open_week()`** - Open downloaded week in file explorer
- **`final_project()`** - Scaffold for capstone/final projects