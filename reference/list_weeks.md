# List available week templates

Lists installed week directories of the form `week01`, `week02`, … If
you pass a course name that exists under
`inst/templates/<course>/weekXX`, it lists the weeks for that course. If
`course` is `NULL` (default), it looks directly under `inst/templates/`.

If `course` is supplied, returns the **directory names** ("week_01",
"week_02", ...). If `course` is `NULL`, aggregates across courses and
returns unique week dir names.

## Usage

``` r
list_weeks(course = NULL)

list_weeks(course = NULL)
```

## Arguments

- course:

  Optional course directory name (e.g., "mc451", "mc501").

## Value

A character vector of available weeks like `"01"`, `"02"`, … (no
prefix).

A character vector like "week_01", "week_02", ...

## Examples

``` r
list_weeks()
#> character(0)
list_weeks("mc451")
#> character(0)
# Aggregate across courses (safe in examples):
list_weeks()
#> character(0)
# For a specific course (if installed):
# \donttest{
list_weeks("mc451")
#> character(0)
# }
```
