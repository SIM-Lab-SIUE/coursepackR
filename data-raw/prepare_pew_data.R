# ===================================================================
# CREATE PEW W144 EXCERPT FOR COURSE R PACKAGE (FINAL)
#
# INSTRUCTOR SCRIPT
#
# This script loads the raw 'ATP W144.sav' file, which is
# superior to the CSV as it contains variable/value labels.
#
# It creates a "partially clean" 1,000-person excerpt
# to comply with Pew's Terms of Use.
#
# CLEAN: Demographic variables are converted to factors.
# RAW: The 'fb_news_...' scale items are left as raw numbers (1-4, 99)
#      so students can wrangle them in Lab 12.
#
# This 'w144_excerpt.RData' file is what you will add to
# the /data folder of your course package.
# ===================================================================

# --- 1. Load Packages ---
# install.packages("tidyverse")
# install.packages("haven")
library(tidyverse)
library(haven) # The package for reading SPSS (.sav) files

# --- 2. Load Raw Data (Instructor must have this file) ---
# Make sure "ATP W144.sav" is in your project directory
raw_data <- read_sav("data-raw/ATP W144.sav")

# --- 3. Partial Cleaning & Transformation ---

partially_clean_data <- raw_data %>%
  #
  # PHASE 1: SELECT & RENAME
  #
  # NOTE: We are now using the exact variable names from the
  # 'colnames(raw_data)' output.
  #
  select(
    # Demographics (Raw numeric codes from .sav)
    age_cat_raw = F_AGECAT,
    gender_raw = F_GENDER,
    education_raw = F_EDUCCAT,
    party_raw = F_PARTY_FINAL,
    ideology_raw = F_IDEO,

    # Social Media Use (Raw)
    # 1=Yes, 2=No, 99=Refused
    use_facebook = SMUSE_a_W144,
    use_x = SMUSE_c_W144,
    use_instagram = SMUSE_d_W144,
    use_tiktok = SMUSE_i_W144,

    # Facebook News Source Scale (Raw)
    # 1=Often, 2=Sometimes, 3=Hardly ever, 4=Never, 99=Refused
    # We rename them to be intuitive for students
    fb_news_friends = FBSOURCE_a_W144,
    fb_news_journalists = FBSOURCE_b_W144,
    fb_news_officials = FBSOURCE_c_W144,
    fb_news_commenters = FBSOURCE_d_W144,
    fb_news_influencers = FBSOURCE_e_W144
  ) %>%
  #
  # PHASE 2: PARTIALLY CLEAN (Demographics ONLY)
  #
  mutate(
    # Use `as_factor` to convert labeled numbers to clean text factors
    gender_factor = as_factor(gender_raw),
    education_factor = as_factor(education_raw),
    
    # Manually recode party for cleaner labels
    party_factor = case_when(
      party_raw == 1 ~ "Republican",
      party_raw == 2 ~ "Democrat",
      party_raw == 3 ~ "Independent",
      party_raw == 4 ~ "Something else",
      TRUE ~ NA_character_
    ),

    # Keep age and ideology as numeric for scales/correlations
    # We use `zap_missing` to convert Pew's '99=Refused' to NA
    age_category = zap_missing(age_cat_raw),
    ideology = zap_missing(ideology_raw),
    
    # Clean the "fb_news" variables by replacing 99 (Refused) with NA
    # Students will still need to REVERSE CODE these
    across(starts_with("fb_news_"), ~na_if(., 99))
  ) %>%
  #
  # FINAL SELECTION for the excerpt
  #
  select(
    # Clean factors for students to use
    gender_factor,
    party_factor,
    education_factor,
    
    # Numeric demographics for students to use
    age_category, # 1-4 scale
    ideology,     # 1-5 scale
    
    # Other raw media vars for exploration
    use_facebook,
    use_x,
    use_instagram,
    use_tiktok,

    # The RAW scale items for the Lab 12 assignment
    fb_news_friends,
    fb_news_journalists,
    fb_news_officials,
    fb_news_commenters,
    fb_news_influencers
  )

# --- 4. Create Policy-Compliant Excerpt ---

# Set a seed for reproducibility
set.seed(451)

# Take a random sample of 1,000 respondents
w144_excerpt <- partially_clean_data %>%
  slice_sample(n = 1000)

# --- 5. Add Citation & Disclaimer (REQUIRED BY PEW) ---

# Add attributes to the data frame itself
attr(w144_excerpt, "citation") <- 
  'Pew Research Center, "ATP W144: Politics and News on Social Media Platforms." Pew Research Center, Washington, D.C. (March 2024).'
attr(w144_excerpt, "disclaimer") <- 
  'Pew Research Center bears no responsibility for the analyses or interpretations of the data presented here. The opinions expressed herein, including any implications for policy, are those of the author and not of Pew Research Center.'

# --- 6. Save for R Package ---

# This creates the .RData file to put in your package's /data folder
save(
  w144_excerpt,
  file = "w144_excerpt.RData",
  compress = "bzip2"
)

print("Successfully created 'w144_excerpt.RData' with 1,000 respondents.")
print("This version includes RAW 'fb_news_...' variables for students to clean in Lab 12.")
print("Add this file to the /data directory of your R package.")
print("Remember to add the documentation in /R/data.R and run devtools::document().")