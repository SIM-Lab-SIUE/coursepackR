# Textbook Integration

## The OER Textbook

coursepackR includes “From Vibes to Variables: A Field Guide to Open
Media Science” - a 14-chapter Open Educational Resource (CC-BY) designed
for teaching research methods in communication and social sciences.

## Textbook Structure

The textbook covers:

1.  **Foundations** (Weeks 1-4): Science, publishing, research design
2.  **Literature** (Weeks 5-7): Reviews, engagement, synthesis  
3.  **Data Collection** (Weeks 8-10): Measurement, sampling, methodology
4.  **Analysis** (Weeks 11-14): Variables, testing, interpretation,
    reporting

See `full_textbook.md` for the complete text.

## Integration Approaches

### 1. Core Textbook Course

Use the textbook as your primary text:

- Map chapters directly to weeks (see `CURRICULUM_FRAMEWORK.md`)
- Students read chapters before class
- Weekly labs apply concepts with R

### 2. Supplemental Resource

Complement another primary text:

- Select relevant chapters
- Use as optional readings
- Extract specific sections for topics

### 3. Modular Integration

Mix and match chapters:

- Skip chapters that don’t fit
- Reorder for your curriculum
- Combine with other OER materials

## Example Week Integration

From `inst/courses/template_course/weeks/week_02/`:

``` markdown
---
title: "Week 2: The Publishing Engine"
subtitle: "Setting Up Your Research Toolkit"
---

## This Week's Reading

**Chapter 2**: The Publishing Engine (from course textbook)

## Learning Goals

- Set up R and RStudio environment
- Create your first Quarto document
- Understand reproducible research principles

## Activities

[Lab exercises applying Chapter 2 concepts...]
```

## Customization

The textbook is **CC-BY licensed** - you can:

- [x] Adapt chapters for your context
- [x] Add discipline-specific examples
- [x] Translate to other languages
- [x] Remix with other OER content

**Attribution required**: Credit “AP Leith, coursepackR” when using or
adapting.

## Student Access

Students access the textbook through:

``` r
# View textbook overview
system.file("textbook/README.md", package = "coursepackR")

# Full textbook
system.file("full_textbook.md", package = "coursepackR")
```

## Implementation Resources

- `BOOK_INTEGRATION_WORKSHEET.md` - Planning template for instructors
- `OER_IMPLEMENTATION.md` - Compliance with faculty OER agreements  
- `CURRICULUM_FRAMEWORK.md` - 15-week semester mapping

## Next Steps

Review the example weeks in `inst/courses/template_course/` to see
textbook integration in practice.
