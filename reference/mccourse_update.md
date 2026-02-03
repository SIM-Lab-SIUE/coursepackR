# Update mccoursepack to the latest version (CRAN or GitHub)

This helper checks whether a newer version of `mccoursepack` is
available and, if so, can prompt to update (interactive) or return
quietly (non-interactive).

## Usage

``` r
mccourse_update(
  update = c("ask", "always", "never"),
  source = c("auto", "CRAN", "GitHub"),
  repo = getOption("mccoursepack.repo", NULL),
  quiet = FALSE
)
```

## Arguments

- update:

  "ask" (default), "always", or "never"

- source:

  "auto", "CRAN", or "GitHub"

- repo:

  GitHub "owner/repo" string if using GitHub (defaults to
  `getOption("mccoursepack.repo")`)

- quiet:

  logical; reduce messages (useful when calling inside other helpers)

## Value

logical indicating whether an update was performed

## Details

Configure the source with:

- `options(mccoursepack.repo = "owner/mccoursepack")` for GitHub

- or install from CRAN if the package is published there.

To enable auto-checks before pulls:
`options(mccoursepack.auto_update = TRUE)` or set env var
`MCCOURSEPACK_AUTO_UPDATE=1`.
