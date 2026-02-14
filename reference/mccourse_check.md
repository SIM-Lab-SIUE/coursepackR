# Check Course Environment

Runs a series of diagnostic checks to verify the student's environment
is properly configured. Checks R version, RStudio, Quarto CLI, Git, and
installed course templates.

## Usage

``` r
mccourse_check(course = "mc451", min_r = "4.1.0")
```

## Arguments

- course:

  Character course identifier to check templates for (default:
  `"mc451"`).

- min_r:

  Character minimum R version required (default: `"4.1.0"`).

## Value

A named list with logical results for each check: `r`, `rstudio`,
`quarto`, `git`, `templates`.

## Examples

``` r
if (FALSE) { # \dontrun{
mccourse_check()
} # }
```
