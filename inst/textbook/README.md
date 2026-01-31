# Textbook: From Vibes to Variables

**Original OER Foundation for coursepackR**

## About the Textbook

"From Vibes to Variables: A Field Guide to Open Media Science" is the core knowledge framework for courses built with coursepackR. It teaches novice social scientists how to:

- Transform qualitative observations ("vibes") into quantitative variables
- Conduct reproducible content analysis research
- Use R, RStudio, Quarto, and Git for research workflows
- Combine journalism's narrative instincts with scientific rigor

## Textbook Location

The complete textbook is available at:
- **Repository**: `full_textbook.md` (root directory)
- **Format**: Markdown source file
- **License**: Creative Commons BY (Original OER)

## Chapter Structure (15-Week Semester)

See [CURRICULUM_FRAMEWORK.md](../../CURRICULUM_FRAMEWORK.md) for complete chapter-to-week mapping.

### Quick Reference

| Week | Chapter | Focus |
|------|---------|-------|
| 1 | Ch 1: Science of Storytelling | Research as narrative |
| 2 | Ch 2: Publishing Engine | R/RStudio/Quarto setup |
| 3 | Case Study: Webcam Analysis | Example study |
| 4 | Ch 3: Scientific Approach | Ethics & methodology |
| 5 | Ch 4: Intelligence Gathering | Literature review |
| 6 | Ch 5: Theory as Lens | Theoretical framing |
| 7 | Ch 6: Project Brief | Research prospectus |
| 8 | Ch 7: Structured Listening | Ethnographic observation |
| 9 | Ch 8: Vibes to Variables | Operationalization |
| 10 | Ch 9: The Rulebook | Codebook development |
| 11 | Ch 10: The Sample | Data collection |
| 12 | Ch 11: Wrangling Data | tidyverse & cleaning |
| 13 | Ch 12: Visualizing Narrative | Descriptive stats/ggplot |
| 14 | Ch 13: Making the Call | Inferential statistics |
| 15 | Ch 14: One-Click Report | Quarto publication |

## How Instructors Use This

When you customize coursepackR for your course, you'll:

1. **Assign reading**: Direct students to specific chapters in `full_textbook.md`
2. **Create assignments**: Design `.qmd` files in `inst/courses/[yourcode]/weeks/` that apply chapter concepts
3. **Scaffold code**: Provide R starter scripts demonstrating techniques from the book
4. **Assess learning**: Create rubrics aligning with chapter learning objectives

## Example Week Structure

```
inst/courses/mycourse101/weeks/week_01/
├── README.md                    # Points to textbook Ch 1
├── 01-reading-guide.md          # Key questions from chapter
├── 01-assignment.qmd            # Apply Ch 1 concepts
├── starter_code.R               # Optional R template
└── rubric.md                    # Assessment criteria
```

## Integration with R Functions

The textbook assumes students use coursepackR functions:

- `coursepack_setup()` — Install R packages and configure environment (Ch 2)
- `download_week()` — Access weekly materials (All chapters)
- `list_courses()`, `list_weeks()` — Navigate course structure (All chapters)
- `download_journal()` — Reflection templates (Optional, all chapters)

## Textbook Philosophy

The book treats **research as storytelling with evidence**:

- Every chapter has **narrative framing** (not just formulas)
- Examples come from **media/communication** (Twitch, social media, online communities)
- Students build **one complete project** across the semester (not isolated exercises)
- **Code is integrated** (not supplementary)—research = code + narrative

## OER Compliance

- **Textbook**: Original OER, Creative Commons BY
- **Course materials you create**: Must also be CC-BY or compatible
- **Combined work**: Eliminates all paid textbooks and software
- See [OER_IMPLEMENTATION.md](../../OER_IMPLEMENTATION.md) for institutional requirements

## For Students

If you're a student using this book:

1. Install R, RStudio, Quarto (see Chapter 2)
2. Install your course's package: `remotes::install_github("yourprof/coursepackname")`
3. Run `coursepack_setup()` to configure your environment
4. Access each week's materials with `download_week(course="yourcode", week=1)`
5. Read the corresponding textbook chapter (your instructor will specify)
6. Complete the assignment applying chapter concepts

## For Instructors

See these guides for implementation:

- [CURRICULUM_FRAMEWORK.md](../../CURRICULUM_FRAMEWORK.md) — Chapter-to-week planning
- [INSTRUCTOR_GUIDE.md](../../INSTRUCTOR_GUIDE.md) — Package customization
- [BOOK_INTEGRATION_WORKSHEET.md](../../BOOK_INTEGRATION_WORKSHEET.md) — Planning template
- [OER_IMPLEMENTATION.md](../../OER_IMPLEMENTATION.md) — Faculty agreement compliance

---

**Questions?** Open an issue on the coursepackR repository or contact the package maintainer.
