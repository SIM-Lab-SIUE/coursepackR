# Open a Downloaded Week Folder

Opens the specified week's folder in the system file browser (Finder,
File Explorer, etc.).

## Usage

``` r
open_week(week, dest = ".")
```

## Arguments

- week:

  Integer or character week number.

- dest:

  Character parent directory where week folders were downloaded
  (default: current directory).

## Value

Invisibly, the path that was opened.

## Examples

``` r
if (FALSE) { # \dontrun{
open_week(1)
} # }
```
