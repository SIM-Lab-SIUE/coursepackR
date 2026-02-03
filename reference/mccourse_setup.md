# One-time setup for mccoursepack

Installs Quarto CLI (via the quarto R package) and TinyTeX if missing,
then ensures a small set of core CRAN packages are available. On
Windows, warns if Rtools is not installed.

## Usage

``` r
mccourse_setup()
```

## Details

Safe to re-run; it only installs what's missing.
