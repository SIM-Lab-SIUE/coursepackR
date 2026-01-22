# Changelog - mccoursepack

All notable changes to this project will be documented in this file.

## [01.14.10] - 2025-01-22 - Proof of Concept Closure

### Major Refactoring and Cleanup

This version represents a comprehensive audit and refactoring for proof of concept closure.

#### Removed
- **R/list_weeks.R** - Duplicate file removed (functions already existed in R/listing.R)
- **R/validate_weeks.R** - Unused validation code removed (never called in package)

#### Fixed
- **DESCRIPTION** - Added `tibble` to Suggests (was used but not declared)
- **DESCRIPTION** - Improved package description for clarity
- **DESCRIPTION** - Reorganized Imports/Suggests for consistency

#### Documentation Improvements
- **All R files** - Added comprehensive file-level header comments explaining purpose
- **All R files** - Added detailed function annotations with usage examples
- **All functions** - Enhanced roxygen2 documentation with sections, examples, and notes
- **Internal functions** - Added clear @keywords internal tags and explanations

#### Code Quality
- **R/check_env.R** - Enhanced inline comments explaining diagnostic checks
- **R/utils-paths.R** - Documented internal path helper functions
- **R/listing.R** - Clarified list_courses() and list_weeks() logic
- **R/download_week.R** - Added extensive inline comments for file copying logic
- **R/zzz.R** - Documented package hooks and startup behavior
- **R/data.R** - Enhanced dataset documentation with disclaimer and examples

#### Files Annotated
1. check_env.R - Environment diagnostics
2. data.R - Package datasets
3. utils-paths.R - Path utilities
4. listing.R - Course/week discovery
5. download_week.R - Template downloading
6. download_journal.R - Journal scaffold downloading
7. open_week.R - File browser integration
8. zzz.R - Package hooks
9. mccourse_self_test.R - Template verification
10. setup.R - Initial environment setup
11. update.R - Package update management
12. final_project.R - Project scaffold creation

### Package Structure

The package is organized as follows:

```
mccoursepack/
├── R/                          # All R source code
│   ├── check_env.R            # Environment diagnostic functions
│   ├── data.R                 # Dataset documentation
│   ├── download_journal.R     # Journal template downloading
│   ├── download_week.R        # Weekly template downloading
│   ├── final_project.R        # Final project scaffold
│   ├── listing.R              # Course/week discovery
│   ├── mccourse_self_test.R   # Template verification
│   ├── open_week.R            # File browser helper
│   ├── setup.R                # Environment setup
│   ├── update.R               # Package updates
│   ├── utils-paths.R          # Path utilities
│   └── zzz.R                  # Package hooks
├── data/                       # Package datasets
├── inst/                       # Installed files
│   └── courses/               # Course materials
│       ├── mc451/             # MC 451 materials
│       └── mc501/             # MC 501 materials
├── man/                        # Documentation files
├── tests/                      # Unit tests
└── site/                       # Website source
```

### For Future Maintainers

This package is designed as a teaching tool for MC 451 and MC 501 at SIUE. Key points:

1. **Course Materials** - Stored in `inst/courses/<course>/weeks/week_XX/`
2. **Path Utilities** - All path logic is centralized in `utils-paths.R`
3. **User Workflow** - Setup → Self-test → List → Download → Open
4. **Dependencies** - Minimal by design; only essential packages in Imports

### Known Limitations

- tibble used in check_env.R but not essential (in Suggests)
- Final project scaffold (final_project.R) may need review for actual use
- Package assumes RStudio for optimal experience (not required)

### Testing

Run checks with:
```r
devtools::check()
devtools::test()
```

### Contact

Maintainer: Dr. Alex P. Leith (aleith@siue.edu)
Repository: https://github.com/sim-lab-siue/mccoursepack/
