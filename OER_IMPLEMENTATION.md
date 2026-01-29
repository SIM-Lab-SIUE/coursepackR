# OER Compliance & Implementation Plan

**Open Educational Resources (OER) Implementation for coursepackR**

Faculty Agreement: Creates original open licensed courseware, implements across all course sections, publishes under Creative Commons BY (or above, Level 4), and maintains for minimum 9 semesters (3 years).

---

## 📋 OER Compliance Checklist

### ✅ License & Attribution (Pre-Implementation)

- [ ] **Book license verified**: "From Vibes to Variables" is published under Creative Commons BY or compatible open license
- [ ] **Attribution plan documented**: How will students and instructors acknowledge the book?
- [ ] **Package license confirmed**: coursepackR code under MIT license
- [ ] **Derivative works license**: All customizations maintain CC-BY or compatible
- [ ] **Copyright clearance**: All images, datasets, examples cleared for educational use or public domain

**Attribution Template** (to appear in README and course materials):
```
This course uses "From Vibes to Variables: A Field Guide to Open Media Science"
[Author(s)] under Creative Commons [License version].

coursepackR template and all original course materials are licensed under CC-BY-4.0.
```

---

### 🎯 Implementation Plan (2 Semesters)

#### Semester 1: Pilot Implementation

**Course(s)**: [List specific courses]  
**Section(s)**: [Number of sections]  
**Instructor(s)**: [Names]  
**Target Enrollment**: [Expected students]  
**Start Date**: [When]

**Deliverables**:
- [ ] Course customization complete (inst/courses/[coursecode]/ populated)
- [ ] DESCRIPTION file updated with correct metadata
- [ ] Weekly materials aligned with book chapters
- [ ] R code examples and starter templates created
- [ ] Datasets prepared and documented
- [ ] Student welcome/setup instructions written
- [ ] README and guides reviewed for clarity
- [ ] Package tested: `remotes::install_github()` works
- [ ] All students can run `mccourse_setup()` successfully
- [ ] LMS access confirmed (course repo link in syllabus)

**Success Metrics**:
- 95%+ student package installation success rate
- <10% drops due to technical barriers
- Average satisfaction rating ≥4/5 on environment setup
- All weekly materials accessible and error-free

**Feedback Collection**:
- Weekly check-ins with instructor
- Anonymous student survey after Week 3, Week 8
- Bug report channel (GitHub issues or email)

---

#### Semester 2: Expansion & Refinement

**Course(s)**: [Original + additional courses if expanding]  
**Section(s)**: [All sections of participating courses]  
**Instructor(s)**: [Original + new instructors if applicable]

**Deliverables**:
- [ ] Incorporate Semester 1 feedback
- [ ] Training materials for new instructors
- [ ] Documentation of customization patterns
- [ ] Troubleshooting guide updated
- [ ] Version bump: 01.00.00 → 01.01.00 (if minor changes)
- [ ] All sections use identical or clearly-documented variations
- [ ] Student data/satisfaction trends documented

**Ongoing Maintenance**:
- [ ] GitHub repository active and monitored
- [ ] Bug fixes deployed within 1 week
- [ ] Semester review cycle established
- [ ] Contributing instructor guide published

---

### 📅 3-Year Sustainability Plan (9+ Semesters)

| Year | Semesters | Milestones | Metrics |
|------|-----------|-----------|---------|
| **1** | S1-2 | Initial implementation + refinement | Adoption in X courses/Y sections |
| | | Book alignment verified | Student satisfaction ≥4/5 |
| | | Feedback systems established | Bug fix response <1 week |
| **2** | S3-4 | Expand to additional instructors/courses | Adoption in X+N courses |
| | | Add supplemental resources | Student retention ↑5% |
| | | Create instructor training program | Instructor satisfaction documented |
| **3** | S5-6 | Assess long-term efficacy | Learning outcome data analyzed |
| | | Plan major version update | GitHub community contributions |
| | | Document lessons learned | Publication/dissemination plan |
| **Ongoing** | S7-9+ | Maintenance & evolution | Continue minimum 9 semesters |

---

## 🔄 Course-Wide Implementation Requirements

### All Course Sections Must Include

1. **Free, open textbook** ("From Vibes to Variables")
   - No paid alternatives required
   - PDF available to all students
   - Hyperlinked in syllabus

2. **coursepackR package** (free via GitHub)
   - Installation documented
   - Technical support available
   - All code and templates included

3. **Free supporting software**
   - R (free, open source)
   - RStudio Desktop (free edition)
   - Quarto (free, open source)
   - Optional: Obsidian (free edition)

4. **No hidden costs**
   - No required textbook purchase
   - No software subscriptions
   - All datasets public or institutional
   - No paywalls for supplemental content

---

## 📊 Evidence of Adoption

### Institutional Commitment

Document the following for the faculty agreement:

**Before Course 1 Starts**:
- [ ] Syllabus explicitly lists book as primary text (with open license statement)
- [ ] Course description mentions OER foundation
- [ ] Bookstore notified: no textbook required for this course
- [ ] Library documentation updated with book link
- [ ] Department approved course as "OER-enabled"

**After Semester 1**:
- [ ] At least X% of students confirmed book access
- [ ] Student feedback survey completed
- [ ] Instructor feedback documented
- [ ] Usage data compiled (GitHub stars, installs, issues)

**After Semester 2** (2-semester commitment):
- [ ] All required course sections using OER materials
- [ ] 2+ instructors independently using coursepackR
- [ ] Training materials published for new instructors
- [ ] Version 1.0 considered stable and documented

---

## 📈 Success Metrics & Data Collection

### Primary Metrics (Track Every Semester)

1. **Adoption Rate**
   - % of course sections using coursepackR
   - Number of active users (students + instructors)
   - Target: 100% of participating sections by Semester 2

2. **Technical Success**
   - % of students successfully installing package
   - % of weeks with materials accessible
   - Target: 95%+ for both

3. **Learning Outcomes**
   - Student performance on weekly assignments
   - Capstone project quality scores
   - Target: Maintain/improve vs. previous non-OER version

4. **Satisfaction**
   - Student confidence in R/RStudio skills
   - Satisfaction with course structure (1-5 scale)
   - Target: ≥4.0/5.0 average

### Secondary Metrics (Track Annually)

1. **Retention**
   - Course completion rate
   - Year-over-year comparison
   - Target: Maintain or increase

2. **Cost Savings**
   - Estimated dollar savings vs. textbook + software
   - Student testimonials about affordability
   - Institutional cost savings (bundle licenses, etc.)

3. **Community**
   - GitHub stars/forks/issues
   - Instructor contributions
   - External adoption (other institutions)

### Data Collection Methods

- **Surveys**: Pre/post course, anonymous, 5-10 questions
- **GitHub**: Automated tracking of installs, stars, issues
- **LMS**: Enrollment, completion, grade distribution
- **Interviews**: Brief conversations with instructors (voluntary)
- **Logging**: Package startup messages record environment stats (optional, privacy-respecting)

---

## 🛠️ Troubleshooting & Support

### Common Implementation Challenges

#### Challenge: "Students have different R/RStudio versions"
**Solution**: 
- `mccourse_self_test()` diagnoses environment
- TROUBLESHOOTING.md covers common version conflicts
- Version requirements clearly documented in DESCRIPTION

#### Challenge: "Some students can't install from GitHub"
**Solution**:
- Fallback: Manual download of .zip from repository
- Instructions in README for offline installation
- IT support can pre-install on lab computers

#### Challenge: "Book chapters don't align perfectly with my course schedule"
**Solution**:
- CURRICULUM_FRAMEWORK.md shows multiple mapping strategies
- Instructors document their chapter order in syllabus
- Flexibility is a feature, not a bug

#### Challenge: "Students don't have time to install tools before Week 1"
**Solution**:
- Pre-course setup workshop (online, optional)
- Setup video walkthrough (15 min)
- IT help desk pre-registers students' environments
- First week focuses on setup, minimal coding

### Support Channels

1. **GitHub Issues**: Technical problems with package
   - Monitored by: [Maintainer name]
   - Response time: <48 hours for bugs
   - Feature requests reviewed quarterly

2. **Email**: Instructor support
   - Monitored by: [Support email]
   - Response time: <1 week for setup questions
   - FAQ maintained from common questions

3. **Slack/Teams** (Optional): Real-time peer support
   - Instructors can establish community channel
   - Students help each other (moderated)

---

## 📝 Documentation Requirements

For successful OER adoption, maintain:

- [ ] **README.md**: Updated with current version, book reference, installation
- [ ] **DESCRIPTION**: Correct metadata, clear Description field
- [ ] **CURRICULUM_FRAMEWORK.md**: Book chapter mapping (this file)
- [ ] **INSTRUCTOR_GUIDE.md**: Step-by-step customization for new instructors
- [ ] **TROUBLESHOOTING.md**: Technical support for common issues
- [ ] **CHANGELOG.md**: Version history and what changed
- [ ] **Course Syllabi**: Explicit OER commitment language (template below)

### Syllabus Language Template

```
## Textbook & Materials

This course uses FREE, OPEN EDUCATIONAL RESOURCES (OER). There is NO 
required textbook purchase.

**Primary Text**: 
"From Vibes to Variables: A Field Guide to Open Media Science" 
[Author] (Creative Commons BY License) - available free online

**Software**:
- R & RStudio (free, open source)
- All course materials via coursepackR package (free GitHub repo)

**Expected Cost**: $0 for books and software
(Optional: computer for coding work if not provided by university)
```

---

## ✋ Faculty Commitment Statement

By implementing coursepackR with "From Vibes to Variables," faculty commits to:

**Original Work**
- [ ] Create original weekly materials aligned with the book
- [ ] Design original assignments and projects
- [ ] Adapt course to my institution's context

**Open Licensing**
- [ ] All materials under Creative Commons BY or compatible
- [ ] Attribution clearly documented
- [ ] No proprietary barriers to student access

**Widespread Implementation**
- [ ] Use in ALL sections of this course within 2 semesters
- [ ] Train other instructors if applicable
- [ ] Document implementation process for others

**Sustainability**
- [ ] Commit to maintaining course for minimum 3 years (9 semesters)
- [ ] Regular feedback collection and improvements
- [ ] Responsive to student and peer feedback
- [ ] Publish results/lessons learned at end of Year 1

**Assessment**
- [ ] Track student learning outcomes
- [ ] Document cost savings for institution
- [ ] Share findings with OER community

---

## 📚 Resources & References

### OER Standards & Guidelines
- [SPARC: Student-Centered Open Education](https://sparcopen.org/)
- [Creative Commons Educational Resources](https://creativecommons.org/about/program-areas/education-oer/)
- [MERLOT: Multimedia Educational Resource for Learning and Online Teaching](https://www.merlot.org/)
- [OpenStax: Free Peer-Reviewed Textbooks](https://openstax.org/)

### R Educational Resources
- [R for Data Science (Hadley Wickham) - Free Online](https://r4ds.had.co.nz/)
- [RStudio Education Resources](https://education.rstudio.com/)
- [Posit Community](https://community.rstudio.com/)

### Course Package Development
- [R Packages (Hadley Wickham) - Free Online](https://r-pkgs.org/)
- [Roxygen2 Documentation](https://roxygen2.r-lib.org/)

---

## 📞 Contact & Governance

**Course Package Maintainer**: [Your name/email]  
**Book License Contact**: [Author/Publisher if applicable]  
**Institution OER Coordinator**: [Name/email if applicable]

**Last Updated**: [Today]  
**Review Cycle**: Annually before each academic year  
**Next Review**: [Date]
