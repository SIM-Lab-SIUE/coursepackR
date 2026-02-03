# Download a week's template into a destination directory

Copies the installed files for a given `course` and `week` into a
subfolder named `week_XX` inside `dest`. If the week template is empty
(e.g., holiday weeks), it still creates the `week_XX` folder and copies
nothing.

## Usage

``` r
download_week(course, week = NULL, dest = ".")
```

## Arguments

- course:

  Course name (e.g., "mc451", "mc501"). For back-compat you may pass
  only `week` as the first argument if exactly one course is installed.

- week:

  Integer or string like `"01"` or `"week_01"`.

- dest:

  Destination directory (created if needed). Defaults to current dir.

## Value

(invisibly) a list with `dest` (the created week folder), `course`,
`week`, and `n_copied`.

## Details

Backward compatibility: if you call `download_week(1, dest)`, it assumes
there is a single installed course and uses it. If multiple courses
exist, you must supply the `course` argument.

## Examples

``` r
if (FALSE) { # \dontrun{
# Use a temporary folder in examples/checks (portable on Windows)
d <- tempdir()
download_week("mc451", 1, dest = d)  # creates d/week_01/...
} # }
```
