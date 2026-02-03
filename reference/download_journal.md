# Download a course's journal scaffold to a local folder

Copies the journal scaffold for `course` into `dest`, preserving
subfolders. Supports both package layouts:

- inst/courses//journal/

- inst/extdata/courses//journal/

## Usage

``` r
download_journal(course, dest = ".", package = "mccoursepack")
```

## Arguments

- course:

  Character scalar. e.g., "mc451" or "mc501".

- dest:

  Destination directory (default "." = current working dir).

- package:

  Package name that contains the scaffolds (default "mccoursepack").

## Value

(invisibly) a character vector of written file paths.
