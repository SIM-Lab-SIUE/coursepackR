# data-raw/prepare_data.R

# This script takes the raw CSV files from inst/extdata/
# and saves them as clean .rda files in the data/ directory.

# 1. Load required libraries
library(tidyverse)
library(usethis)

# 2. Read the raw CSV files
simpsons_characters <- read_csv("inst/extdata/simpsons/simpsons_characters.csv")
simpsons_episodes <- read_csv("inst/extdata/simpsons/simpsons_episodes.csv")
simpsons_locations <- read_csv("inst/extdata/simpsons/simpsons_locations.csv")
simpsons_script_lines <- read_csv("inst/extdata/simpsons/simpsons_script_lines.csv")

# 3. Use the use_data() function to process and save them
# This creates the data/ folder and saves each object as an .rda file.
# The `overwrite = TRUE` is useful if you need to re-run this script.
use_data(simpsons_characters, overwrite = TRUE)
use_data(simpsons_episodes, overwrite = TRUE)
use_data(simpsons_locations, overwrite = TRUE)
use_data(simpsons_script_lines, overwrite = TRUE)
