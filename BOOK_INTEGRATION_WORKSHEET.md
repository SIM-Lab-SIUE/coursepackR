# Book Integration Worksheet

**Customize this worksheet for your specific course and book chapters**

Print this document and fill it in as you plan your course, or edit it
in your preferred editor.

------------------------------------------------------------------------

## Part 1: Book Information

**Book Title**: From Vibes to Variables: A Field Guide to Open Media
Science

**Author(s)**: \[Fill in: Author names\]

**Publisher/Source**: \[Fill in: Where is the book published? Is it
openly available?\]

**License**: \[Fill in: CC-BY, CC-BY-SA, or other? Confirm it’s open.\]

**Total Chapters/Sections**: \[Fill in: How many chapters? How are they
organized?\]

**Book URL** (if available online): \[Fill in: Where can students access
the free version?\]

------------------------------------------------------------------------

## Part 2: Course Structure

**Course Code**: \[Fill in: e.g., MC451, STAT101\]

**Course Title**: \[Fill in: Your course name\]

**Semester/Term Offered**: \[Fill in: Spring 2026, Fall 2025, etc.\]

**Number of Weeks**: \[Fill in: 15, 14, 10, etc.\]

**Class Meets**: \[Fill in: MW 1-3pm, TTh 2-4pm, etc.\]

**Delivery Mode**: \[ \] Synchronous in-person  
\[ \] Synchronous hybrid  
\[ \] Synchronous online  
\[ \] Asynchronous online

**Expected Enrollment**: \[Fill in: ~20, ~100, unknown?\]

------------------------------------------------------------------------

## Part 3: Book Chapter → Course Week Mapping

**Instructions**: For each week of your course, identify which book
chapter(s) students will read. Fill in the table below.

**Example:** \| Week \| Dates \| Book Chapter \| Title \| Key Topics \|
Reading Pages \| Assignment \|
\|——\|——-\|————-\|——-\|———–\|—————\|———–\| \| 1 \| Jan 15-21 \| Ch 1 \|
Introduction to Open Science \| What is replication? Why R? \| pp. 1-25
\| Read Ch 1, install R \|

**Your Mapping:**

| Week | Dates | Book Chapter | Title | Key Topics | Reading Pages | Assignment |
|------|-------|--------------|-------|------------|---------------|------------|
| 1    |       |              |       |            |               |            |
| 2    |       |              |       |            |               |            |
| 3    |       |              |       |            |               |            |
| 4    |       |              |       |            |               |            |
| 5    |       |              |       |            |               |            |
| 6    |       |              |       |            |               |            |
| 7    |       |              |       |            |               |            |
| 8    |       |              |       |            |               |            |
| 9    |       |              |       |            |               |            |
| 10   |       |              |       |            |               |            |
| 11   |       |              |       |            |               |            |
| 12   |       |              |       |            |               |            |
| 13   |       |              |       |            |               |            |
| 14   |       |              |       |            |               |            |
| 15   |       |              |       |            |               |            |

------------------------------------------------------------------------

## Part 4: Learning Outcomes per Week

**Instructions**: For each week, write what students should be able to
do after completing the book reading and course activities.

### Week 1

**Book Chapter(s)**: \[From Part 3\]

Learning Outcomes - Students will: - \[ \] - \[ \] - \[ \]

### Week 2

**Book Chapter(s)**: \[From Part 3\]

Learning Outcomes - Students will: - \[ \] - \[ \] - \[ \]

\[Continue for each week…\]

------------------------------------------------------------------------

## Part 5: Assessment & Assignments

For each book chapter (or group of chapters), plan:

### Chapter X: \[Title\]

**Weeks Covered**: \[Week numbers\]

**In-Class Activities**: - \[ \] Lecture/discussion of \[topic\] - \[ \]
Live coding demonstration - \[ \] Small group discussion - \[ \] Other:
\[describe\]

**Assignment 1 Title**: \[What will students do?\] - Type: \[ \] Coding
exercise \[ \] Written reflection \[ \] Quiz \[ \] Project - Due: Week
\[X\] - Connection to book: \[How does this assignment apply the book
concepts?\] - Files needed: \[.qmd template, data file, starter code,
etc.\]

**Assignment 2 Title**: \[What will students do?\] - Type: \[ \] Coding
exercise \[ \] Written reflection \[ \] Quiz \[ \] Project - Due: Week
\[X\] - Connection to book: \[How does this assignment apply the book
concepts?\] - Files needed: \[.qmd template, data file, starter code,
etc.\]

\[Continue for each chapter…\]

------------------------------------------------------------------------

## Part 6: R Code & Data Examples

**Instructions**: List examples from the book that you’ll implement in
R.

### Chapter X: \[Title\]

**Example 1**: \[Description from book\] - Book pages: \[XX-XX\] - R
concept needed: \[What should students learn?\] - Code file:
`week_0X_example1.R` - Data file: \[If applicable\] - Expected output:
\[What should students produce?\]

**Example 2**: \[Description from book\] - Book pages: \[XX-XX\] - R
concept needed: \[What should students learn?\] - Code file:
`week_0X_example2.R` - Data file: \[If applicable\] - Expected output:
\[What should students produce?\]

\[Continue…\]

------------------------------------------------------------------------

## Part 7: Data Sources & Preparation

**Instructions**: For each week, identify data you’ll use for examples
and assignments.

| Week | Chapter | Dataset Name | Source | Size | How to Access | Preprocessing Needed? |
|------|---------|--------------|--------|------|---------------|-----------------------|
| 1    | Ch 1    |              |        |      |               |                       |
| 2    | Ch 2    |              |        |      |               |                       |
| …    | …       |              |        |      |               |                       |

**Notes on data**: - \[ \] All datasets are free/public domain or have
permission for educational use - \[ \] Datasets demonstrate concepts
from book clearly - \[ \] Datasets are accessible to students without
additional software - \[ \] Data dictionary created for each dataset
(column names, types, values)

------------------------------------------------------------------------

## Part 8: File Structure for Your Course Package

**Instructor**: Use this to plan the `inst/courses/` directory
structure.

    inst/courses/[YOURCOURSECODE]/
    ├── README.md                          ← Start here
    ├── SYLLABUS.md                        ← Link to your syllabus
    ├── weeks/
    │   ├── week_01/
    │   │   ├── 01-reading-guide.md       ← Points to book chapter XX
    │   │   ├── 01-assignment.qmd         ← Students submit this
    │   │   ├── starter_code.R            ← Partial code for students
    │   │   ├── data.csv                  ← Example data
    │   │   └── rubric.md                 ← Grading rubric (optional)
    │   ├── week_02/
    │   │   └── [same structure]
    │   └── ...
    └── journal/
        └── reflection_template.qmd       ← Weekly reflection (optional)

------------------------------------------------------------------------

## Part 9: Integration Checklist

Before your course starts:

Book access confirmed for all students (free URL, PDF, or library)

`DESCRIPTION` file updated with your course info

`README.md` customized for your institution

`inst/courses/[yourcode]/` directory created and populated

All weekly `.qmd` files reference correct book chapters

All starter code files tested and working

All data files accessible and documented

Syllabus mentions book prominently (with link)

Package installs successfully:
`remotes::install_github("yourrepo/yourpackage")`

[`mccourse_setup()`](https://sim-lab-siue.github.io/coursepackR/reference/mccourse_setup.md)
runs without errors

[`list_courses()`](https://sim-lab-siue.github.io/coursepackR/reference/list_courses.md)
and
[`list_weeks()`](https://sim-lab-siue.github.io/coursepackR/reference/list_weeks.md)
show your course correctly

`download_week(course="[yourcode]", week=1)` works

Students can access Week 1 materials after installation

------------------------------------------------------------------------

## Part 10: Faculty Commitment Statement

**By completing this worksheet and implementing this course, I commit
to:**

Publishing this course as open educational resources (Creative Commons
BY or above)

Using the book and coursepackR across ALL sections of this course

Maintaining this course for minimum 9 semesters (3 years)

Collecting feedback and making annual improvements

Responding to student issues within 48 hours (or designating backup
support)

Sharing lessons learned with the OER community

------------------------------------------------------------------------

**Faculty Name**: \[Fill in\]

**Email**: \[Fill in\]

**Institution**: \[Fill in\]

**Date Completed**: \[Fill in\]

**Planned Course Start**: \[Fill in\]

------------------------------------------------------------------------

## Resources

See the following for more guidance:

- **[CURRICULUM_FRAMEWORK.md](https://sim-lab-siue.github.io/CURRICULUM_FRAMEWORK.md)**
  — Detailed guidance on book integration
- **[INSTRUCTOR_GUIDE.md](https://sim-lab-siue.github.io/INSTRUCTOR_GUIDE.md)**
  — Step-by-step customization
- **[OER_IMPLEMENTATION.md](https://sim-lab-siue.github.io/OER_IMPLEMENTATION.md)**
  — Licensing and compliance
- **[template_course/](https://sim-lab-siue.github.io/template_course/)**
  — Example structure you can copy

**Questions?** Email \[Support contact\] or open an issue on GitHub.
