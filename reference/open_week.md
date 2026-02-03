# Open a downloaded week's folder in your system file browser

Convenience helper: after you've used
[`download_week()`](https://sim-lab-siue.github.io/coursepackR/reference/download_week.md)
to create a local folder (e.g., `./week_01`), this opens that folder in
your default file browser.

## Usage

``` r
open_week(week, dest = ".")
```

## Arguments

- week:

  Integer or string like "01".

- dest:

  Parent directory where the week folder resides. Defaults to `.`.

## Value

Invisibly, the opened path.

## Examples

``` r
# \donttest{
download_week("mc451", 1, ".")
#> Error: Template for course 'mc451' week 01 not found in the installed package.
open_week(1, ".")
# }
```
