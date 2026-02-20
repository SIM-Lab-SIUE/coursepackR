# Installation & Setup

This guide walks you through installing coursepackR, configuring your
environment, and verifying that everything is ready for MC-451.

## Prerequisites

Before installing coursepackR, you need:

- **R (\>= 4.1)** — Download from <https://cran.r-project.org/>
- **RStudio Desktop** (recommended) — Download from
  <https://posit.co/download/rstudio-desktop/>

If you need step-by-step installation instructions for R and RStudio,
see the [R & RStudio Installation
Guide](https://sim-lab-siue.github.io/liaison-program/resources/install-r-rstudio.html)
on the course website.

Check your R version:

``` r
R.version.string
#> [1] "R version 4.5.2 (2025-10-22)"
```

If your version is below 4.1, download the latest R before proceeding.

## Installing coursepackR

coursepackR is hosted on GitHub. Install it with the `remotes` package:

``` r
# Install remotes if you don't have it
install.packages("remotes")

# Install coursepackR
remotes::install_github("SIM-Lab-SIUE/coursepackR")
```

This downloads and installs the package along with its dependencies
(`cli`, `rlang`, and `utils`). The install takes 1–2 minutes on most
connections.

### If the install fails

- **“there is no package called ‘remotes’”** — Run
  `install.packages("remotes")` first.
- **“cannot open URL”** or timeout errors — Check your internet
  connection. If you’re on a campus or corporate network, a firewall may
  be blocking GitHub. Try from a personal network or ask IT to allow
  `github.com` and `api.github.com`.
- **“package ‘coursepackR’ is not available for this version of R”** —
  You need R \>= 4.1. Update R and try again.

## First-Time Setup

After installing, run the one-time setup function:

``` r
library(coursepackR)
mccourse_setup()
```

This function walks you through several steps:

1.  **Quarto CLI** — Checks whether Quarto is installed. If not, it
    opens the download page (<https://quarto.org/docs/get-started/>) and
    pauses so you can install it. Quarto is required for rendering
    assignment templates to HTML or PDF.

2.  **TinyTeX** — Installs TinyTeX, a lightweight LaTeX distribution
    needed for PDF output. This is the longest step (5–10 minutes on
    first run). If you already have a LaTeX distribution, this step is
    skipped.

3.  **Core R packages** — Installs packages used in course assignments,
    including `tidyverse`, `knitr`, `rmarkdown`, and others. Packages
    you already have are skipped.

Each step prints status messages so you can see what’s happening. If any
step fails, the function reports the error and continues with the
remaining steps.

### After setup

Restart RStudio after running
[`mccourse_setup()`](https://sim-lab-siue.github.io/coursepackR/reference/mccourse_setup.md).
This ensures Quarto and any new packages are properly detected.

## Verifying Your Environment

Run the diagnostic check to confirm everything is working:

``` r
mccourse_check()
```

This returns a named list with the status of each component:

| Check       | What it verifies                                   |
|-------------|----------------------------------------------------|
| `r_version` | R \>= 4.1 is installed                             |
| `rstudio`   | Running inside RStudio (recommended, not required) |
| `quarto`    | Quarto CLI is on your system PATH                  |
| `git`       | Git is installed (needed for version control)      |
| `templates` | Course templates are bundled in the package        |

A passing check shows a green checkmark. A failing check shows a red X
with a suggested fix.

### Fixing failed checks

- **R version** — Download the latest R from
  <https://cran.r-project.org/> and reinstall coursepackR.
- **RStudio** — Download from
  <https://posit.co/download/rstudio-desktop/>. This is recommended but
  the package works without it.
- **Quarto** — Download from <https://quarto.org/docs/get-started/>.
  After installing, restart RStudio and re-check.
- **Git** — Download from <https://git-scm.com/>. After installing,
  restart RStudio. See the [GitHub Setup
  Guide](https://sim-lab-siue.github.io/liaison-program/resources/github-setup.html)
  for configuration.
- **Templates** — This should always pass. If it fails, reinstall the
  package with `remotes::install_github("SIM-Lab-SIUE/coursepackR")`.

## Updating coursepackR

Check for updates at any time:

``` r
mccourse_update()
```

This compares your installed version against the latest release on
GitHub. If an update is available, it will ask whether you want to
install it.

You can also force a reinstall:

``` r
remotes::install_github("SIM-Lab-SIUE/coursepackR")
```

## Uninstalling

To remove coursepackR:

``` r
remove.packages("coursepackR")
```

This does not remove TinyTeX or other packages installed by
[`mccourse_setup()`](https://sim-lab-siue.github.io/coursepackR/reference/mccourse_setup.md).
To remove TinyTeX separately:

``` r
tinytex::uninstall_tinytex()
```
