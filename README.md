[![Website](https://img.shields.io/badge/docs-mccoursepack-blue)](https://sim-lab-siue.github.io/mccoursepack)
[![GitHub](https://img.shields.io/badge/source-GitHub-black)](https://github.com/sim-lab-siue/mccoursepack)

# mccoursepack

Course materials for **MC 451 (Undergraduate)** and **MC 501 (Graduate)** delivered as an R package.  
Install or update the package each week, then use its helper functions to pull your course scaffolds (Quarto docs, instructions, and any starter files) into your local folders.

---

## 🚀 Quick start

```r
# 1) Install/update the package
install.packages("pak")
pak::pak("SIM-Lab-SIUE/mccoursepack")

# 2) Load it each new R session
library(mccoursepack)

# 3) One-time setup (Quarto, TinyTeX for PDFs, core packages)
mccourse_setup()

# 4) See what you can pull
list_courses()
list_weeks("mc451")       # or "mc501"

# 5) Copy a week’s scaffold into the current folder (creates ./week_XX/)
download_week("mc451", week = 1, dest = ".")

# 6) Copy the course journal scaffold once per course
download_journal("mc451", dest = ".")
````

> Templates are **PDF-first** by default; HTML works too.
> If PDF rendering fails the first time, run `mccourse_setup()` again to install TinyTeX.

---

## 📚 Documentation (start here)

* **Getting Started:** [getting-started.html](https://sim-lab-siue.github.io/mccoursepack/pages/getting-started.html)
* **R & RStudio:** [r-and-rstudio.html](https://sim-lab-siue.github.io/mccoursepack/pages/r-and-rstudio.html)
* **Git & GitHub:** [git-and-github.html](https://sim-lab-siue.github.io/mccoursepack/pages/git-and-github.html)
* **Quarto Basics:** [quarto-basics.html](https://sim-lab-siue.github.io/mccoursepack/pages/quarto-basics.html)
* **Weekly Workflows:** [workflows.html](https://sim-lab-siue.github.io/mccoursepack/pages/workflows.html)
* **Troubleshooting:** [troubleshooting.html](https://sim-lab-siue.github.io/mccoursepack/pages/troubleshooting.html)
* **Package Reference:** [reference](https://sim-lab-siue.github.io/mccoursepack/reference/index.html)

Specific functions:

* 📖 [download\_week()](https://sim-lab-siue.github.io/mccoursepack/reference/download_week.html)
* 📖 [download\_journal()](https://sim-lab-siue.github.io/mccoursepack/reference/download_journal.html)

---

## 🧰 What this package gives you

* **Discover**: `list_courses()`, `list_weeks(course)`
* **Copy**: `download_week(course, week, dest)` or `download_journal(course, dest)`
* **Open**: `open_week(week, dest)`
* **Set up**: `mccourse_setup()` (Quarto, TinyTeX, core CRAN pkgs)
* **Check**: `mccourse_self_test()`
* **Update**: `mccourse_update()`

---

## ✅ Prerequisites (one-time per computer)

* **R** and **RStudio Desktop**
* **Git** (so you can commit & push from RStudio)
* **Quarto** (renders `.qmd` to PDF/HTML)
* **TinyTeX** (only if you need PDF and don’t already have LaTeX) — `mccourse_setup()` can install this for you

See **Getting Started** for links, screenshots, and checks.

---

## 🗂️ Recommended local folder setup

Create a top-level folder per course:

```
~/Documents/MC451/
~/Documents/MC501/
```

Open the `.Rproj` inside that folder each time you work.
Each week you’ll have `week_01`, `week_02`, … subfolders and one `journal/` scaffold.

---

## 🔁 Weekly + journal workflow

1. Open your **RStudio Project** (`.Rproj`).
2. Update the package: `pak::pak("SIM-Lab-SIUE/mccoursepack")`.
3. `library(mccoursepack)`.
4. `download_week("mc451", N, dest = ".")`.
5. Run `download_journal("mc451")` once to set up your course journal.
6. Open the `.qmd` files → **Render** (PDF/HTML).
7. **Git pane:** Stage → Commit → Push.

---

## 🛠️ Troubleshooting (fast fixes)

* **Quarto not found:** Install Quarto; restart RStudio; or run `mccourse_setup()`.
* **PDF render fails:** `mccourse_setup()` to install TinyTeX.
* **Files didn’t appear:** check `getwd()`, then re-run `download_week(...)` or `download_journal(...)`.
* **Git push failed:** enable Git in RStudio and authenticate to GitHub.

More fixes on the [Troubleshooting page](https://sim-lab-siue.github.io/mccoursepack/pages/troubleshooting.html).

---

## 📦 Install / Update (details)

**Install (first time):**

```r
install.packages("pak")
pak::pak("SIM-Lab-SIUE/mccoursepack")
library(mccoursepack)
```

**Update (weekly):**

```r
pak::pak("SIM-Lab-SIUE/mccoursepack")
```

(You can also use `remotes::install_github(...)` if you prefer.)

---

## License

MIT © SIM Lab @ SIUE
