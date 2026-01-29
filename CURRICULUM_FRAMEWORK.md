# Curriculum Framework: *From Vibes to Variables*

**Knowledge Framework for coursepackR OER Implementations**

---

## 📖 About This Document

This framework maps **"From Vibes to Variables: A Field Guide to Open Media Science"** as the core knowledge foundation for coursepackR-based courses. It provides:

- A structured approach to aligning the book with weekly course modules
- Guidance for instructors customizing coursepackR for social science courses
- OER compliance documentation for institutional agreements
- Learning progressions from foundational concepts to applied research

---

## 🎯 Framework Overview

### Intended Audience
- Novice social scientists (undergraduate and graduate)
- Students new to research methods and media/communication science
- Learners transitioning from qualitative intuition ("vibes") to quantitative evidence ("variables")

### OER Compliance
- **License**: Creative Commons (BY or above, Level 4)
- **Adoption Timeline**: Implementation across all course sections within 2 semesters
- **Sustainability**: Minimum 9 semesters (3 years) continuous use
- **Customization**: This framework supports multiple courses using the same book foundation

---

## 📚 Book Structure (To Be Completed)

**Please provide the following information about the book:**

1. **Total chapters/sections**: How many?
2. **Chapter titles and topics**: List the main learning topics
3. **Intended progression**: Is it linear, modular, or thematic?
4. **Target page count per chapter**: For pacing guidance
5. **Key learning outcomes per chapter**: What should students know after each?

### Example Structure (Update as needed):

| Chapter | Title | Key Topics | Target Week(s) |
|---------|-------|-----------|-----------------|
| 1 | [Ch 1 Title] | [Topics] | Week 1-2 |
| 2 | [Ch 2 Title] | [Topics] | Week 3-4 |
| ... | ... | ... | ... |

---

## 🗺️ Mapping Strategy: Book → Course Package

### Step 1: Chapter-to-Week Alignment

Each chapter (or section) maps to a course week:

```
Book Chapter 1 (e.g., "Introduction to Open Science")
    ↓
inst/courses/yourcoursecode/weeks/week_01/
    ├── 01-reading-guide.qmd       (Points to specific book sections)
    ├── 01-assignment.qmd           (Apply concepts from Chapter 1)
    ├── starter_code.R              (Practical implementation)
    └── data.csv                    (Example dataset)
```

### Step 2: Learning Outcome Alignment

For each week, map:

- **Book content** → Core reading
- **In-class activities** → Discussion, live coding, small group work
- **Assignments** → Application/practice
- **Tools** → R/RStudio + optional Obsidian workflow
- **Assessments** → Quizzes, projects, journals

### Step 3: Progressive Scaffolding

The book provides conceptual foundation; coursepackR provides:

1. **Weeks 1-3**: Foundational concepts (book chapters 1-2)
   - Goal: Students understand the "why" behind research methods
   - Activities: Reading, discussion, journal reflections
   - Tools: RStudio orientation

2. **Weeks 4-8**: Methodological deep-dives (book chapters 3-5)
   - Goal: Students can design and conduct studies
   - Activities: Hands-on data analysis, code-along sessions
   - Tools: R workflows, Obsidian note-taking

3. **Weeks 9-14**: Applied projects (book chapters 6+)
   - Goal: Students execute independent research
   - Activities: Project development, peer review, troubleshooting
   - Tools: Full R/RStudio + GitHub for collaboration

4. **Final**: Capstone/synthesis (across all chapters)
   - Goal: Integration of concepts and methods
   - Activities: Final project, presentation, reflection
   - Tools: All course tools synthesized

---

## 📋 Weekly Structure Template

For each week with book alignment:

```markdown
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

---

## 🛠️ Implementation Checklist

### Before Course Starts
- [ ] Confirm book chapters and structure with author/publisher
- [ ] Create week-by-week reading guide mapping chapters to schedule
- [ ] Draft learning outcomes for each week
- [ ] Prepare data examples that align with book themes
- [ ] Create R code templates demonstrating book concepts

### For Each Course Offering
- [ ] Customize course metadata in `DESCRIPTION`
- [ ] Set up `inst/courses/<coursecode>/weeks/` structure
- [ ] Create `.qmd` files for each week with book-aligned content
- [ ] Develop assignments scaffolding book concepts
- [ ] Test all code examples and data workflows

### Documentation
- [ ] README: Note book as core framework
- [ ] INSTRUCTOR_GUIDE: Include book-mapping section
- [ ] Course syllabus: Explicit book coverage schedule
- [ ] License: Verify Creative Commons compliance

---

## 🎓 OER Compliance Checklist

### Licensing Requirements
- [x] Package uses Open License (MIT for package code)
- [ ] Book is under Creative Commons BY or above
- [ ] All derivative materials maintain compatible licenses
- [ ] Attribution visible in README and course materials

### Adoption Requirements (2-Semester Window)
- [ ] Implemented in [Course 1] - Semester [Year]
- [ ] Implemented in [Course 2] - Semester [Year]
- [ ] All section instructors trained on customization
- [ ] Student access verified in LMS

### Sustainability Requirements (3-Year Minimum)
- [ ] Year 1: Establish usage baseline
- [ ] Year 2: Expand to additional courses/sections
- [ ] Year 3: Integrate student feedback, prepare for renewal
- [ ] Ongoing: Git repository maintained with contributions documented

---

## 📖 Knowledge Map: Conceptual Progression

(To be filled based on book structure)

### Foundational Layer
**Concepts**: [From book chapters 1-2]
- Understanding research ethics
- Qualitative vs. quantitative methods
- [Your foundational concepts]

### Methodological Layer
**Concepts**: [From book chapters 3-5]
- Study design
- Data collection
- Statistical analysis
- [Your methodology concepts]

### Application Layer
**Concepts**: [From book chapters 6+]
- Project execution
- Interpretation and communication
- Reproducibility
- [Your application concepts]

### Integration Layer
**Capstone**: Students synthesize across all layers in final project

---

## 🔗 Integration with coursepackR Functions

### setup.R / mccourse_setup()
Customize welcome message to highlight book foundation:
```r
"Welcome to [Course]! This course uses 'From Vibes to Variables' as our 
research methods foundation. You'll apply concepts from the book through 
hands-on R/RStudio projects each week."
```

### download_week()
Each week's materials include:
- Link to relevant book chapter(s)
- Reading guide
- Code examples implementing book concepts
- Application assignment

### download_journal()
Reflection template connects:
- Weekly book readings
- Personal research interests
- R/programming skill development
- Synthesis across weeks

---

## ✏️ Customization Instructions for Instructors

### Minimal Customization (Use As-Is)
If adopting book chapter order:
1. Clone coursepackR
2. Create `inst/courses/yourcode/` directory
3. Copy week templates from provided examples
4. Update course metadata in `DESCRIPTION`
5. Assign book chapters per week in syllabus

### Moderate Customization (Reorder Topics)
If rearranging book chapters to match your pedagogy:
1. Create curriculum map: book chapter → your week
2. Develop modified `.qmd` templates per week
3. Update learning outcomes to match your institution
4. Create data examples aligned with reordered topics
5. Document changes in README

### Advanced Customization (Multiple Books)
If combining "From Vibes to Variables" with other texts:
1. Clearly delineate which content comes from which source
2. Ensure license compatibility across materials
3. Update attribution accordingly
4. Test student access to all integrated materials

---

## 📞 Support & Questions

**For implementation help**:
- See INSTRUCTOR_GUIDE.md for step-by-step customization
- Reference template_course/ for example structure
- Check GitHub issues for common questions

**For book-related questions**:
- [Book repository/website to be added]
- [Author contact to be added]

---

## 📝 Version History

| Date | Version | Changes |
|------|---------|---------|
| [Today] | 1.0 | Initial framework for "From Vibes to Variables" integration |

---

**Last Updated**: [Today]  
**Framework Maintainer**: [Your Name]  
**License**: CC-BY (matching book) for documentation + framework; MIT for coursepackR code
