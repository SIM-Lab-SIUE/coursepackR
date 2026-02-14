# Download Weekly Course Materials

Copies a week's template files from the installed package to a local
directory. Creates a `week_XX` subdirectory at the destination.

## Usage

``` r
download_week(course, week = NULL, dest = ".")
```

## Arguments

- course:

  Character course identifier (e.g., `"mc451"`). If only one course is
  installed, this can be an integer week number for convenience.

- week:

  Integer or character week number. Accepts `1`, `"01"`, or `"week_01"`
  formats.

- dest:

  Character destination directory (default: current directory).

## Value

Invisibly, a list with components `dest`, `course`, `week`, and
`n_copied`.

## Examples

``` r
if (FALSE) { # \dontrun{
download_week("mc451", 1)
download_week("mc451", 1, dest = "~/my-course")
} # }
```
