# ---
# Title: R Script to Prepare Pew ATP W144 for Teaching (v2 - Scales)
# Author: Your Name / Your Institution
# Date: 2025-11-03
# ---

# ---
# 0. IMPORTANT: TERMS OF USE & CITATION
# ---
# This script selects an "excerpt" of ~35 variables from the original 195.
# This is NOT "substantially in full" and complies with Pew's Terms of Use.
#
# Required Citation (Section 2):
# "American Trends Panel: Wave 144." Pew Research Center, Washington, D.C. (March 18-24, 2024).
#
# Required Disclaimer (Section 13):
# "Pew Research Center bears no responsibility for the analyses or interpretations
# of the data presented here. The opinions expressed herein, including any
# implications for policy, are those of the author and not of Pew Research Center.”
# ---

# ---
# 1. LOAD LIBRARIES
# ---
library(tidyverse)
library(here)

# ---
# 2. DEFINE FILE PATHS
# ---
data_file_path <- here("data-raw/ATP W144.csv")

# ---
# 3. LOAD DATA
# ---
raw_data <- read_csv(data_file_path)

# ---
# 4. PROCESS AND CLEAN DATA
# ---
# This pipe selects, renames, and recodes raw variables.
# It does NOT create composite scales (e.g., platform_count).
# This is left for the students in the Week 1 lab.

cleaned_data <- raw_data |>

  # ---
  # STEP 4A: SELECT RELEVANT VARIABLES
  # ---
  # We are selecting more variables now, specifically "batteries" of 
  # questions that students can combine into scales.
  select(
    # Respondent ID & Weight
    QKEY,
    WEIGHT_W144, 

    # ---
    # Elements for "Platform Count" Scale (Week 1 Task)
    # ---
    SMUSE_a_W144, # Facebook
    SMUSE_c_W144, # X (Twitter)
    SMUSE_d_W144, # Instagram
    SMUSE_i_W144, # TikTok
    
    # ---
    # Elements for "News Platform Count" Scale (Week 1 Optional Task)
    # ---
    SOCIALNEWS2_a_W144,
    SOCIALNEWS2_c_W144,
    SOCIALNEWS2_d_W144,
    SOCIALNEWS2_i_W144,

    # ---
    # Battery for "Reasons for using Facebook" Scale (Week 1 Task)
    # ---
    FBWHY_a_W144, # Get news
    FBWHY_b_W144, # Entertainment
    FBWHY_c_W144, # Social circle
    FBWHY_d_W144, # Express opinions
    FBWHY_e_W144, # Find products
    FBWHY_f_W144, # Shared interests
    FBWHY_g_W144, # Family/friends
    
    # ---
    # Battery for "Reasons for using TikTok" Scale (Week 1 Task)
    # ---
    TTWHY_a_W144, # Get news
    TTWHY_b_W144, # Entertainment
    TTWHY_c_W144, # Social circle
    TTWHY_d_W144, # Express opinions
    TTWHY_e_W144, # Find products
    TTWHY_f_W144, # Shared interests
    TTWHY_g_W144, # Family/friends

    # ---
    # Individual Ordinal/Categorical Items for Analysis
    # ---
    FBSEEPOL_W144,   # How much political content on Facebook
    TTSEEPOL_W144,   # How much political content on TikTok
    FBPOLIDEO_W144,  # Does Facebook content lean liberal/conservative
    TTPOLIDEO_W144,  # Does TikTok content lean liberal/conservative

    # ---
    # Key Demographics
    # ---
    F_AGECAT,   # Age category
    F_GENDER,   # Gender
    F_EDUCCAT,  # Education level
    F_RACETHNMOD, # Race / Ethnicity
    F_PARTY_FINAL, # Party affiliation
    F_IDEO,     # Ideology
    F_INC_SDT1  # Income
  ) |>

  # ---
  # STEP 4B: RECODE "REFUSED" TO NA
  # ---
  # Convert all 99s, 98s, and -1s to NA for correct analysis.
  mutate(
    across(
      everything(),
      ~ na_if(., 99)
    ),
    across(
      everything(),
      ~ na_if(., 98)
    ),
    across(
      everything(),
      ~ na_if(., -1)
    )
  ) |>

  # ---
  # STEP 4C: RENAME VARIABLES
  # ---
  # Give variables clear, human-readable names.
  rename(
    weight = WEIGHT_W144,
    
    # Platform Use items
    uses_facebook = SMUSE_a_W144,
    uses_x = SMUSE_c_W144,
    uses_instagram = SMUSE_d_W144,
    uses_tiktok = SMUSE_i_W144,

    # News Use items
    news_facebook = SOCIALNEWS2_a_W144,
    news_x = SOCIALNEWS2_c_W144,
    news_instagram = SOCIALNEWS2_d_W144,
    news_tiktok = SOCIALNEWS2_i_W144,
    
    # Facebook "Why Use" Battery
    fb_why_news = FBWHY_a_W144,
    fb_why_entertain = FBWHY_b_W144,
    fb_why_social = FBWHY_c_W144,
    fb_why_opinion = FBWHY_d_W144,
    fb_why_products = FBWHY_e_W144,
    fb_why_interests = FBWHY_f_W144,
    fb_why_family = FBWHY_g_W144,

    # TikTok "Why Use" Battery
    tt_why_news = TTWHY_a_W144,
    tt_why_entertain = TTWHY_b_W144,
    tt_why_social = TTWHY_c_W144,
    tt_why_opinion = TTWHY_d_W144,
    tt_why_products = TTWHY_e_W144,
    tt_why_interests = TTWHY_f_W144,
    tt_why_family = TTWHY_g_W144,

    # Political Content
    fb_pol_content = FBSEEPOL_W144,
    tt_pol_content = TTSEEPOL_W144,
    fb_pol_lean = FBPOLIDEO_W144,
    tt_pol_lean = TTPOLIDEO_W144,
    
    # Demographics
    age_group = F_AGECAT,
    gender = F_GENDER,
    education = F_EDUCCAT,
    race_ethnicity = F_RACETHNMOD,
    party = F_PARTY_FINAL,
    ideology = F_IDEO,
    income = F_INC_SDT1
  ) |>

  # ---
  # STEP 4D: CREATE FACTORS (from numeric codes)
  # ---
  # This makes all plots and tables human-readable.
  # We convert 1/2 to Yes/No, 1/2/3/4 to party names, etc.
  mutate(
    
    # Yes/No Variables (1=Yes, 2=No)
    # This includes all 'uses_', 'news_', 'fb_why_', and 'tt_why_' items
    across(
      starts_with("uses_") | starts_with("news_") | 
      starts_with("fb_why_") | starts_with("tt_why_"),
      ~ factor(., levels = c(1, 2), labels = c("Yes", "No"))
    ),
    
    # Demographics
    gender = factor(gender,
      levels = c(1, 2),
      labels = c("Male", "Female")
    ),
    age_group = factor(age_group,
      levels = c(1, 2, 3, 4),
      labels = c("18-29", "30-49", "50-64", "65+")
    ),
    race_ethnicity = factor(race_ethnicity,
      levels = c(1, 2, 3, 4, 5),
      labels = c("White non-Hispanic", "Black non-Hispanic", "Hispanic", 
                 "Other", "Asian non-Hispanic")
    ),
    education = factor(education,
      levels = c(1, 2, 3, 4, 5),
      labels = c("Less than high school", "High school graduate", "Some college", 
                 "College graduate", "Postgraduate")
    ),
    party = factor(party,
      levels = c(1, 2, 3, 4),
      labels = c("Republican", "Democrat", "Independent", "Something else")
    ),
    ideology = factor(ideology,
      levels = c(1, 2, 3, 4, 5),
      labels = c("Very conservative", "Conservative", "Moderate", 
                 "Liberal", "Very liberal")
    ),

    # Ordinal Variables (Content exposure)
    fb_pol_content = factor(fb_pol_content,
      levels = c(1, 2, 3, 4, 5),
      labels = c("All or almost all", "Most", "Some", "A little", "None at all"),
      ordered = TRUE
    ),
    tt_pol_content = factor(tt_pol_content,
      levels = c(1, 2, 3, 4, 5),
      labels = c("All or almost all", "Most", "Some", "A little", "None at all"),
      ordered = TRUE
    ),
    
    # Categorical Variable (Platform lean)
    fb_pol_lean = factor(fb_pol_lean,
      levels = c(1, 2, 3, 4),
      labels = c("Mostly conservative", "Mostly liberal", 
                 "Doesn't lean either way", "Not sure")
    ),
    tt_pol_lean = factor(tt_pol_lean,
      levels = c(1, 2, 3, 4),
      labels = c("Mostly conservative", "Mostly liberal", 
                 "Doesn't lean either way", "Not sure")
    )
  )

# ---
# 5. SAVE THE CLEANED, "RAW ELEMENTS" DATA
# ---
# This is the final file for your students. It is clean, labeled,
# and ready for them to wrangle and build scales from.
output_file_path <- here("w144_teaching_dataset_v2.csv")
write_csv(cleaned_data, output_file_path)

# ---
# 6. SCRIPT COMPLETE
# ---
print(paste("Cleaned data saved successfully to", output_file_path))
print("Data dimensions:")
dim(cleaned_data)
print("Column names and data types:")
glimpse(cleaned_data)