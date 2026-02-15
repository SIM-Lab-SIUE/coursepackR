# Download Journal Entry Template

Creates a week-specific copy of the journal template. Each call produces
a uniquely named file (e.g., `Week_03_Journal.qmd`) so previous entries
are never overwritten.

## Usage

``` r
download_journal(week, course = "mc451", dest = ".")
```

## Arguments

- week:

  Integer week number (1–17).

- course:

  Character course identifier (default: `"mc451"`).

- dest:

  Character destination directory (default: current directory). A
  `journal/` subdirectory is created automatically.

## Value

Invisibly, the path to the created file.

## Examples

``` r
if (FALSE) { # \dontrun{
download_journal(3)
download_journal(5, dest = "~/my-course")
} # }
```
