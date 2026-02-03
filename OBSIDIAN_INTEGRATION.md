# Obsidian + RStudio Integration Guide

`coursepackR` is designed to create a **unified research and coding
workflow** where students seamlessly move between Obsidian (for research
notes) and RStudio (for analysis and writing).

------------------------------------------------------------------------

## 🎯 Why Obsidian + RStudio?

### The Research Gap

Traditional workflows separate research from coding: - Literature →
notes in Word/OneNote - Thinking → scattered emails or handwritten
notes  
- Analysis → R scripts (disconnected from notes) - Writing → Separate
document

### The Unified Workflow

With Obsidian + RStudio integration: - **Research notes** in Obsidian
vault - **Bidirectional links** between notes and code - **RStudio
projects** linked to vault - **Citation workflow** that bridges notes →
analysis → writing

**Student quote**: *“I can see exactly which papers informed my
analysis. My code and notes are in sync.”*

------------------------------------------------------------------------

## 📁 Directory Structure Setup

### Option 1: Separate Folders (Recommended for Simple Setup)

    ~/Documents/
    ├── MyUniversity-vault/          ← Obsidian vault (sync across devices)
    │   ├── literature/
    │   │   ├── smith2023.md         ← Research notes with links
    │   │   └── jones2022.md
    │   ├── projects/
    │   │   └── stat101-notes.md
    │   └── .obsidian/               ← Obsidian config
    │
    └── stat101-coursepack/          ← RStudio project
        ├── week_01/
        │   ├── analysis.R           ← Can reference ../MyUniversity-vault/...
        │   └── analysis.qmd
        ├── week_02/
        └── README.md

### Option 2: Vault Inside RStudio Project (Advanced)

    ~/Documents/stat101-coursepack/     ← RStudio project
    ├── .obsidian_vault/                ← Obsidian vault nested
    │   ├── literature/
    │   ├── .obsidian/
    │   └── ...
    ├── R/                              ← R code
    ├── data/                           ← Data files
    └── notes/                          ← Course notes

**When to use this**: Multi-user courses or shared class vaults.

------------------------------------------------------------------------

## 🚀 Getting Started: Step-by-Step

### For Students (Week 1)

#### Step 1: Install Obsidian

Download from [obsidian.md](https://obsidian.md) (free).

#### Step 2: Create Research Vault

1.  Open Obsidian → “Create new vault”
2.  Name it: `MyUniversity-Research`
3.  Choose location: `~/Documents/MyUniversity-Research`
4.  Click “Create”

#### Step 3: Install coursepackR

``` r
remotes::install_github("yourusername/mystat-coursepack")
```

#### Step 4: Download First Week

``` r
download_week("mystat101", 1)
```

#### Step 5: Link RStudio to Obsidian (Optional)

Create a `.md` file in your vault that references your RStudio project:

`~/MyUniversity-Research/courses/stat101.md`:

``` markdown
# Statistics 101 - Course Notes

**RStudio Project Location**: `~/Documents/stat101-coursepack/`

## Week 1: Getting Started

See also: [[smith2023]] (Chapter 2 on R basics)

### Key Concepts
- Data types
- Vectors
- Functions

### Code Examples
See `week_01/starter_code.R` in RStudio project.
```

Then in your RStudio code, add comments linking back:

`week_01/analysis.R`:

``` r
# See [[smith2023]] in Obsidian vault for background
# Location: ~/MyUniversity-Research/literature/smith2023.md

library(tidyverse)

# Week 1 Analysis
df <- read_csv("data.csv")
...
```

------------------------------------------------------------------------

## 📚 Workflow Examples

### Example 1: Literature Review → Analysis

#### In Obsidian

`literature/smith2023.md`:

``` markdown
# Smith et al. 2023
Reference: Smith, J., et al. (2023). "Statistical Methods for..."

## Key Findings
- Finding 1: Bootstrapping is robust for sample sizes > 30
- Finding 2: Bayesian methods more interpretable when...

## Related Notes
- [[datascienceessentials]]
- [[week_02_hypothesis_testing]]

## Code Connections
- Implementation: `mystat101:week_05/bootstrap_analysis.R`
```

#### In RStudio

`week_05/bootstrap_analysis.R`:

``` r
# Based on Smith et al. 2023 - see Obsidian vault
# ~/MyUniversity-Research/literature/smith2023.md

library(tidyverse)

# Bootstrap resampling (Smith et al. recommendation for n > 30)
set.seed(42)
bootstrap_samples <- map_dfc(1:1000, ~sample(df$measurement, replace = TRUE))

# Result shows Finding 1 is correct for this dataset
```

### Example 2: Code → Findings → Writing

#### RStudio Output

``` r
# analysis.R produces:
# - p-value: 0.042
# - effect size: 0.58
```

#### Update Obsidian

`projects/stat101-findings.md`:

``` markdown
# Stat 101 Final Project Findings

## ANOVA Results
- **p-value**: 0.042 ✓ Significant at α=0.05
- **Effect size (η²)**: 0.58 (medium-to-large effect)

See `week_14/final_project.R` for code.

## Interpretation
Following [[cohen_effectsizes]], this is a medium-to-large effect.

## Write-up Draft
See also: `thesis_draft.qmd` for full writeup.
```

------------------------------------------------------------------------

## 🔗 Creating Effective Links

### Wikilink Format (Obsidian Native)

In any `.md` file:

``` markdown
# My Analysis

Based on [[smith2023]] and [[bayesian_methods]].

This relates to [[week_03_distributions]].

See code: `myproject:week_04/analysis.R`
```

### Footnote-Style References

`analysis.qmd`:

``` r
#' @references 
#' Inspired by Smith et al. (2023) - see ~/vault/literature/smith2023.md

library(tidyverse)

# Bootstrap analysis...
```

------------------------------------------------------------------------

## 💡 Best Practices

### Do ✓

- **Link liberally**: One link per paragraph connects ideas
- **Timestamp finding**: Note dates and version numbers of code
- **Keep vault synced**: Use cloud sync (iCloud, OneDrive) to access on
  multiple devices
- **Version your analysis**: Use git in RStudio project + date stamps in
  notes
- **Create index notes**: Have a “Courses” note linking to each course
  vault

### Don’t ✗

- **Don’t put code IN Obsidian**: Links to code are better
- **Don’t duplicate**: Link to source instead of copying
- **Don’t ignore backlinks**: Use Obsidian’s “Backlinks” pane to see
  connections
- **Don’t mix courses**: Create separate vaults or sub-folders per
  course

------------------------------------------------------------------------

## 🛠️ Customization for Instructors

### Option A: Provide a Starter Vault

Create `inst/extdata/obsidian-starter-vault.zip` with: - Example
structure - 3-4 sample literature notes - Links template

Then guide students: *“Download and unzip this vault to get started.”*

### Option B: Obsidian Community Plugins (Advanced)

Students can enhance with plugins: - **Better Word Count**: See word
count targets - **Calendar**: Daily notes for journal entries -
**Periodic Notes**: Weekly reflection templates - **Citation Plugins**:
Zotero integration

Mention in `INSTRUCTOR_GUIDE.md`:

``` markdown
### Optional Obsidian Setup

Students can enhance with community plugins:
1. Open Obsidian → Settings → Community Plugins → Browse
2. Search "Calendar" and install
3. Search "Periodic Notes" and install

Then use `journal_entry_template.md` in the calendar pane.
```

### Option C: Linked Journal Entries

Create weekly journal templates that reference Obsidian:

`inst/templates/journal_week_01.qmd`:

``` yaml
---
title: "Week 1 Reflection"
subtitle: "Connect your Obsidian notes with your analysis"
---

## What I Learned
See your notes in `~/MyUniversity-Research/courses/stat101.md`

## Key Insight from This Week's Reading
[[Insert link to literature note here]]

## How I'll Apply This
- In code: See `week_01/analysis.R`
- In future weeks: ...
```

------------------------------------------------------------------------

## 📊 Assessment Ideas Using Obsidian+RStudio

### Option 1: Analytical Thinking (50%) + Code Quality (50%)

**Analytical Thinking** (Grade in Obsidian): - Quality of literature
review - Depth of hypothesis development - Link density (are ideas
connected?) - Reflection quality

**Code Quality** (Grade in RStudio): - Correctness - Clarity and
documentation - Efficiency - Reproducibility

### Option 2: Integration Grade

Students are graded partly on **how well they’ve connected their
Obsidian vault to their RStudio project**:

- Literature review notes link to analysis code ✓
- Code comments reference vault notes ✓
- Analysis findings are documented in vault ✓
- Final write-up synthesizes notes + code ✓

------------------------------------------------------------------------

## 🚨 Troubleshooting

**Q: Students can’t find the Obsidian vault**

A: In instructor guide, be explicit:

    1. Open Obsidian
    2. Click "Open folder as vault"
    3. Navigate to ~/Documents/MyUniversity-Research
    4. Click "Open"

**Q: Cross-linking between vault and RStudio breaks**

A: Use **relative paths** in links:

``` markdown
❌ Bad: See `/Users/alice/Documents/coursepack/week_01/analysis.R`
✓ Good: See `coursepack/week_01/analysis.R` or use [[analysis]]
```

**Q: Some students don’t want to use Obsidian**

A: That’s OK! The coursepackR core functions work without Obsidian. It’s
*optional* enhancement for research-heavy courses.

**Q: How do students sync vault across devices?**

A: Recommend: - iCloud Drive (Mac/iPad): Save vault to
`~/Library/Mobile Documents/com~apple~CloudDocs/` - OneDrive (Windows):
Save vault to `~/OneDrive/` - Synology, Nextcloud, etc. for self-hosted
options

⚠️ Note: Obsidian Sync (paid service) is an alternative.

------------------------------------------------------------------------

## 🎓 Example Integration by Course Type

### Quantitative Methods (Most Suited)

- Literature review in Obsidian
- Method selection documented
- Data analysis in RStudio with comments linking to vault notes
- Results interpreted with vault references
- Final write-up synthesizes all

### Qualitative Methods

- Interview notes in Obsidian
- Code development linked between vault and RStudio
- Thematic analysis documented in both places
- Final write-up ties themes to code

### Mixed Methods

- Separate vaults for quant/qual components
- Master index note bridging both
- RStudio scripts reference both vault sections

------------------------------------------------------------------------

## 🚀 Next Steps

1.  **Try it yourself**: Create a test vault + RStudio project
2.  **Document your approach**: Add to `INSTRUCTOR_GUIDE.md` with your
    customization
3.  **Share with students**: Week 1 guide on vault setup + linking
4.  **Iterate**: Ask for feedback on what works/doesn’t

This creates a **cohesive research-to-publication workflow** where your
students’ thinking and code are finally in sync.

------------------------------------------------------------------------

## Resources

- **Obsidian**: <https://obsidian.md>
- **Obsidian Help**: <https://help.obsidian.md>
- **Academic Writing Tips**: <https://www.andymatuschak.org/>
- **Reproducible Research**: <https://happygitwithr.com>

------------------------------------------------------------------------

**Questions or suggestions?** This feature is new—share your
implementation ideas!
