# Curriculum Framework: From Vibes to Variables

**Original OER Courseware Knowledge Framework for coursepackR**

------------------------------------------------------------------------

## 📖 About This Document

This framework guides faculty in **creating original open educational
courseware** using “From Vibes to Variables: A Field Guide to Open Media
Science” as the conceptual foundation.

### What This Framework Provides

- **Original courseware design**: Templates for creating YOUR unique
  weekly assignments
- **Book integration strategy**: How to align faculty-created materials
  with book concepts
- **OER compliance guidance**: Ensures all original work meets
  institutional requirements
- **Learning scaffolds**: Progressive skill-building across weeks (your
  design)

### Important Distinction

- **The Book** = Existing OER providing conceptual foundation (reading
  material)
- **Your Courseware** = Original assignments, code, rubrics, tutorials
  you create
- **Combined Course** = Free alternative to paid textbook + software
  courses

This satisfies “creation of original OER” because the weekly
implementation, R scaffolding, assessment design, and pedagogical
integration are all faculty-created intellectual work.

------------------------------------------------------------------------

## 🎯 Framework Overview

### Intended Audience

- Novice social scientists (undergraduate and graduate)
- Students new to research methods and media/communication science
- Learners transitioning from qualitative intuition (“vibes”) to
  quantitative evidence (“variables”)

### OER Compliance

- **License**: Creative Commons (BY or above, Level 4)
- **Adoption Timeline**: Implementation across all course sections
  within 2 semesters
- **Sustainability**: Minimum 9 semesters (3 years) continuous use
- **Customization**: This framework supports multiple courses using the
  same book foundation

------------------------------------------------------------------------

## 📚 Book Structure: “From Vibes to Variables”

**Complete Chapter Listing**

The textbook contains **14 chapters** organized in a linear,
project-based progression where students build a complete research study
from initial observation to publication-ready report.

### Chapter Overview

| Week | Chapter | Title                          | Core Concepts                                              | Research Phase           |
|------|---------|--------------------------------|------------------------------------------------------------|--------------------------|
| 1    | Ch 1    | The Science of Storytelling    | Narrative framework, hypothesis testing, anecdote vs. data | Foundation               |
| 2    | Ch 2    | The Publishing Engine          | R, RStudio, Quarto, Git, reproducibility                   | Tools Setup              |
| 3    | Case    | Webcam Use & Viewer Engagement | Example study walkthrough                                  | Model Study              |
| 4    | Ch 3    | The Scientific Approach        | Ethics, epistemology, scientific method                    | Methodology              |
| 5    | Ch 4    | Intelligence Gathering         | Literature review, archival research                       | Background Research      |
| 6    | Ch 5    | Theory as a Lens               | Theoretical frameworks, uses & gratifications              | Theory Selection         |
| 7    | Ch 6    | The Project Brief              | Research prospectus, project planning                      | Project Design           |
| 8    | Ch 7    | Structured Listening           | Ethnographic observation, community norms                  | Data Collection Planning |
| 9    | Ch 8    | From Vibes to Variables        | Operationalization, variable definition                    | Measurement              |
| 10   | Ch 9    | The Rulebook                   | Codebook construction, reliability                         | Coding System            |
| 11   | Ch 10   | The Sample                     | Sampling strategies, pilot testing                         | Data Collection          |
| 12   | Ch 11   | Wrangling the Data             | Data cleaning, tidyverse, SQL                              | Data Preparation         |
| 13   | Ch 12   | Visualizing the Narrative      | Descriptive statistics, ggplot2                            | Exploratory Analysis     |
| 14   | Ch 13   | Making the Call                | Inferential statistics, hypothesis testing                 | Statistical Testing      |
| 15   | Ch 14   | The One-Click Report           | Quarto publishing, portfolio creation                      | Dissemination            |

### Pedagogical Progression

**Weeks 1-3: Foundation & Orientation** - Students understand research
as structured storytelling - Set up reproducible workflow tools
(R/RStudio/Quarto/Git) - Analyze a complete example study to see the end
goal

**Weeks 4-7: Conceptual Framework** - Learn scientific method and
research ethics - Conduct literature review and theoretical framing -
Draft project prospectus (what they’ll study all semester)

**Weeks 8-11: Data Collection & Coding** - Operationalize “vibes” into
measurable variables - Build codebook with reliability checks - Collect
sample data through content analysis

**Weeks 12-14: Analysis & Interpretation** - Clean and wrangle data into
tidy format - Create descriptive visualizations - Run inferential tests
to answer research questions

**Week 15: Publication** - Assemble one-click Quarto report - Publish
portfolio to GitHub Pages - Present findings to class

------------------------------------------------------------------------

## 🗺️ Mapping Strategy: Book → Course Package

### Step 1: Chapter-to-Week Alignment

Each chapter (or section) maps to a course week:

    Book Chapter 1 (e.g., "Introduction to Open Science")
        ↓
    inst/courses/yourcoursecode/weeks/week_01/
        ├── 01-reading-guide.qmd       (Points to specific book sections)
        ├── 01-assignment.qmd           (Apply concepts from Chapter 1)
        ├── starter_code.R              (Practical implementation)
        └── data.csv                    (Example dataset)

### Step 2: Learning Outcome Alignment

For each week, map:

- **Book content** → Core reading
- **In-class activities** → Discussion, live coding, small group work
- **Assignments** → Application/practice
- **Tools** → R/RStudio + optional Obsidian workflow
- **Assessments** → Quizzes, projects, journals

### Step 3: Progressive Scaffolding

The book provides conceptual foundation; coursepackR provides:

1.  **Weeks 1-3**: Foundational concepts (book chapters 1-2)
    - Goal: Students understand the “why” behind research methods
    - Activities: Reading, discussion, journal reflections
    - Tools: RStudio orientation
2.  **Weeks 4-8**: Methodological deep-dives (book chapters 3-5)
    - Goal: Students can design and conduct studies
    - Activities: Hands-on data analysis, code-along sessions
    - Tools: R workflows, Obsidian note-taking
3.  **Weeks 9-14**: Applied projects (book chapters 6+)
    - Goal: Students execute independent research
    - Activities: Project development, peer review, troubleshooting
    - Tools: Full R/RStudio + GitHub for collaboration
4.  **Final**: Capstone/synthesis (across all chapters)
    - Goal: Integration of concepts and methods
    - Activities: Final project, presentation, reflection
    - Tools: All course tools synthesized

------------------------------------------------------------------------

## 📋 Weekly Structure Template

For each week with book alignment:

``` markdown
# Week 1: [Book Chapter 1 Title]

## Learning Outcomes
- Students will understand [concept from Ch 1]
- Students will be able to [apply concept from Ch 1]

## Readings
- **Book**: Chapter 1, pages XX-XX
- **Supplemental**: [Optional additional resources]

## In-Class Activities
1. Interactive discussion of key concepts
2. Live coding example from book concepts
3. Group activity applying Chapter 1 ideas

## Assignment
- Reading reflection journal (Obsidian or Quarto template)
- Hands-on coding task using `starter_code.R`
- Short written response connecting book to personal research interests

## Data & Resources
- Dataset: `week_01_data.csv`
- Code skeleton: `starter_code.R`
- Rubric: `week_01_rubric.md`

## Assessment
- Participation in discussion: 10%
- Coding assignment completion: 20%
- Reflection journal entry: 10%
```

------------------------------------------------------------------------

## 🛠️ Implementation Checklist

### Before Course Starts

Confirm book chapters and structure with author/publisher

Create week-by-week reading guide mapping chapters to schedule

Draft learning outcomes for each week

Prepare data examples that align with book themes

Create R code templates demonstrating book concepts

### For Each Course Offering

Customize course metadata in `DESCRIPTION`

Set up `inst/courses/<coursecode>/weeks/` structure

Create `.qmd` files for each week with book-aligned content

Develop assignments scaffolding book concepts

Test all code examples and data workflows

### Documentation

README: Note book as core framework

INSTRUCTOR_GUIDE: Include book-mapping section

Course syllabus: Explicit book coverage schedule

License: Verify Creative Commons compliance

------------------------------------------------------------------------

## 🎓 OER Compliance Checklist

### Licensing Requirements

Package uses Open License (MIT for package code)

Book is under Creative Commons BY or above

All derivative materials maintain compatible licenses

Attribution visible in README and course materials

### Adoption Requirements (2-Semester Window)

Implemented in \[Course 1\] - Semester \[Year\]

Implemented in \[Course 2\] - Semester \[Year\]

All section instructors trained on customization

Student access verified in LMS

### Sustainability Requirements (3-Year Minimum)

Year 1: Establish usage baseline

Year 2: Expand to additional courses/sections

Year 3: Integrate student feedback, prepare for renewal

Ongoing: Git repository maintained with contributions documented

------------------------------------------------------------------------

## 📖 Knowledge Map: Conceptual Progression

(To be filled based on book structure)

### Foundational Layer

**Concepts**: \[From book chapters 1-2\] - Understanding research
ethics - Qualitative vs. quantitative methods - \[Your foundational
concepts\]

### Methodological Layer

**Concepts**: \[From book chapters 3-5\] - Study design - Data
collection - Statistical analysis - \[Your methodology concepts\]

### Application Layer

**Concepts**: \[From book chapters 6+\] - Project execution -
Interpretation and communication - Reproducibility - \[Your application
concepts\]

### Integration Layer

**Capstone**: Students synthesize across all layers in final project

------------------------------------------------------------------------

## 🔗 Integration with coursepackR Functions

### setup.R / mccourse_setup()

Customize welcome message to highlight book foundation:

``` r
"Welcome to [Course]! This course uses 'From Vibes to Variables' as our 
research methods foundation. You'll apply concepts from the book through 
hands-on R/RStudio projects each week."
```

### download_week()

Each week’s materials include: - Link to relevant book chapter(s) -
Reading guide - Code examples implementing book concepts - Application
assignment

### download_journal()

Reflection template connects: - Weekly book readings - Personal research
interests - R/programming skill development - Synthesis across weeks

------------------------------------------------------------------------

## ✏️ Customization Instructions for Instructors

### Minimal Customization (Use As-Is)

If adopting book chapter order: 1. Clone coursepackR 2. Create
`inst/courses/yourcode/` directory 3. Copy week templates from provided
examples 4. Update course metadata in `DESCRIPTION` 5. Assign book
chapters per week in syllabus

### Moderate Customization (Reorder Topics)

If rearranging book chapters to match your pedagogy: 1. Create
curriculum map: book chapter → your week 2. Develop modified `.qmd`
templates per week 3. Update learning outcomes to match your institution
4. Create data examples aligned with reordered topics 5. Document
changes in README

### Advanced Customization (Multiple Books)

If combining “From Vibes to Variables” with other texts: 1. Clearly
delineate which content comes from which source 2. Ensure license
compatibility across materials 3. Update attribution accordingly 4. Test
student access to all integrated materials

------------------------------------------------------------------------

## 📞 Support & Questions

**For implementation help**: - See INSTRUCTOR_GUIDE.md for step-by-step
customization - Reference template_course/ for example structure - Check
GitHub issues for common questions

**For book-related questions**: - \[Book repository/website to be
added\] - \[Author contact to be added\]

------------------------------------------------------------------------

## 📝 Version History

| Date      | Version | Changes                                                     |
|-----------|---------|-------------------------------------------------------------|
| \[Today\] | 1.0     | Initial framework for “From Vibes to Variables” integration |

------------------------------------------------------------------------

**Last Updated**: \[Today\]  
**Framework Maintainer**: \[Your Name\]  
**License**: CC-BY (matching book) for documentation + framework; MIT
for coursepackR code
