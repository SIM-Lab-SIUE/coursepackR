# Template Course: From Vibes to Variables

**Example Implementation of coursepackR with Textbook Integration**

## Purpose

This `template_course` directory demonstrates how to structure a course using coursepackR with "From Vibes to Variables" as the foundational textbook. Use this as a model when creating your own course package.

## Structure

```
template_course/
├── README.md                    ← You're here
├── SYLLABUS.md                  ← (Create your syllabus here)
├── weeks/
│   ├── week_01/                 ← Chapter 1: Science of Storytelling
│   ├── week_02/                 ← Chapter 2: Publishing Engine
│   ├── week_09/                 ← Chapter 8: Vibes to Variables
│   └── [weeks 03-15 to be created by instructor]
└── journal/
    └── reflection_template.qmd  ← Optional weekly reflection
```

## Example Weeks Included

We've provided three complete example weeks that demonstrate different pedagogical approaches:

### Week 1: Conceptual Foundation
**Textbook**: Chapter 1 - The Science of Storytelling

**Assignment Type**: Reading comprehension + critical analysis
- Students identify narrative elements in research abstracts
- Transform anecdotes into research questions
- Reflect on cognitive bias

**No coding required** - focuses on conceptual framework.

### Week 2: Technical Setup
**Textbook**: Chapter 2 - The Publishing Engine

**Assignment Type**: Hands-on R/RStudio/Quarto tutorial
- Students install software
- Execute basic R code
- Create their first reproducible document
- Understand one-click philosophy

**Introduces R basics** through simple dataset manipulation.

### Week 9: Applied Methodology
**Textbook**: Chapter 8 - From Vibes to Variables

**Assignment Type**: Project milestone (operationalization)
- Students define variables for their semester project
- Test code real examples
- Simulate data structure in R

**Combines theory + practice** as part of cumulative project.

## Progression Philosophy

The three examples show the textbook's pedagogical arc:

1. **Week 1**: Narrative/conceptual (why research matters)
2. **Week 2**: Technical/foundational (tools for reproducibility)
3. **Week 9**: Applied/methodological (designing your own study)

This pattern repeats: **concept → tool → application**.

## Creating Your Own Weeks

For each chapter (weeks 3-8, 10-15), create:

### Minimal Structure
```
week_XX/
└── XX-assignment.qmd     # One assignment file
```

### Recommended Structure
```
week_XX/
├── README.md             # Overview of week's goals
├── XX-reading-guide.md   # Key questions from textbook chapter
├── XX-assignment.qmd     # Main assignment (students submit this)
├── starter_code.R        # Optional: R template with TODO comments
├── data_example.csv      # Optional: Sample data
└── rubric.md             # Optional: Grading criteria
```

### Advanced Structure
```
week_XX/
├── README.md
├── XX-reading-guide.md
├── XX-lab.qmd            # In-class activity
├── XX-assignment.qmd     # Take-home assignment
├── XX-quiz.qmd           # Optional: Auto-graded checks
├── starter_code.R
├── solution_code.R       # For instructor reference
├── data_example.csv
├── rubric.md
└── slides.qmd            # Optional: Quarto presentation
```

## Chapter-to-Week Mapping (15-Week Semester)

| Week | Chapter | Assignment Focus | Coding Level |
|------|---------|------------------|--------------|
| 1 | Ch 1: Science of Storytelling | Reading comprehension | None |
| 2 | Ch 2: Publishing Engine | R/RStudio setup | Basic |
| 3 | Case: Webcam & Engagement | Study walkthrough | Intermediate |
| 4 | Ch 3: Scientific Approach | Ethics, IRB | None |
| 5 | Ch 4: Intelligence Gathering | Literature review | None/Zotero |
| 6 | Ch 5: Theory as Lens | Theoretical framing | None |
| 7 | Ch 6: Project Brief | Draft prospectus | None |
| 8 | Ch 7: Structured Listening | Ethnography | None |
| 9 | Ch 8: Vibes to Variables | Operationalization | Intermediate |
| 10 | Ch 9: The Rulebook | Codebook | Intermediate |
| 11 | Ch 10: The Sample | Data collection | Basic |
| 12 | Ch 11: Wrangling Data | tidyverse | Advanced |
| 13 | Ch 12: Visualizing Narrative | ggplot2 | Advanced |
| 14 | Ch 13: Making the Call | Inferential stats | Advanced |
| 15 | Ch 14: One-Click Report | Final publication | Advanced |

## Customization Checklist

When adapting this template for YOUR course:

### Step 1: Course Metadata
- [ ] Rename directory: `template_course` → `yourcourse101`
- [ ] Create `SYLLABUS.md` with your course policies
- [ ] Update `README.md` with your course information
- [ ] Decide if you'll use journal reflections (optional)

### Step 2: Weekly Content
- [ ] Review provided examples (weeks 1, 2, 9)
- [ ] Create remaining weeks (3-8, 10-15)
- [ ] Ensure each week points to correct textbook chapter
- [ ] Test that all `.qmd` files render successfully
- [ ] Add your own datasets/examples where appropriate

### Step 3: Assessment Design
- [ ] Decide point values for each assignment
- [ ] Create rubrics for major assignments
- [ ] Design final project milestones (typically weeks 7, 9, 10, 15)
- [ ] Optional: Add quizzes or in-class activities

### Step 4: Student Resources
- [ ] Create "Getting Started" guide for Week 1
- [ ] Provide installation troubleshooting FAQ
- [ ] Link to textbook location (`full_textbook.md`)
- [ ] Set up office hours/support channels

## Assignment Types Throughout Semester

The textbook progression supports different assignment types:

**Weeks 1-6: Conceptual/Planning**
- Reading reflections
- Literature reviews
- Theoretical analysis
- Project proposals

**Weeks 7-11: Methodological/Coding**
- Codebook development
- Pilot testing
- Data collection
- Reliability checks

**Weeks 12-15: Analytical/Writing**
- Data wrangling
- Statistical analysis
- Visualization
- Final report writing

## Integration with coursepackR Functions

Students use these functions to access materials:

```r
# List all available courses
list_courses()

# List weeks for your course
list_weeks(course = "yourcourse101")

# Download Week X materials
download_week(course = "yourcourse101", week = 1)

# Optional: Download reflection template
download_journal(course = "yourcourse101")
```

Ensure your directory structure follows `inst/courses/[coursename]/weeks/week_XX/` pattern so these functions work.

## Common Pitfalls to Avoid

### ❌ Don't Do This:
1. **Skipping weeks**: Every week 1-15 should have a folder
2. **Inconsistent naming**: Mix of `week_1`, `Week01`, `wk_one` breaks auto-discovery
3. **Missing textbook references**: Students should always know which chapter to read
4. **Code without explanation**: R chunks need narrative context
5. **No test-rendering**: Always render `.qmd` files before assigning to students

### ✅ Do This:
1. **Complete sequence**: week_01 through week_15 (or week_10 for quarters)
2. **Zero-padded naming**: `week_01`, `week_02`, ..., `week_15`
3. **Clear learning objectives**: Every assignment states what students will achieve
4. **Gradual complexity**: Early weeks have more scaffolding, later weeks more independence
5. **Test everything**: Click "Render" on every file before pushing to GitHub

## Student Experience

When students install your course package and run:

```r
download_week(course = "yourcourse101", week = 1)
```

They get a folder containing:
- The assignment file (`.qmd`)
- Any data files
- Any starter code
- Any supplemental materials (rubrics, guides)

They:
1. Open the `.qmd` in RStudio
2. Read the textbook chapter specified
3. Complete the assignment by editing the `.qmd`
4. Click "Render" to generate HTML
5. Submit both `.qmd` and `.html`

This workflow is **identical across all 15 weeks**, creating consistency.

## For Instructors: Testing Your Course

Before students arrive:

```r
# Install your package locally
devtools::install()

# Test discovery
list_courses()
list_weeks(course = "yourcourse101")

# Test each week
for (week in 1:15) {
  download_week(course = "yourcourse101", week = week)
  # Check that files appear in your project directory
}
```

## Questions?

See these guides:
- [CURRICULUM_FRAMEWORK.md](../../CURRICULUM_FRAMEWORK.md) - Detailed chapter mapping
- [INSTRUCTOR_GUIDE.md](../../INSTRUCTOR_GUIDE.md) - Package customization
- [BOOK_INTEGRATION_WORKSHEET.md](../../BOOK_INTEGRATION_WORKSHEET.md) - Planning template

---

**This template is OER**: CC-BY 4.0  
**Adapt freely** for your institution and students!
