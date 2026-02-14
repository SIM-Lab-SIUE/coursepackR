# coursepackR

Student-facing R package for **MC-451 Research Methods** at SIUE, built
around the open textbook *From Vibes to Variables: A Field Guide to Open
Media Science*.

## Install

```r
# install.packages("remotes")
remotes::install_github("SIM-Lab-SIUE/coursepackR")
```

## Quick Start

```r
library(coursepackR)

# First-time setup (Quarto, TinyTeX, core packages)
mccourse_setup()

# Verify your environment
mccourse_check()

# Download this week's materials
download_week("mc451", 1)

# Access the music dataset (1,792 songs)
data(unified_music)
head(unified_music)
```

## What's Included

- **9 helper functions** for downloading materials, checking your
  environment, and scaffolding projects
- **Unified music dataset** (1,792 songs with Billboard, Spotify, and
  Genius data)
- **17 textbook chapters** bundled for offline access
- **Weekly assignment templates** for MC-451

## Links

- [Textbook](https://sim-lab-siue.github.io/vibes-to-variables/) — *From
  Vibes to Variables*
- [Course Site](https://sim-lab-siue.github.io/liaison-program/) — The
  Liaison Program
- [Function Reference](https://sim-lab-siue.github.io/coursepackR/reference/)

## License

MIT
