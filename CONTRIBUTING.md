# Contributing to coursepackR

Thank you for your interest in improving coursepackR! This document
explains how to report issues, suggest changes, and contribute code.

## Reporting Bugs

If something isn't working, please
[open an issue](https://github.com/SIM-Lab-SIUE/coursepackR/issues/new)
on GitHub. A helpful bug report includes:

- The R command you ran and the exact error message
- Output of `mccourse_check()` (so we can see your environment)
- Your R version (`R.version.string`) and operating system
- Steps to reproduce the problem

## Suggesting Features or Improvements

Feature requests are welcome! Open a
[GitHub issue](https://github.com/SIM-Lab-SIUE/coursepackR/issues/new)
describing:

- What you'd like the package to do
- Why it would be useful for students or instructors
- Any ideas for how it might work

## Contributing Code

### Development Setup

1. **Fork** the repository on GitHub.

2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/coursepackR.git
   cd coursepackR
   ```

3. **Install development dependencies**:
   ```r
   install.packages(c("devtools", "roxygen2", "testthat", "pkgdown"))
   ```

4. **Load the package** for interactive development:
   ```r
   devtools::load_all()
   ```

### Code Style

- **Documentation**: Use [roxygen2](https://roxygen2.r-lib.org/) for
  all exported functions. Include `@param`, `@return`, `@examples`,
  and `@export` tags.
- **User-facing messages**: Use the
  [cli](https://cli.r-lib.org/) package (`cli::cli_alert_success()`,
  `cli::cli_alert_danger()`, etc.) — not `message()`, `cat()`, or
  `print()`.
- **Errors and warnings**: Use `rlang::abort()` and `rlang::warn()`
  instead of `stop()` and `warning()`.
- **Tests**: Use [testthat](https://testthat.r-lib.org/) (edition 3).
  Put tests in `tests/testthat/test-*.R`.
- **File paths**: Always use `file.path()` — never paste paths with
  `/` or `\\`.

### Making Changes

1. **Create a branch** for your changes:
   ```bash
   git checkout -b fix/describe-your-change
   ```

2. **Make your edits** in `R/`, `man/`, `vignettes/`, or `tests/`.

3. **Rebuild documentation** if you changed any roxygen2 comments:
   ```r
   devtools::document()
   ```

4. **Run tests**:
   ```r
   devtools::test()
   ```

5. **Run R CMD check**:
   ```r
   devtools::check()
   ```
   Aim for 0 errors, 0 warnings, and 0 notes.

6. **Commit and push**:
   ```bash
   git add -A
   git commit -m "Brief description of change"
   git push origin fix/describe-your-change
   ```

7. **Open a pull request** on GitHub against the `main` branch.
   Describe what you changed and why.

### Pull Request Checklist

- [ ] `devtools::check()` passes with no errors or warnings
- [ ] `devtools::test()` passes all tests
- [ ] New exported functions have roxygen2 documentation
- [ ] New features have at least one test
- [ ] Vignettes build without errors

## Questions?

Open an issue or contact the maintainer at aleith@siue.edu.
