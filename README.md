[![Website](https://img.shields.io/badge/docs-mccoursepack-blue)](https://sim-lab-siue.github.io/mccoursepack)

# mccoursepack

Course materials for **MC 451 (Undergraduate)** and **MC 501 (Graduate)** delivered as an R package. Install/update the package, then use helper functions to copy a week’s scaffold (Quarto docs and any starter files) into your local project folder.

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
download_week("mc451", 1, dest = ".")
````

> Templates are **PDF-first** by default; HTML works too. If PDF rendering fails the first time, run `mccourse_setup()` again to install TinyTeX.

---

## 📚 Documentation (start here)

* **Getting Started:** environment setup & first render
  [https://sim-lab-siue.github.io/mccoursepack/pages/getting-started.html](https://sim-lab-siue.github.io/mccoursepack/pages/getting-started.html)
* **R & RStudio:** projects, panes, paths, shortcuts
  [https://sim-lab-siue.github.io/mccoursepack/pages/r-and-rstudio.html](https://sim-lab-siue.github.io/mccoursepack/pages/r-and-rstudio.html)
* **Git & GitHub:** enable Git in RStudio; stage → commit → push
  [https://sim-lab-siue.github.io/mccoursepack/pages/git-and-github.html](https://sim-lab-siue.github.io/mccoursepack/pages/git-and-github.html)
* **Quarto Basics:** render to PDF/HTML; project scoping
  [https://sim-lab-siue.github.io/mccoursepack/pages/quarto-basics.html](https://sim-lab-siue.github.io/mccoursepack/pages/quarto-basics.html)
* **Weekly Workflows:** repeatable rhythm for the term
  [https://sim-lab-siue.github.io/mccoursepack/pages/workflows.html](https://sim-lab-siue.github.io/mccoursepack/pages/workflows.html)
* **Troubleshooting:** quick fixes & diagnostics
  [https://sim-lab-siue.github.io/mccoursepack/pages/troubleshooting.html](https://sim-lab-siue.github.io/mccoursepack/pages/troubleshooting.html)
* **Package Reference:** all exported functions with examples
  [https://sim-lab-siue.github.io/mccoursepack/pages/reference.html](https://sim-lab-siue.github.io/mccoursepack/pages/reference.html)
* **(Optional) Create your GitHub Profile README:**
  [https://sim-lab-siue.github.io/mccoursepack/pages/github-profile-readme.html](https://sim-lab-siue.github.io/mccoursepack/pages/github-profile-readme.html)

---

## 🧰 What this package gives you

* **Discover** what’s available: `list_courses()`, `list_weeks(course)`
* **Copy** a week’s scaffold to your computer: `download_week(course, week, dest)`
* **Open** a local week folder: `open_week(week, dest)`
* **Set up** tools the easy way: `mccourse_setup()` (Quarto, TinyTeX, core CRAN pkgs)
* **Check** your environment: `mccourse_self_test()`
* **Update** to the latest build: `mccourse_update()`

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

Open the `.Rproj` inside that folder each time you work. Each week you’ll have a `week_01`, `week_02`, … subfolder with the documents you render and submit.

---

## 🔁 Weekly workflow (short version)

1. Open your **RStudio Project** (`.Rproj`)
2. Update the package: `pak::pak("SIM-Lab-SIUE/mccoursepack")`
3. `library(mccoursepack)`
4. `download_week("mc451", N, dest = ".")`
5. Open the week’s `.qmd` → **Render** (PDF/HTML)
6. **Git pane:** Stage → Commit → Push

Detailed walkthrough: **Weekly Workflows** page (link above).

---

## 🛠️ Troubleshooting (fast fixes)

* **Quarto not found:** Install Quarto; restart RStudio; or run `mccourse_setup()`
* **PDF render fails:** `mccourse_setup()` to install TinyTeX
* **Files didn’t appear:** check you’re in the right Project (`getwd()`), then re-run `download_week(...)`
* **Git push failed:** enable Git in RStudio and authenticate to GitHub

More fixes on the **Troubleshooting** page.

---

## 📦 Install / Update (details)

**Install (first time)**

```r
install.packages("pak")
pak::pak("SIM-Lab-SIUE/mccoursepack")
library(mccoursepack)
```

**Update (weekly)**

```r
pak::pak("SIM-Lab-SIUE/mccoursepack")
```

(You can also use `remotes::install_github(...)` if you prefer.)

---

## License

MIT © SIM Lab @ SIUE
