#' simpsons_characters
#'
#' A dataset containing information about characters in The Simpsons.
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{id}{Unique identifier for the character (integer)}
#'   \item{name}{Character name (character)}
#'   \item{normalized_name}{Normalized character name (character)}
#'   \item{gender}{Character gender (character)}
#' }
#' @source Generated for educational purposes.
"simpsons_characters"

#' simpsons_episodes
#'
#' A dataset containing information about episodes of The Simpsons.
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{id}{Unique identifier for the episode (integer)}
#'   \item{title}{Episode title (character)}
#'   \item{season}{Season number (integer)}
#'   \item{number_in_season}{Episode number within the season (integer)}
#'   \item{number_in_series}{Episode number within the series (integer)}
#'   \item{original_air_date}{Original air date (Date)}
#'   \item{original_air_year}{Original air year (integer)}
#'   \item{production_code}{Production code (character)}
#'   \item{imdb_rating}{IMDB rating (numeric)}
#'   \item{imdb_votes}{Number of IMDB votes (integer)}
#'   \item{us_viewers_in_millions}{US viewers in millions (numeric)}
#'   \item{views}{Total views (numeric)}
#'   \item{image_url}{URL of the episode image (character)}
#'   \item{video_url}{URL of the episode video (character)}
#' }
#' @source Generated for educational purposes.
"simpsons_episodes"

#' simpsons_locations
#'
#' A dataset containing information about locations in The Simpsons.
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{id}{Unique identifier for the location (integer)}
#'   \item{name}{Location name (character)}
#'   \item{normalized_name}{Normalized location name (character)}
#' }
#' @source Generated for educational purposes.
"simpsons_locations"

#' simpsons_script_lines
#'
#' A dataset containing script lines from The Simpsons.
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{id}{Unique identifier for the line (integer)}
#'   \item{character_id}{Unique identifier for the character (integer)}
#'   \item{episode_id}{Unique identifier for the episode (integer)}
#'   \item{location_id}{Unique identifier for the location (integer)}
#'   \item{normalized_text}{Normalized text of the line (character)}
#'   \item{raw_text}{Raw text of the line (character)}
#'   \item{raw_character_text}{Raw text of the character (character)}
#'   \item{raw_location_text}{Raw text of the location (character)}
#'   \item{spoken_words}{Words spoken in the line (character)}
#'   \item{number}{Line number in the script (integer)}
#'   \item{speaking_line}{Indicator if the line is spoken (logical)}
#'   \item{timestamp_in_ms}{Timestamp in milliseconds (integer)}
#'   \item{word_count}{Word count of the line (integer)}
#' }
#' @source Generated for educational purposes.
"simpsons_script_lines"