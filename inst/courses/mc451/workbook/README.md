# MC 451 R Workbook — Setup Guide

**Course:** MC 451 Research Methods in Mass Media | Spring 2026
**Instructor:** Dr. Alex P. Leith | aleith@siue.edu
**Purpose:** Practice/prep — not a graded assignment

---

## What This Is

This workbook covers everything you need to know about R for this course, from importing and cleaning data through visualizing, testing, and publishing your findings. Working through it will prepare you for:

- **R Assignment 01** — Data Wrangling
- **R Assignment 02** — Describing Data
- **R Assignment 03** — Inferencing Data
- **Your Final Portfolio** — rendered and published on GitHub Pages

Each section is paired with a short video from Dr. Leith. Watch the video first, then run the code.

---

## Getting Started (Do This Once)

### Step 1 — Open as an RStudio Project

1. In RStudio: **File → Open Project**
2. Navigate to this folder and open `mc451-r-workbook.Rproj`

> Opening as a Project ensures your working directory is set correctly so all code runs without modification.

### Step 2 — Install required packages

In the RStudio **Console**, run:

```r
install.packages(c(
  "tidyverse",
  "janitor",
  "kableExtra",
  "scales",
  "effsize"
))
```

You only need to do this once. If you already installed these for a previous assignment, skip it.

### Step 3 — Make sure coursepackR is installed

```r
# Check
library(coursepackR)

# If you get an error, reinstall:
# install.packages("remotes")
# remotes::install_github("SIM-Lab-SIUE/coursepackR")
```

### Step 4 — Open the workbook file

Open `mc451-r-workbook.qmd` in RStudio. Work through it top to bottom, running each code chunk as you go.

---

## How to Run Code Chunks

- **Single chunk:** Click the green ▶ button at the top-right of any code chunk, or press `Ctrl+Shift+Enter` (Windows) / `Cmd+Shift+Enter` (Mac)
- **All chunks above:** Click the downward arrow next to ▶
- **One line:** Place cursor on the line and press `Ctrl+Enter` / `Cmd+Enter`

---

## Optional: Render the Whole Workbook

To see the workbook as a formatted HTML document (good practice for your final portfolio):

In the RStudio **Terminal** tab (not the Console), run:

```bash
quarto render mc451-r-workbook.qmd
```

The output appears in the `docs/` folder. Open `docs/mc451-r-workbook.html` in your browser to see it.

---

## Questions?

- **Discord:** APLeith
- **Email:** aleith@siue.edu (allow 24 hours Mon–Fri)
- **Office Hours:** MW 10:00–11:30 and 13:30–15:00, Dunham Hall 1017

---

*MC 451 — Research Methods in Mass Media | Spring 2026 | SIUE Department of Mass Communications*
