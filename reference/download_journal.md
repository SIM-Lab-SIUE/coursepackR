# Download Journal Scaffold

Copies the journal template directory for a course to a local folder.

## Usage

``` r
download_journal(course, dest = ".")
```

## Arguments

- course:

  Character course identifier (e.g., `"mc451"`).

- dest:

  Character destination directory (default: current directory).

## Value

Invisibly, a character vector of file paths that were written.

## Examples

``` r
if (FALSE) { # \dontrun{
download_journal("mc451")
} # }
```
