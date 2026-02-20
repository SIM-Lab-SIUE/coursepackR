# The Unified Music Dataset

The `unified_music` dataset is the primary dataset used throughout *From
Vibes to Variables*. This vignette documents every variable, explains
where the data comes from, and shows example analyses.

## Overview

The dataset contains **1,792 songs** with **36 variables** drawn from
three public sources:

- **Billboard Hot 100** — Weekly chart rankings, weeks on the chart, and
  chart entry/exit dates
- **Spotify Web API** — Audio features (danceability, energy, valence,
  etc.), track metadata, and playlist classifications
- **Genius** — Page view counts, featured artists, and lyrics text

## Loading the Data

``` r
library(coursepackR)
data(unified_music)

dim(unified_music)
#> [1] 1792   36

str(unified_music)
```

The dataset is lazy-loaded and compressed with xz, so it’s available
immediately after [`data()`](https://rdrr.io/r/utils/data.html) with
minimal memory overhead.

## Variable Reference

### Identification (6 variables)

| Variable                   | Type      | Description              | Example           |
|----------------------------|-----------|--------------------------|-------------------|
| `Song`                     | character | Song title               | “Blinding Lights” |
| `Artist`                   | character | Artist name              | “The Weeknd”      |
| `track_id`                 | character | Spotify track identifier | “0VjIjW4GlUZA…”   |
| `track_album_id`           | character | Spotify album identifier | “4yP0hdKO76X…”    |
| `track_album_name`         | character | Album title              | “After Hours”     |
| `track_album_release_date` | character | Album release date       | “2020-03-20”      |

### Billboard Chart Performance (7 variables)

| Variable              | Type      | Description                                   |
|-----------------------|-----------|-----------------------------------------------|
| `Max_Rank`            | integer   | Highest chart position achieved (1 = \#1 hit) |
| `Average_Rank`        | numeric   | Mean chart position across all weeks          |
| `First_Week_on_Board` | character | Date of first Billboard appearance            |
| `First_Rank_on_Board` | integer   | Chart position on first appearance            |
| `Last_Week_on_Board`  | character | Date of last Billboard appearance             |
| `Last_Rank_on_Board`  | integer   | Chart position on last appearance             |
| `Weeks_on_Board`      | integer   | Total weeks on the Billboard chart            |

**Note:** Lower values of `Max_Rank` indicate better performance (1 is
the top position).

### Spotify Audio Features (13 variables)

| Variable           | Type    | Range | Description                                                       |
|--------------------|---------|-------|-------------------------------------------------------------------|
| `danceability`     | numeric | 0–1   | How suitable for dancing (tempo, rhythm stability, beat strength) |
| `energy`           | numeric | 0–1   | Perceptual measure of intensity and activity                      |
| `valence`          | numeric | 0–1   | Musical positivity (high = happy, low = sad/angry)                |
| `tempo`            | numeric | BPM   | Estimated tempo in beats per minute                               |
| `loudness`         | numeric | dB    | Overall loudness (typically -60 to 0 dB)                          |
| `speechiness`      | numeric | 0–1   | Presence of spoken words (\> 0.66 = mostly speech)                |
| `acousticness`     | numeric | 0–1   | Confidence the track is acoustic                                  |
| `instrumentalness` | numeric | 0–1   | Predicts whether a track has no vocals                            |
| `liveness`         | numeric | 0–1   | Detects presence of an audience (\> 0.8 = likely live)            |
| `duration_ms`      | integer | ms    | Track duration in milliseconds                                    |
| `key`              | integer | 0–11  | Musical key (0 = C, 1 = C#/Db, 2 = D, …, 11 = B)                  |
| `mode`             | integer | 0–1   | Modality (0 = minor, 1 = major)                                   |
| `track_popularity` | integer | 0–100 | Spotify popularity score at time of collection                    |

### Genre Classification (4 variables)

| Variable            | Type      | Description                                       |
|---------------------|-----------|---------------------------------------------------|
| `playlist_name`     | character | Name of the source Spotify playlist               |
| `playlist_id`       | character | Spotify playlist identifier                       |
| `playlist_genre`    | character | Broad genre category (e.g., “pop”, “rap”, “rock”) |
| `playlist_subgenre` | character | More specific subgenre label                      |

### Genius Metadata (4 variables)

| Variable   | Type      | Description               |
|------------|-----------|---------------------------|
| `id`       | integer   | Genius song identifier    |
| `views`    | integer   | Genius page view count    |
| `features` | character | Featured artists (if any) |
| `lyrics`   | character | Full song lyrics text     |

### Other (2 variables)

| Variable | Type      | Description          |
|----------|-----------|----------------------|
| `year`   | integer   | Release year         |
| `tag`    | character | Content tag or label |

## Quick Analyses

These examples show common operations you’ll perform in the course.

### Summary statistics

``` r
summary(unified_music[, c("danceability", "energy", "valence", "tempo")])
```

### Genre distribution

``` r
table(unified_music$playlist_genre)
```

### Relationship between audio features

``` r
# Correlation between danceability and energy
cor(unified_music$danceability, unified_music$energy, use = "complete.obs")

# Scatter plot
plot(unified_music$danceability, unified_music$energy,
     xlab = "Danceability", ylab = "Energy",
     main = "Danceability vs. Energy",
     pch = 20, col = rgb(0, 0, 0, 0.2))
```

### Chart performance by genre

``` r
# Average max rank by genre (lower = better)
aggregate(Max_Rank ~ playlist_genre, data = unified_music, FUN = mean)
```

### Duration in minutes

``` r
# Convert milliseconds to minutes
unified_music$duration_min <- unified_music$duration_ms / 60000
summary(unified_music$duration_min)
```

## Data Quality Notes

- Some songs appear in multiple Spotify playlists and may have different
  `playlist_genre` or `playlist_subgenre` values.
- `lyrics` may be `NA` for songs where Genius did not have lyrics
  available.
- `views` reflects page views at the time of data collection and may not
  reflect current counts.
- `track_popularity` is a point-in-time Spotify metric that changes over
  time.
- Billboard chart dates use character format (e.g., “2020-03-14”) and
  can be converted with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html).

## Further Reading

- [Data Dictionary
  appendix](https://sim-lab-siue.github.io/vibes-to-variables/appendices/data-dictionary.html)
  in the textbook
- Chapter 9 (*Vibes to Variables*) — operationalizing music variables
- Chapter 12 (*Wrangling the Chaos*) — data cleaning and preparation
- Chapter 13 (*Seeing Patterns*) — exploratory data analysis
- [`?unified_music`](https://sim-lab-siue.github.io/coursepackR/reference/unified_music.md)
  — roxygen2 help page with the full variable list
