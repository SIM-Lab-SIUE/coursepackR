# Create Final Project Folder

Scaffolds a final project directory with a Quarto document,
bibliography, data folder, and RStudio project file.

## Usage

``` r
final_project(course, dest = ".")
```

## Arguments

- course:

  Character course identifier (e.g., `"mc451"`, `"mc501"`).

- dest:

  Character parent directory (default: current directory).

## Value

Invisibly, the path to the created project folder.

## Examples

``` r
if (FALSE) { # \dontrun{
final_project("mc451")
} # }
```
