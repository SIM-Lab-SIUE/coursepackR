# coursepackR

[![R-CMD-check](https://github.com/SIM-Lab-SIUE/coursepackR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/SIM-Lab-SIUE/coursepackR/actions/workflows/R-CMD-check.yaml)
[![pkgdown](https://github.com/SIM-Lab-SIUE/coursepackR/actions/workflows/pkgdown.yaml/badge.svg)](https://sim-lab-siue.github.io/coursepackR/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Student-facing R package for **MC-451 Research Methods** at SIUE, built
around the open textbook *[From Vibes to Variables: A Field Guide to Open
Media Science](https://sim-lab-siue.github.io/vibes-to-variables/)*.

## Install

```r
# Install remotes if you don't have it
install.packages("remotes")

# Install coursepackR from GitHub
remotes::install_github("SIM-Lab-SIUE/coursepackR")
```

Requires **R >= 4.1**. RStudio Desktop is recommended but not required.

## Quick Start

```r
library(coursepackR)

# 1. First-time setup (installs Quarto, TinyTeX, and all course packages)
mccourse_setup()

# 2. Verify your environment — runs 8 diagnostic checks
mccourse_check()

# 3. Download this week's materials
download_week("mc451", 1)

# 4. Open the folder in your file browser
open_week(1)

# 5. Access the music dataset
data(unified_music)
head(unified_music)
```

---

## What's Included

### Functions

| Function | Description |
|----------|-------------|
| `mccourse_setup()` | One-time environment setup — checks compiler toolchain (Rtools/Xcode CLT), Quarto CLI version, TinyTeX, and installs all 10 course R packages |
| `mccourse_check()` | Diagnostic check — verifies R version, RStudio, Quarto version (>= 1.4.0), Git, compiler toolchain, all course packages, course templates, and working directory path safety |
| `mccourse_update()` | Check for and install package updates from GitHub |
| `download_week()` | Download a specific week's assignment template to your working directory |
| `download_journal()` | Download the reflective journal template for a given week |
| `open_week()` | Open a downloaded week's folder in your system file browser |
| `final_project()` | Scaffold a final project folder with Quarto document, bibliography, and data directory |
| `list_courses()` | List all available course IDs bundled in the package |
| `list_weeks()` | List all available weeks for a given course |

### Dataset

The `unified_music` dataset contains **1,792 songs** with **36 variables** from three sources:

- **Billboard** — chart rank, weeks on board, chart entry/exit dates
- **Spotify** — audio features (danceability, energy, valence, tempo, loudness, etc.)
- **Genius** — page views, lyrics, featured artists

```r
data(unified_music)
dim(unified_music)
#> [1] 1792   36
```

See the [Unified Music Dataset vignette](https://sim-lab-siue.github.io/coursepackR/articles/unified-music-codebook.html) for the full variable reference and example analyses.

### Textbook Chapters

All 17 chapters of *From Vibes to Variables* are bundled for offline reading:

```r
# Path to chapter 1
system.file("textbook", "chapter01.md", package = "coursepackR")
```

Read the full book online at <https://sim-lab-siue.github.io/vibes-to-variables/>.

### Weekly Templates

17 weeks of `.qmd` assignment templates for MC-451, aligned with textbook chapters:

```r
list_weeks("mc451")
download_week("mc451", 1)
```

---

## Weekly Workflow

Each week during the semester:

1. **Download** this week's template:
   ```r
   download_week("mc451", 3)
   ```
2. **Open** the folder:
   ```r
   open_week(3)
   ```
3. **Work** through the `.qmd` file in RStudio — read the chapter, answer prompts, run code
4. **Render** to HTML or PDF when finished (click Render in RStudio or `quarto render`)
5. **Reflect** in your journal:
   ```r
   download_journal("mc451")
   ```

---

## Troubleshooting

**"Error in loadNamespace: there is no package called 'remotes'"**
Run `install.packages("remotes")` first, then retry the install.

**"package 'coursepackR' is not available for this version of R"**
You need R >= 4.1. Check your version with `R.version.string`. Download the latest R from <https://cran.r-project.org/>.

**`mccourse_check()` reports Quarto not found or version too old**
Download or update Quarto CLI from <https://quarto.org/docs/get-started/>. After installing, restart RStudio and run `mccourse_check()` again. Quarto >= 1.4.0 is required.

**`mccourse_check()` reports compiler toolchain missing**
- *Windows:* Rtools is needed to install some R packages from source. Download from <https://cran.r-project.org/bin/windows/Rtools/>, then restart RStudio.
- *macOS:* Run `xcode-select --install` in the Terminal, follow the prompts, then restart RStudio.

**`mccourse_check()` reports missing course packages**
Run `mccourse_setup()` to install all missing packages automatically, then re-run `mccourse_check()`.

**`mccourse_check()` warns about working directory path**
- *Cloud-sync folder (OneDrive, Dropbox, Google Drive):* File locking by the sync client can cause save failures and corrupted files. Move your project folder to `Documents/` or the Desktop outside the synced area.
- *Spaces in path:* Some tools (including Quarto) cannot handle paths that contain spaces. Move the project to a path like `C:/courses/mc451/` that contains no spaces.

**`mccourse_check()` shows any other failing check**
Run `mccourse_setup()` to install missing components, then re-check.

**`download_week()` says the folder already exists**
The function won't overwrite existing files. Delete or rename the old folder if you want a fresh copy.

---

## Project Structure

```
coursepackR/
├── R/                    # Package functions
├── man/                  # Auto-generated help pages
├── data/                 # unified_music.rda (lazy-loaded)
├── data-raw/             # Source CSV and preparation script
├── inst/
│   ├── textbook/         # 17 markdown chapters (offline access)
│   └── courses/mc451/
│       ├── weeks/        # Weekly .qmd templates (week_01–week_17)
│       └── journal/      # Journal template
├── vignettes/            # Long-form guides
├── tests/testthat/       # Unit tests
└── .github/workflows/    # CI/CD (R CMD check, pkgdown)
```

---

## Related Projects

| Project | Description | Link |
|---------|-------------|------|
| **vibes-to-variables** | Open textbook — *From Vibes to Variables* | [Read Online](https://sim-lab-siue.github.io/vibes-to-variables/) \| [GitHub](https://github.com/SIM-Lab-SIUE/vibes-to-variables) |
| **liaison-program** | Course support website with syllabus, setup guides, and resources | [Visit Site](https://sim-lab-siue.github.io/liaison-program/) \| [GitHub](https://github.com/SIM-Lab-SIUE/liaison-program) |

---

## License

MIT
