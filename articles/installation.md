# Installation & Setup

## Installation

Install coursepackR directly from GitHub:

``` r
# Install remotes if needed
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install coursepackR
remotes::install_github("SIM-Lab-SIUE/coursepackR")
```

## First-Time Setup

After installation, load the package and run the setup function:

``` r
library(coursepackR)
mccourse_setup()
```

This will:

- Check your R and RStudio versions
- Install and configure Quarto CLI
- Install TinyTeX for PDF rendering
- Verify Git installation
- Set up your course directory structure

## Self-Test

Verify your environment is ready:

``` r
mccourse_self_test()
```

This checks:

✓ R version (≥ 4.0)  
✓ RStudio version  
✓ Quarto CLI  
✓ Git installation  
✓ Course directory structure

## Package Updates

To update to the latest version:

``` r
mccourse_update()
```

## Next Steps

- [Building Your
  Course](https://sim-lab-siue.github.io/coursepackR/articles/building-course.md) -
  Create your course structure
- [Textbook
  Integration](https://sim-lab-siue.github.io/coursepackR/articles/textbook-integration.md) -
  Integrate the OER textbook
