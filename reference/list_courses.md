# List available courses (if present) or week templates

If your package organizes templates by course (e.g.,
`inst/templates/mc451/week01`), this returns the list of course
directories (e.g., `mc451`, `mc501`). If not, it returns an empty
character vector.

## Usage

``` r
list_courses()

list_courses()
```

## Value

A character vector of course directory names found under
`inst/templates`.

A character vector of course names (e.g., "mc451", "mc501").

## Examples

``` r
list_courses()
#> character(0)
list_courses()
#> character(0)
```
