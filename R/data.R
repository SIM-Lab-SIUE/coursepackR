# ==============================================================================
# Package Data Documentation
# ==============================================================================
# This file documents datasets included with the mccoursepack for teaching
# purposes. All data is stored in data/ and documented here for R CMD check.
# ==============================================================================

# ------------------------------------------------------------------------------
# Pew Research Center ATP Wave 144 Excerpt
# ------------------------------------------------------------------------------
#' Pew ATP Wave 144 Excerpt (Teaching Dataset)
#'
#' A teaching excerpt from the Pew Research Center's American Trends Panel 
#' Wave 144 conducted in March 2024. This dataset is provided for educational
#' purposes to teach survey data analysis, data visualization, and statistical
#' methods in MC 451 and MC 501.
#'
#' @format A data frame with 626 rows and several variables representing
#'   survey responses. See the codebook in the course materials for detailed
#'   variable descriptions and coding schemes.
#'   
#' @section Important Notes:
#' * This is a subset of the original ATP W144 data
#' * Data has been cleaned and prepared for teaching purposes
#' * Variable names and formats may differ from the original release
#' * Missing values are coded according to Pew's standard practices
#'
#' @source "American Trends Panel: Wave 144." Pew Research Center, 
#'   Washington, D.C. (March 18-24, 2024). 
#'   \url{https://www.pewresearch.org/}
#'   
#' @section Disclaimer:
#' Pew Research Center bears no responsibility for the analyses or 
#' interpretations of the data presented here. The opinions expressed herein,
#' including any implications for policy, are those of the author and not of 
#' Pew Research Center.
#'
#' @examples
#' \dontrun{
#' # Load the dataset
#' data(ATP_W144_excerpt)
#' 
#' # View structure
#' str(ATP_W144_excerpt)
#' 
#' # Summary statistics
#' summary(ATP_W144_excerpt)
#' }
"ATP_W144_excerpt"