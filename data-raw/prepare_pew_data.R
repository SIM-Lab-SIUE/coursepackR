# ---
# Title: Prepare Pew ATP W144 Excerpt for Teaching
# Author: Your Name / Your Institution
# Date: 2025-11-19
# ---

# ---
# 0. TERMS OF USE & CITATION
# ---
# This script creates a teaching excerpt from Pew ATP Wave 144.
# It filters for English-language respondents, drops unneeded columns,
# and randomly samples 626 cases (99% CI, 5% MoE, N=10,454).
#
# Required Citation:
# "American Trends Panel: Wave 144." Pew Research Center, Washington, D.C. (March 18-24, 2024).
#
# Required Disclaimer:
# "Pew Research Center bears no responsibility for the analyses or interpretations
# of the data presented here. The opinions expressed herein, including any
# implications for policy, are those of the author and not of Pew Research Center."
# ---

# ---
# 1. LOAD LIBRARIES
# ---
library(tidyverse)
library(data.table)

# ---
# 2. READ IN DATA
# ---
# Use here::here() to locate the CSV relative to this script
csv_path <- here::here("data-raw", "ATP W144.csv")
raw_data <- fread(file = csv_path)

# ---
# 3. CREATE EXCERPT
# ---
# - Filter for English-language respondents (LANG_W144 == 1)
# - Drop unneeded columns (see list below)
# - Randomly sample 626 rows (99% CI, 5% MoE, N=10,454)
#
# Columns dropped: interview times, language, region, weights, and other sensitive or redundant fields

data_excerpt <- raw_data %>%
  filter(LANG_W144 == 1) %>%
  select(-INTERVIEW_START_W144,
         -INTERVIEW_END_W144,
         -LANG_W144,
         -XRAND_FB_IG_W144,
         -DOV_USE4_W144,
         -DOV_ASKFB_W144,
         -DOV_ASKIG_W144,
         -F_CREGION,
         -F_CDIVISION,
         -F_USR_SELFID,
         -F_HISP,
         -F_HISP_ORIGIN,
         -F_YEARSINUS_RECODE,
         -F_RACECMB,
         -F_BIRTHPLACE,
         -F_RELIG,
         -F_BORN,
         -F_RELIGCAT1,
         -F_ATTENDPER,
         -F_VOLSUM,
         -WEIGHT_W144,
         -WEIGHT_W144_FB,
         -WEIGHT_W144_IG,
         -WEIGHT_W144_XT,
         -WEIGHT_W144_TT) %>%
  slice_sample(n = 626)

# ---
# 4. WRITE EXCERPT TO CSV
# ---
fwrite(data_excerpt, "data/ATP_W144_excerpt.csv")

# ---
# 5. SCRIPT COMPLETE
# ---
cat("Excerpted data saved to data/ATP_W144_excerpt.csv\n")
cat("Rows:", nrow(data_excerpt), " Columns:", ncol(data_excerpt), "\n")
str(data_excerpt)

# ---
# 6. SAVE AS RDA FOR PACKAGE
# ---
excerpt <- data.table::fread("inst/extdata/ATP_W144_excerpt.csv")
save(excerpt, file = "data/ATP_W144_excerpt.rda")