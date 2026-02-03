# Developer Guide - mccoursepack

## Overview

This R package provides course materials and environment setup
automation for MC 451 and MC 501 at SIUE. It’s designed to minimize
student setup friction by automating software installation and providing
easy access to weekly assignment templates.

## Package Architecture

### Core Design Philosophy

1.  **Minimal Dependencies** - Only include essential packages
2.  **Student-Friendly** - One-command setup and download
3.  **Portable** - Works on Windows, Mac, and Linux
4.  **Self-Contained** - Course materials bundled with package

### File Organization

    R/
    ├── check_env.R         - Environment diagnostics (R, RStudio, Quarto, Git)
    ├── data.R              - Dataset documentation (ATP_W144_excerpt)
    ├── download_journal.R  - Copy journal templates to student folders
    ├── download_week.R     - Copy weekly templates to student folders
    ├── final_project.R     - Generate final project folder structure
    ├── listing.R           - Discovery functions (list_courses, list_weeks)
    ├── mccourse_self_test.R - Lightweight template verification
    ├── open_week.R         - Open week folder in file browser
    ├── setup.R             - One-time environment setup
    ├── update.R            - Package update functionality
    ├── utils-paths.R       - Internal path helpers
    └── zzz.R               - Package hooks (.onAttach)

## Key Functions

### User-Facing Functions (Exported)

| Function                                                                                             | Purpose                                | Typical Use                    |
|------------------------------------------------------------------------------------------------------|----------------------------------------|--------------------------------|
| [`mccourse_setup()`](https://sim-lab-siue.github.io/coursepackR/reference/mccourse_setup.md)         | Install Quarto, TinyTeX, core packages | Run once after package install |
| [`mccourse_self_test()`](https://sim-lab-siue.github.io/coursepackR/reference/mccourse_self_test.md) | Verify environment setup               | Diagnose student issues        |
| [`list_courses()`](https://sim-lab-siue.github.io/coursepackR/reference/list_courses.md)             | Show available courses                 | Discovery                      |
| [`list_weeks()`](https://sim-lab-siue.github.io/coursepackR/reference/list_weeks.md)                 | Show available weeks                   | Discovery                      |
| [`download_week()`](https://sim-lab-siue.github.io/coursepackR/reference/download_week.md)           | Copy week template locally             | Get weekly materials           |
| [`download_journal()`](https://sim-lab-siue.github.io/coursepackR/reference/download_journal.md)     | Copy journal template                  | Get journal scaffold           |
| [`open_week()`](https://sim-lab-siue.github.io/coursepackR/reference/open_week.md)                   | Open folder in file browser            | Quick navigation               |
| [`mccourse_update()`](https://sim-lab-siue.github.io/coursepackR/reference/mccourse_update.md)       | Update package to latest               | Stay current                   |
| [`final_project()`](https://sim-lab-siue.github.io/coursepackR/reference/final_project.md)           | Create project structure               | Final submissions              |

### Internal Functions (Not Exported)

All functions in `utils-paths.R` and check functions in `check_env.R`
are internal helpers marked with `@keywords internal`.

## Adding New Course Materials

### Directory Structure

Course materials live in `inst/courses/`:

    inst/courses/
    ├── mc451/
    │   └── weeks/
    │       ├── week_01/
    │       │   ├── chapter_01.qmd
    │       │   └── journal_template_general.qmd
    │       ├── week_02/
    │       └── ...
    └── mc501/
        └── weeks/
            ├── week_01/
            └── ...

### Adding a New Week

1.  Create folder: `inst/courses/<course>/weeks/week_XX/`
2.  Add required files:
    - `chapter_XX.qmd` - Main chapter/assignment
    - `journal_template_general.qmd` - Reflection journal
3.  Optional: Add data files, images, or other resources
4.  Test: `download_week("mc451", XX)`

### Adding a New Course

1.  Create structure: `inst/courses/<new_course>/weeks/`
2.  Add week folders as above
3.  Update documentation in README
4.  Test:
    [`list_courses()`](https://sim-lab-siue.github.io/coursepackR/reference/list_courses.md)
    should show new course

## Working on the Package

### Setup Development Environment

``` r
# Install development tools
install.packages(c("devtools", "roxygen2", "testthat"))

# Load package for development
devtools::load_all()

# Run tests
devtools::test()

# Check package
devtools::check()
```

### Making Changes

1.  **Edit R files** - Add/modify functions in `R/`
2.  **Update docs** - Roxygen2 comments above each function
3.  **Regenerate docs** - `devtools::document()`
4.  **Add tests** - Tests in `tests/testthat/`
5.  **Check** - `devtools::check()` must pass

### Documentation Standards

All functions should have:

``` r
#' Brief one-line description
#'
#' Longer description explaining what the function does,
#' when to use it, and important behaviors.
#'
#' @section Optional Section Name:
#' Additional context or warnings
#'
#' @param param1 Description of parameter
#' @param param2 Description of parameter
#' @return What the function returns
#' @export
#' @examples
#' \dontrun{
#' # Example usage
#' my_function("arg1", "arg2")
#' }
my_function <- function(param1, param2) {
  # Implementation
}
```

Internal functions use `@keywords internal` instead of `@export`.

## Common Maintenance Tasks

### Updating Package Version

1.  Edit `DESCRIPTION` - Increment `Version: X.Y.Z`
2.  Update `CHANGELOG.md` - Document changes
3.  Commit and push
4.  Create GitHub release (if applicable)

### Adding Dependencies

**Imports** (required packages):

    # In DESCRIPTION
    Imports:
        newpackage,
        ...

**Suggests** (optional packages):

    # In DESCRIPTION
    Suggests:
        newpackage,
        ...

Then use: - `newpackage::function()` for explicit calls (preferred) -
`@importFrom newpackage function` in roxygen comments

### Common Issues

#### Students report “course not found”

Check: 1. Course folder exists: `inst/courses/<course>/` 2. Weeks folder
exists: `inst/courses/<course>/weeks/` 3. Week folders match pattern:
`week_01`, `week_02`, etc. 4. Package was rebuilt after adding materials

#### Students can’t install package

Check: 1. All dependencies in DESCRIPTION 2. No syntax errors:
`devtools::check()` 3. GitHub repo is public 4. Students using correct
install command

## Testing

### Manual Testing

``` r
# Test setup
mccourse_setup()

# Test discovery
list_courses()
list_weeks("mc451")

# Test download
temp_dir <- tempdir()
download_week("mc451", 1, dest = temp_dir)
list.files(file.path(temp_dir, "week_01"))

# Test self-check
mccourse_self_test()
```

### Automated Tests

Add tests in `tests/testthat/test-*.R`:

``` r
test_that("list_courses returns character vector", {
  courses <- list_courses()
  expect_type(courses, "character")
  expect_true(length(courses) > 0)
})
```

Run: `devtools::test()`

## Package Philosophy

### Why This Design?

1.  **Bundled Materials** - Students get everything in one install
2.  **Reproducible** - Everyone has same materials, same versions
3.  **Offline Capable** - No internet needed after install
4.  **Version Controlled** - Git tracks material changes
5.  **R Native** - Integrates with existing R/RStudio workflow

### What This Package Should NOT Do

- ❌ Grade assignments
- ❌ Submit assignments
- ❌ Manage student accounts
- ❌ Run complex web services
- ❌ Include heavyweight dependencies

Keep it simple, keep it focused.

## Getting Help

- **Package Issues**: GitHub Issues
- **Maintainer**: <aleith@siue.edu>
- **Documentation**: <https://sim-lab-siue.github.io/coursepackR/>

## Future Improvements

Consider for future versions: - \[ \] Add progress bars for downloads -
\[ \] Support for custom template locations - \[ \] Better handling of
conflicts/overwrites - \[ \] Integration with LMS (Canvas, Blackboard) -
\[ \] Automatic backup before updates - \[ \] More comprehensive tests

------------------------------------------------------------------------

**Last Updated**: January 2025  
**Maintainer**: Dr. Alex P. Leith  
**Status**: Proof of Concept Closure
