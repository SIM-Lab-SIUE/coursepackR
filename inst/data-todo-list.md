Here is the comprehensive plan, R code, and three-week set of QMD labs to teach your course using the Pew Research Center data, all while adhering to the provided Terms of Use.

-----

## 1\. Steps to Include Data in a Course R Package

Based on the Pew Research Center's "Terms of Use" you provided, there is a critical limitation in **Section 13**:

> "...any reproduction, display, distribution... of the Data is limited to excerpts and may not be reproduced... in full or substantially in full;"

This means you **cannot** bundle the *full* dataset inside a distributable R package.

The best approach for an educational package is to create a *clean, representative excerpt* of the data and include that. This is good for teaching, as it's smaller and less overwhelming for students.

### Steps to Create the Package

1.  **Create an Excerpt Script:** Use the R script from Part 2 (below) to load the full `.sav` file, clean it, and then create a smaller, excerpted data frame. For example, you might select 10-15 key variables and 500-1000 random rows.

2.  **Set Up the Package:** In RStudio, create a new project: `File > New Project > New Directory > R Package`.

3.  **Add Data to the Package:**

      * Save your clean, excerpted data frame (e.g., `pew_spring_2024_excerpt`) to the `data/` folder within your package structure.
      * Run `usethis::use_data(pew_spring_2024_excerpt, overwrite = TRUE)` from the console. This compresses the data into the `data/` folder and makes it available to users when they load your package.

4.  **Add Dependencies:** In the `DESCRIPTION` file, add `dplyr`, `ggplot2`, `tidyr`, `readr`, `broom`, `haven`, and `skimr` to the `Imports:` section.

5.  **Document the Data (CRITICAL):**

      * Run `usethis::use_r("data")`. This creates an `R/data.R` file.
      * In this file, you *must* add the required documentation, citation, and disclaimer.

    **Example `R/data.R` file:**

    ```r
    #' Excerpt from Pew Research Center Global Attitudes Spring 2024 Survey
    #'
    #' A dataset containing an excerpt of 1,000 respondents and 15 variables
    #' from the Pew Research Center Global Attitudes Spring 2024 Survey.
    #' This excerpt is for educational purposes only.
    #'
    #' @format A data frame with 1000 rows and 15 variables:
    #' \describe{
    #'   \item{country}{Respondent's country}
    #'   \item{age}{Respondent's age}
    #'   \item{gender}{Respondent's gender}
    #'   \item{education}{Respondent's education level}
    #'   \item{ideology}{Respondent's political ideology}
    #'   \item{view_us}{Favorable/unfavorable view of the U.S.}
    #'   \item{view_china}{Favorable/unfavorable view of China}
    #'   \item{conf_biden}{Confidence in U.S. President Biden}
    #'   \item{conf_putin}{Confidence in Russian President Putin}
    #'   \item{conf_xi}{Confidence in Chinese President Xi}
    #'   \item{econ_sit}{View of the country's economic situation}
    #'   ...
    #' }
    #'
    #' @source
    #' Pew Research Center, "Global Attitudes Spring 2024 Dataset."
    #' Pew Research Center, Washington, D.C. (May 2024)
    #' https://www.geeksforgeeks.org/data-science/what-is-dataset/
    #'
    #' @section Disclaimer:
    #' Pew Research Center bears no responsibility for the analyses or
    #' interpretations of the data presented here. The opinions expressed
    #' herein, including any implications for policy, are those of the
    #' author and not of Pew Research Center.
    "pew_spring_2024_excerpt"
    ```

-----

## 2\. Full R Code to Prepare Data

This R script will load the raw `.sav` file, clean it, and create a final, tidy data frame. Using the `.sav` file is **highly recommended** over the CSV, as it contains all the variable and value labels (e.g., it knows `1 = "Favorable"`), which saves massive amounts of manual recoding.

```r
# ===================================================================
# PREPARE PEW GLOBAL ATTITUDES (SPRING 2024) DATA FOR COURSE
#
# This script loads the raw .sav file, selects key variables,
# renames them, recodes missing values, and creates new
# factor and composite variables for analysis.
# ===================================================================

# --- 1. Load Packages ---
# install.packages(c("tidyverse", "haven", "skimr"))
library(tidyverse)
library(haven) # For reading .sav files
library(skimr) # For quick summaries

# --- 2. Load Raw Data ---
# Note: This file must be in your RStudio project directory
raw_file <- "Pew Research Center Global Attitudes Spring 2024 Dataset.sav"

# read_sav() imports the .sav file and preserves all its metadata
pew_raw <- read_sav(raw_file)

# Let's inspect a variable to see the labels
# print(pew_raw$Q1A_US)
# You'll see <labelled<double>[...]> with value labels
# [1] Favorable, [2] Unfavorable, [8] DK, [9] Refused

# --- 3. Clean and Transform Data ---

# We will select a handful of variables for the class
# and perform all cleaning and wrangling steps.
pew_clean <- pew_raw %>%
  #
  # PHASE 1: SELECT AND RENAME
  #
  select(
    # Demographics
    country = COUNTRY,
    age = DEM2_AGE,
    gender = DEM1_GENDER,
    education = DEM5_EDU,
    ideology = DEM10_IDEOLOGY,

    # Key Survey Items
    view_us = Q1A_US,
    view_china = Q1B_CHINA,
    conf_biden = Q10A_BIDEN,
    conf_putin = Q10C_PUTIN,
    conf_xi = Q10B_XI,
    econ_sit = ECON_SIT,
    tech_effect = TECH_EFFECT,
    us_influence = Q5A_US
  ) %>%
  #
  # PHASE 2: CLEANING (Missing Data & Recoding)
  #
  mutate(
    # `zap_missing()` converts Pew's "Don't Know" (8/98) and
    # "Refused" (9/99) codes (which are tagged as missing) into NA.
    # We apply this to all selected variables.
    across(everything(), haven::zap_missing),

    # Convert key categorical variables to factors
    # `as_factor()` uses the embedded labels from the .sav file
    country = as_factor(country),
    gender = as_factor(gender),
    education = as_factor(education),

    # Recode `view_...` variables to be simple factors
    view_us = as_factor(view_us),
    view_china = as_factor(view_china),

    # Recode `ideology` into a clean 3-level factor
    # The original has 5 levels. We'll simplify.
    ideology = case_when(
      ideology == 1 ~ "Left",
      ideology == 2 ~ "Left",
      ideology == 3 ~ "Center",
      ideology == 4 ~ "Right",
      ideology == 5 ~ "Right",
      TRUE ~ NA_character_ # All other values (incl. NA)
    ),

    # Convert ordinal scales to numeric for analysis
    # We must use `as.numeric()` here, NOT `as_factor()`.
    # Lower numbers = more confidence/better econ.
    conf_biden = as.numeric(conf_biden),
    conf_putin = as.numeric(conf_putin),
    conf_xi = as.numeric(conf_xi),
    econ_sit = as.numeric(econ_sit),
    us_influence = as.numeric(us_influence)
  ) %>%
  #
  # PHASE 3: TRANSFORMING (Creating New Variables)
  #
  mutate(
    # Create a composite score for "Confidence in Authoritarian Leaders"
    # We'll average the scores for Putin and Xi.
    # na.rm = TRUE is crucial!
    conf_authoritarian = rowMeans(
      select(., conf_putin, conf_xi),
      na.rm = TRUE
    ),

    # Create age categories (a "binned" variable)
    age_group = cut(
      age,
      breaks = c(17, 29, 49, 64, Inf),
      labels = c("18-29", "30-49", "50-64", "65+"),
      right = TRUE
    ),
    
    # Reverse code the influence variable so high = more influence
    # Original: 1=Getting stronger, 2=Getting weaker, 3=Same
    # We'll make it: 1=Getting weaker, 2=Same, 3=Getting stronger
    us_influence_recode = recode(us_influence,
                                 `1` = 3,
                                 `3` = 1,
                                 `2` = 2)
  )

# --- 4. Inspect the Clean Data ---
cat("--- Clean Data Summary --- \n")
skim(pew_clean)

cat("\n--- Ideology Frequency Table --- \n")
print(table(pew_clean$ideology, useNA = "ifany"))

# --- 5. Create Excerpt and Save Files ---

# For the R package (adhering to Terms of Use)
# We take a random sample of 1000 respondents
set.seed(1234) # For reproducibility
pew_spring_2024_excerpt <- pew_clean %>%
  slice_sample(n = 1000)

# Save the data for the R package
# Run `usethis::use_data(pew_spring_2024_excerpt, overwrite = TRUE)`
# from the console *if you are in an R package project*.
# For now, we'll save it as a local file.
save(pew_spring_2024_excerpt,
     file = "pew_spring_2024_excerpt.rda")

# Save the FULL clean dataset for students to use in labs
# (Assuming they have all downloaded the raw file and
# have a right to use it per the Terms of Use)
write_csv(pew_clean, "pew_spring_2024_clean.csv")

cat("\nSuccessfully created 'pew_spring_2024_clean.csv' (full data)
and 'pew_spring_2024_excerpt.rda' (package excerpt).\n")

# ===================================================================
# REQUIRED CITATION AND DISCLAIMER
#
# **Citation:**
# Pew Research Center, "Global Attitudes Spring 2024 Dataset."
# Pew Research Center, Washington, D.C. (May 2024) [URL]
#
# **Disclaimer:**
# Pew Research Center bears no responsibility for the analyses or
# interpretations of the data presented here. The opinions expressed
# herein, including any implications for policy, are those of the
# author and not of Pew Research Center.
# ===================================================================
```

-----

## 3\. Three Weeks of Lab Lesson QMDs

Here are the three Quarto (QMD) files for your student labs. Each one builds on the last, using the variables we just prepared.

### Week 1 Lab: Data Wrangling (Chapter 12)

````qmd
---
title: "Lab 1: Data Wrangling with Pew Research Data"
subtitle: "From Raw Information to Meaningful Insight"
format: html
editor: visual
---

> **Required Citation:**
> Pew Research Center, "Global Attitudes Spring 2024 Dataset."
> Pew Research Center, Washington, D.C. (May 2024) [URL]
>
> **Required Disclaimer:**
> Pew Research Center bears no responsibility for the analyses or interpretations of the data presented here. The opinions expressed herein, including any implications for policy, are those of the author and not of Pew Research Center.

## Introduction

This lab follows **Chapter 12: Data Wrangling**. Our goal is to take a "messy" real-world dataset (the Pew Global Attitudes survey) and transform it into a "clean" and "tidy" format that is ready for analysis. We will follow the three-phase data processing pipeline:

1.  **Importing**
2.  **Cleaning**
3.  **Transforming**

## 1. Setup: Load Packages

First, we load the `tidyverse` and `haven` packages. `haven` is a special package for reading data from other stats programs like SPSS (`.sav`).

```{r load-packages, message=FALSE, warning=FALSE}
library(tidyverse)
library(haven)
````

## 2\. Phase 1: Importing Data

We will load the raw `.sav` file. This format is much better than the CSV because it includes *value labels* (e.g., it knows `1 = "Favorable"`) and *missing value* definitions.

```{r load-data}
# Make sure the .sav file is in the same folder as this QMD file
pew_raw <- read_sav("Pew Research Center Global Attitudes Spring 2024 Dataset.sav")

# Let's "interview" the data, as Chapter 12 suggests
# glimpse() is the best way to do this
glimpse(pew_raw)
```

## 3\. Phase 2: Cleaning Data

The raw data has 288 variables with names like `Q10A_BIDEN`. This is messy. Our "cleaning" stage will involve selecting only the variables we need, renaming them, and handling missing values.

```{r clean-data}
pew_clean <- pew_raw %>%
  #
  # A. Select only the columns we want
  #
  select(
    country = COUNTRY,
    age = DEM2_AGE,
    gender = DEM1_GENDER,
    education = DEM5_EDU,
    ideology = DEM10_IDEOLOGY,
    view_us = Q1A_US,
    conf_biden = Q10A_BIDEN,
    conf_putin = Q10C_PUTIN,
    conf_xi = Q10B_XI
  ) %>%
  #
  # B. Handle Missing Data
  #
  mutate(
    # `haven::zap_missing()` converts the special Pew codes
    # (like 8="DK", 9="Refused") into proper 'NA' values
    across(everything(), haven::zap_missing)
  ) %>%
  #
  # C. Standardize and Recode
  #
  mutate(
    # `as_factor()` converts numeric codes to text labels
    country = as_factor(country),
    gender = as_factor(gender),
    view_us = as_factor(view_us),
    
    # We can also recode variables manually.
    # Let's simplify the 5-point ideology scale.
    ideology_simple = case_when(
      ideology == 1 ~ "Left",
      ideology == 2 ~ "Left",
      ideology == 3 ~ "Center",
      ideology == 4 ~ "Right",
      ideology == 5 ~ "Right",
      TRUE ~ NA_character_ # Assign NA to all others
    ),
    
    # For scales we want to average, we must convert to numeric
    conf_biden = as.numeric(conf_biden),
    conf_putin = as.numeric(conf_putin),
    conf_xi = as.numeric(conf_xi)
  )

# Let's inspect our new, clean data
glimpse(pew_clean)
```

## 4\. Phase 3: Transforming Data

Now we create new variables from our clean data, as discussed in Chapter 12.

### A. Create a New Variable (Composite Score)

Let's create an "authoritarian\_confidence" score by averaging the confidence scores for Putin and Xi.

```{r transform-composite}
pew_final <- pew_clean %>%
  mutate(
    # `rowMeans()` calculates the mean for each person (row)
    # `na.rm = TRUE` is vital! It ignores missing values.
    conf_authoritarian = rowMeans(
      select(., conf_putin, conf_xi),
      na.rm = TRUE
    )
  )

# Look at the new variable
pew_final %>% 
  select(conf_putin, conf_xi, conf_authoritarian) %>% 
  head()
```

### B. Aggregate and Summarize Data

Let's transform our *individual-level* data to *group-level* summaries. What is the average confidence in Biden, grouped by country?

```{r transform-aggregate}
country_summary <- pew_final %>%
  group_by(country) %>%
  summarize(
    # Calculate the mean, removing NAs
    avg_biden_conf = mean(conf_biden, na.rm = TRUE),
    # Calculate the count (n())
    num_respondents = n()
  ) %>%
  # Arrange the results to see highest/lowest
  arrange(avg_biden_conf)

# Print the summary table
print(country_summary)
```

## 5\. Save Your Work

We've successfully wrangled the data\! Let's save our final, clean data frame to a CSV file. We will use this file in Lab 2.

```{r save-data}
write_csv(pew_final, "pew_data_clean.csv")
```

````

### Week 2 Lab: Descriptives & Visualization (Chapter 13)

```qmd
---
title: "Lab 2: Descriptive Statistics and Visualization"
subtitle: "The First Look: From Raw Data to Understanding"
format: html
editor: visual
---

> **Required Citation & Disclaimer:**
> Remember to include the Pew Research Center citation and disclaimer (from Lab 1) in all work that uses this data.

## Introduction

This lab follows **Chapter 13: Descriptive Statistics and Visualization**. Now that we have our `pew_data_clean.csv` file from Lab 1, our job is to "get to know our data." We will use descriptive statistics (mean, median, range) and data visualizations (`ggplot2`) to summarize our sample.

## 1. Setup: Load Packages and Data

We load the `tidyverse` (which includes `ggplot2`) and `skimr` for great summary tables. We will load the **clean CSV** we created in Lab 1.

```{r load-packages-data, message=FALSE, warning=FALSE}
library(tidyverse)
library(skimr) # For easy descriptive stats

# Load the clean data from last week
pew_clean <- read_csv("pew_data_clean.csv")
````

## 2\. Descriptive Statistics (The Numbers)

Chapter 13 discusses *central tendency* (mean, median) and *dispersion* (standard deviation, range).

### A. Overall Summary

The `skim()` function gives us a powerful first look at all our variables.

```{r skim}
skim(pew_clean)
```

**Questions to Answer:**

  * What is the mean `age` of the sample? What is the median?
  * What are the "Measures of Central Tendency" for `age`? (Mean, Median)
  * What are the "Measures of Dispersion" for `age`? (SD, Range = max - min)

### B. Grouped Summaries

Let's get descriptives for a key variable, grouped by ideology.

```{r grouped-summary}
pew_clean %>%
  # Remove NAs from ideology so they aren't a group
  filter(!is.na(ideology_simple)) %>%
  group_by(ideology_simple) %>%
  summarize(
    count = n(),
    mean_biden_conf = mean(conf_biden, na.rm = TRUE),
    sd_biden_conf = sd(conf_biden, na.rm = TRUE),
    median_age = median(age, na.rm = TRUE)
  )
```

## 3\. Data Visualization (The Pictures)

We will now use `ggplot2` to visualize our data. Remember the "grammar of graphics":
`ggplot(data, aes(x, y)) + geom_...()`

### A. Showing a Distribution (Single Variable)

A histogram is the best way to see the *shape* of a variable.

```{r viz-histogram, warning=FALSE}
# Plot the distribution of Age
ggplot(pew_clean, aes(x = age)) +
  geom_histogram(binwidth = 5, color = "white", fill = "steelblue") +
  labs(
    title = "Distribution of Respondent Age",
    x = "Age",
    y = "Count"
  ) +
  theme_minimal()
```

### B. Comparing Categories

A bar chart is perfect for comparing counts or means across groups.

```{r viz-bar-chart, warning=FALSE}
# Bar Chart: How many people have a favorable/unfavorable view of the US?
ggplot(pew_clean, aes(x = view_us)) +
  geom_bar(fill = "darkred") +
  labs(
    title = "Views of the United States",
    x = "View",
    y = "Number of Respondents"
  ) +
  theme_minimal()
```

A boxplot is even better for comparing distributions (Chapter 13).

```{r viz-boxplot, warning=FALSE}
# Boxplot: Is confidence in Biden different by ideology?
ggplot(pew_clean, aes(x = ideology_simple, y = conf_biden)) +
  geom_boxplot() +
  labs(
    title = "Confidence in Biden, by Political Ideology",
    x = "Self-Reported Ideology",
    y = "Confidence (1=A lot, 4=None)"
  ) +
  theme_minimal()
```

### C. Showing a Relationship (Two Variables)

A scatterplot is the best tool for visualizing the relationship between two continuous variables.

```{r viz-scatterplot, warning=FALSE}
# Scatterplot: Is confidence in Biden related to confidence in Putin?
ggplot(pew_clean, aes(x = conf_biden, y = conf_putin)) +
  geom_point(alpha = 0.2) + # alpha adds transparency
  geom_smooth(method = "lm") + # Adds a regression line
  labs(
    title = "Confidence in Biden vs. Putin",
    x = "Confidence in Biden",
    y = "Confidence in Putin"
  ) +
  theme_minimal()
```

````

### Week 3 Lab: Inferential Statistics (Chapter 14)

```qmd
---
title: "Lab 3: Making Inferences"
subtitle: "The Leap from Sample to Population"
format: html
editor: visual
---

> **Required Citation & Disclaimer:**
> Remember to include the Pew Research Center citation and disclaimer (from Lab 1) in all work that uses this data.

## Introduction

This lab follows **Chapter 14: Making Inferences**. Our goal is to use our sample data to make claims about the larger population. We will do this by:

1.  Stating a **Null Hypothesis ($H_0$)** and **Research Hypothesis ($H_1$)**.
2.  Choosing the correct statistical test.
3.  Evaluating the **p-value** against our alpha level ($\alpha = 0.05$).
4.  Interpreting the result and checking the **effect size**.

## 1. Setup: Load Packages and Data

We load `tidyverse` and `broom`. `broom` is a *vital* package that cleans up the messy output from R's statistical tests into tidy tables.

```{r load-packages-data, message=FALSE, warning=FALSE}
library(tidyverse)
library(broom) # For tidy()
library(skimr)

# Load the clean data from Lab 1
pew_clean <- read_csv("pew_data_clean.csv")
````

## 2\. Test of Association (Categorical): Chi-Square

**Research Question:** Is there a relationship between a respondent's ideology and their view of the United States?

  * **$H_0$:** There is no association between ideology and view of the U.S.
  * **$H_1$:** There is an association between ideology and view of the U.S.
  * **Test:** Chi-Square ($\chi^2$) Test of Independence.

<!-- end list -->

```{r test-chisq, warning=FALSE}
# 1. Create a contingency table
ideology_table <- table(pew_clean$ideology_simple, pew_clean$view_us)
print(ideology_table)

# 2. Run the test and use tidy() to clean the output
chi_results <- chisq.test(ideology_table)
tidy(chi_results)
```

**Interpretation:**

  * Look at the `p.value`. Is it less than 0.05?
  * If yes, we **reject the null hypothesis**. It appears there is a statistically significant association between ideology and views of the US.
  * **Write-up:** "A chi-square test revealed a significant association between political ideology and views of the U.S., $\chi^2$(df) = [statistic], $p$ \< .001."

## 3\. Test of Association (Continuous): Correlation

**Research Question:** Is confidence in Biden related to confidence in Putin?

  * **$H_0$:** There is no correlation between confidence in Biden and Putin ($r = 0$).
  * **$H_1$:** There is a correlation between confidence in Biden and Putin ($r \neq 0$).
  * **Test:** Pearson's Correlation ($r$).

<!-- end list -->

```{r test-cor}
cor_results <- cor.test(pew_clean$conf_biden, pew_clean$conf_putin)
tidy(cor_results)
```

**Interpretation:**

  * Look at the `estimate` (this is the effect size, $r$). Is it positive or negative?
  * Look at the `p.value`. Is it \< 0.05?
  * **Write-up:** "A Pearson's correlation found a [positive/negative], [weak/moderate/strong] and statistically significant relationship between confidence in Biden and confidence in Putin, $r$([df]) = [estimate], $p$ = [p.value]."

## 4\. Test of Difference (2 Groups): t-test

**Research Question:** Is there a difference in confidence in Biden between people on the "Left" and "Right" of the political spectrum?

  * **$H_0$:** The mean confidence in Biden is the same for Left and Right groups.
  * **$H_1$:** The mean confidence in Biden is different for Left and Right groups.
  * **Test:** Independent Samples t-test.

<!-- end list -->

```{r test-ttest}
# 1. First, create a data frame with only "Left" and "Right"
left_right_data <- pew_clean %>%
  filter(ideology_simple %in% c("Left", "Right"))

# 2. Run the t-test. We use the formula: y ~ x
ttest_results <- t.test(conf_biden ~ ideology_simple, data = left_right_data)
tidy(ttest_results)
```

**Interpretation:**

  * Look at `estimate1` (mean for Left) and `estimate2` (mean for Right).
  * Look at the `p.value`. Is it \< 0.05?
  * **Write-up:** "An independent samples t-test found that the [Left/Right] group ($M$ = [estimate1], $SD$ = ?) had significantly [more/less] confidence in Biden than the [Left/Right] group ($M$ = [estimate2], $SD$ = ?), $t$([parameter]) = [statistic], $p$ = [p.value]."

## 5\. Test of Difference (3+ Groups): ANOVA

**Research Question:** Does confidence in Biden differ across education levels?

  * **$H_0$:** The mean confidence in Biden is the same for all education groups.
  * **$H_1$:** At least one education group has a different mean confidence.
  * **Test:** Analysis of Variance (ANOVA).

<!-- end list -->

```{r test-anova}
# 1. Convert education to a factor for the ANOVA
pew_clean$education_factor <- as_factor(pew_clean$education)

# 2. Run the ANOVA
anova_results <- aov(conf_biden ~ education_factor, data = pew_clean)
tidy(anova_results)

# 3. If p < .05, run a Post-Hoc test (Tukey's) to see *which* groups differ
tidy(TukeyHSD(anova_results))
```

**Interpretation:**

  * Look at the `p.value` from the `tidy(anova_results)` table (the row for `education_factor`). If $p < .05$, the test is significant.
  * If significant, look at the `TukeyHSD` results. Any row with an `adj.p.value` \< 0.05 represents a significant difference between those two specific groups.
  * **Write-up:** "A one-way ANOVA revealed a significant effect of education on confidence in Biden, $F$([df], [df.residual]) = [statistic], $p$ = [p.value]. A Tukey post-hoc test showed that the [Group 1] ($M$ = ?) was significantly different from the [Group 2] ($M$ = ?)."

<!-- end list -->

```
```