# mccoursepack

[MIT](https://opensource.org/licenses/MIT)

**Author:** Dr. Alex P. Leith ([aleith\@siue.edu](mailto:aleith@siue.edu))\
**Repository:** `https://github.com/sim-lab-siue/mccoursepack/`

------------------------------------------------------------------------

The `mccoursepack` package provides a seamless and user-friendly R/RStudio environment for students in **MC451** and **MC501** at SIUE. 🎓 Its primary goal is to abstract away the complexities of software setup and file management, allowing you to focus on learning data analysis concepts.

The package automates the installation of necessary tools (like Quarto and LaTeX), provides easy access to weekly course materials and journals, and includes self-check and update functions to ensure your environment remains consistent and functional throughout the course.

------------------------------------------------------------------------

## 🚀 Installation

You can install the development version of `mccoursepack` from GitHub with:

``` r
# If you don't have the 'remotes' package, run this first:
# install.packages("remotes")

remotes::install_github("sim-lab-siue/mccoursepack")
```

------------------------------------------------------------------------

## ✨ A Typical Workflow

For a new student, the workflow is straightforward:

1.  **Initial Setup**: Run `mccourse_setup()` once to install all required software and R packages.
2.  **Check Your System**: Run `mccourse_self_test()` to verify that everything is installed correctly.
3.  **Find Your Materials**: Use `list_courses()` and `list_weeks()` to see available materials.
4.  **Download Your Work**: Run `download_week()` or `download_journal()` to copy the template files to your computer.
5.  **Open and Work**: Use `open_week()` to quickly open the folder and start working on your Quarto (`.qmd`) files.
6.  **Stay Updated**: Periodically run `mccourse_update()` to get the latest version of the package and course materials.

------------------------------------------------------------------------

## Functions

This section details the primary functions you will interact with.

### Environment Setup & Verification

#### `mccourse_setup()`

Performs a one-time, automated setup of your system. It's safe to re-run this function if something isn't working correctly.

-   **What it does:**
    -   Installs the **Quarto CLI** for rendering documents.
    -   Installs **TinyTeX**, a lightweight LaTeX distribution for creating PDFs.
    -   Installs essential R packages (`fs`, `rlang`, `cli`, `rstudioapi`).
    -   On Windows, it checks for Rtools and provides installation guidance if it's missing.
-   **Usage:** `r     mccourse_setup()`

#### `mccourse_self_test()`

Runs a series of diagnostic checks to ensure the package and its dependencies are correctly installed and configured. 🩺

-   **What it does:**
    -   Checks for the correct versions of **R** and **RStudio**.
    -   Verifies that **Git** and **Quarto** are installed and accessible.
    -   Confirms that the course templates (`mc451`, `mc501`) are discoverable.
    -   Reports the results in a clean, easy-to-read table.
-   **Usage:** `r     mccourse_self_test()`

### Listing & Downloading Course Materials

#### `list_courses()` & `list_weeks()`

Lists the courses or available weekly material templates bundled within the package.

-   **Usage:**

    ``` r
    list_courses()
    # [1] "mc451" "mc501"

    # List weeks for MC451
    list_weeks(course = "mc451")
    ```

#### `download_week()` & `download_journal()`

Copies the material for a specific week or the course journal into a local directory on your computer. 📁

-   **Arguments:**

    -   `course`: The name of the course (e.g., `"mc451"`).
    -   `week`: The week number (e.g., `1`).
    -   `destdir` (Optional): The destination directory. Defaults to your current working directory.

-   **Usage:**

    ``` r
    # Download week 1 materials for the MC451 course
    download_week(course = "mc451", week = 1)

    # Download the journal for MC451
    download_journal(course = "mc451")
    ```

### Utility Functions

#### `open_week()`

A convenient helper to open a downloaded week's folder in your system's file browser.

-   **Usage:** `r     # After downloading week 1, open its folder     open_week(1)`

#### `mccourse_update()`

Checks for and installs the latest version of the `mccoursepack` package from GitHub.

-   **Usage:** `r     mccourse_update()`

------------------------------------------------------------------------

## 🍩 Included Datasets

This package includes several datasets related to *The Simpsons* for use in examples and assignments.

-   **Available Datasets:** `simpsons_characters.csv`, `simpsons_episodes.csv`, `simpsons_locations.csv`, `simpsons_script_lines.csv`.

-   **How to Access:** The files are bundled within the package. Use the `system.file()` function to get the full, reliable path to a file.

-   **Usage Example:**

    ``` r
    # Get the full path to the characters dataset
    char_path <- system.file("extdata/simpsons/simpsons_characters.csv", package = "mccoursepack")

    # Read the data using readr (part of the tidyverse)
    library(readr)
    simpsons_characters <- read_csv(char_path)

    # View the first few rows
    head(simpsons_characters)
    ```

------------------------------------------------------------------------

## 🗺️ Roadmap & Future Features

This package provides an excellent foundation. Here are some features planned for future versions to enhance its utility.

### For the Student Experience (QoL) ✨

1.  **Interactive Material Downloader**: An interactive function to choose the course and week from a menu.
2.  **Week Reset Function**: A `reset_week()` function to re-download a clean copy of materials.
3.  **Assignment Bundler**: A `bundle_assignment()` function to automatically zip required files for submission.
4.  **Data Helper Function**: A `load_data()` function to simplify access to the included datasets.
5.  **RStudio Project Integration**: Automatically create a self-contained RStudio Project (`.Rproj` file) in each weekly folder.

### For the Instructor/Developer 🛠️

1.  **Course Creation Scaffold**: Exported functions like `create_course()` and `add_week_template()` to help others build courses with this package.
2.  **Comprehensive Course Validator**: An exported `validate_course()` function to check for required files and valid structures.
3.  **Configuration System**: A YAML-based system for instructors to configure package-wide settings.
4.  **Help Function**: A `mccourse_help()` function that opens a URL to the course syllabus or documentation.

------------------------------------------------------------------------

## ⚙️ For Developers: Internal Infrastructure & Testing

### File and Directory Organization

-   Course materials and templates are stored in `inst/courses/`, organized by course (e.g., `mc451`, `mc501`).
-   Example datasets are located in `inst/extdata/simpsons/` as CSV files, accessible via `system.file()`.
-   Utility scripts (e.g., for filename normalization) are in `tools/`.
-   The package includes a script (`scripts/update-chapters.R`) to keep Quarto book chapters in sync with source files.

### Automated Testing

-   The package uses the `testthat` framework for automated testing of all major user-facing functions, ensuring reliability and correctness.
-   Tests cover downloading journals and weeks, listing available materials, and edge cases for empty or missing content.

### Internal Validation and Helpers

-   Internal functions validate the presence and structure of course/week templates and check for required files.
-   Startup and setup helpers ensure that dependencies (Quarto, TinyTeX, Rtools) are available and provide user guidance if not.
-   These internal tools are not exported but are essential for package robustness and future extensibility.