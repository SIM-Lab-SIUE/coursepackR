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
raw_file <- "inst/extdata/pew_global_attitudes_2024.sav"

# read_sav() imports the .sav file and preserves all its metadata
pew_raw <- read_sav(raw_file)

# Check column names
cat("Column names in the raw data:\n")
print(names(pew_raw))

# --- 3. Clean and Transform Data ---

pew_clean <- pew_raw %>%
  #
  # PHASE 1: SELECT AND RENAME
  #
  select(
    # Demographics
    country = country,
    age = age,
    gender = gender,
    ideology = political_scale2,

    # Key Survey Items
    view_us = fav_us,
    view_china = fav_china,
    conf_biden = confid_biden,
    conf_putin = confid_putin,
    conf_xi = confid_xi,
    econ_sit = econ_sit
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

    # Recode `view_...` variables to be simple factors
    view_us = as_factor(view_us),
    view_china = as_factor(view_china),

    # Recode `ideology` into a clean 3-level factor
    # Assuming political_scale2 is 1-10, simplify to left/center/right
    ideology = case_when(
      ideology <= 3 ~ "Left",
      ideology >= 4 & ideology <= 6 ~ "Center",
      ideology >= 7 ~ "Right",
      TRUE ~ NA_character_
    ),

    # Convert ordinal scales to numeric for analysis
    # We must use `as.numeric()` here, NOT `as_factor()`.
    # Lower numbers = more confidence/better econ.
    conf_biden = as.numeric(conf_biden),
    conf_putin = as.numeric(conf_putin),
    conf_xi = as.numeric(conf_xi),
    econ_sit = as.numeric(econ_sit)
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
    )
  )

# --- 4. Create Excerpt and Save to Package ---

# For the R package (adhering to Terms of Use)
# We take a random sample of 1000 respondents
set.seed(1234) # For reproducibility
pew_spring_2024_excerpt <- pew_clean %>%
  slice_sample(n = 1000)

# Save the data for the R package
save(pew_spring_2024_excerpt, file = "data/pew_spring_2024_excerpt.rda", compress = "xz")

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
