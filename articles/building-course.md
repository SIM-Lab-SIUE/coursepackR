# Building Your Course

## Course Structure

coursepackR provides a flexible template for building R-based course
packages. The recommended structure:

    your-course-package/
    ├── inst/
    │   ├── courses/
    │   │   └── your_course/
    │   │       ├── README.md
    │   │       └── weeks/
    │   │           ├── week_01/
    │   │           ├── week_02/
    │   │           └── ...
    │   ├── textbook/
    │   │   └── README.md
    │   └── instructor/
    │       └── teaching_notes.md

## Creating Your Course

1.  **Copy the template course**:

``` r
# In your R package
dir.create("inst/courses/my_course", recursive = TRUE)
```

2.  **Create weekly directories**:

``` r
for (week in 1:15) {
  week_dir <- sprintf("inst/courses/my_course/weeks/week_%02d", week)
  dir.create(week_dir, recursive = TRUE)
}
```

3.  **Add Quarto documents** for each week with learning materials

## Example Week Structure

Each week directory typically contains:

- `week_XX.qmd` - Main learning document
- `worksheet.qmd` - Student activities (optional)
- `data/` - Week-specific datasets (optional)
- `images/` - Visual resources (optional)

## Student Access Functions

Students access materials using:

``` r
# Download a week's materials
download_week(course = "my_course", week = 1)

# Open a week directly in RStudio
open_week(course = "my_course", week = 1)

# List available weeks
list_weeks(course = "my_course")
```

## Instructor Resources

Place instructor-only materials in `inst/instructor/`:

- Teaching notes
- Answer keys
- Grading rubrics
- Assessment materials

## Next Steps

- See [Textbook
  Integration](https://sim-lab-siue.github.io/coursepackR/articles/textbook-integration.md)
  for incorporating OER content
- Review `inst/courses/template_course/` for a complete example
- Read `CURRICULUM_FRAMEWORK.md` for pedagogical guidance
