# Check for Package Updates

Checks whether a newer version of coursepackR is available on GitHub and
optionally installs it.

## Usage

``` r
mccourse_update(
  update = c("ask", "always", "never"),
  repo = NULL,
  quiet = FALSE
)
```

## Arguments

- update:

  Character: `"ask"` (default) prompts interactively, `"always"` updates
  without asking, `"never"` only checks.

- repo:

  Character GitHub repository in `"owner/repo"` format. Defaults to
  `getOption("coursepackR.repo", "SIM-Lab-SIUE/coursepackR")`.

- quiet:

  Logical; if `TRUE`, suppress informational messages.

## Value

Invisibly, `TRUE` if an update was performed, `FALSE` otherwise.

## Examples

``` r
if (FALSE) { # \dontrun{
mccourse_update()
mccourse_update(update = "always")
} # }
```
