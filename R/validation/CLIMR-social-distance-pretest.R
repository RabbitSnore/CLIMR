################################################################################

# CLIMR -- Social Distance Pretest

################################################################################

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr", "viridis", "leaflet", "osfr", "psychonetrics", "qgraph", "psych", "readxl")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

# Load functions

source("./R/functions/CLIMR_effect_size_functions.R")

# Import and wrangle data ------------------------------------------------------

# Cleaning from raw data

# raw <- read.csv("./data/validation/climr_social-distance-pretest-data_raw.csv") %>%
#   slice(-1, -2) %>%
#   type_convert()
# 
# raw <- raw %>%
#   select(id = ResponseId,
#          Finished, Age, Gender,
#          Close_rating, Similar, Familiar, Likeable, Warm, Competent, Skilled, Conventional, Eccentric, Immune,
#          starts_with("q_"), Distance, age_pipe, name_pipe)
# 
# colnames(raw) <- tolower(colnames(raw))
# 
# write.csv(raw, "./data/validation/climr_social-distance-pretest-data.csv", row.names = FALSE)

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

if (!file.exists("./data/validation/climr_social-distance-pretest-data.csv")) {
  
  osf_retrieve_file("636b9f65a0cd530814b780b8") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite",
                 recurse = TRUE)
  
}

soc_dist <- read.csv("./data/validation/climr_social-distance-pretest-data.csv")

# Analysis ---------------------------------------------------------------------

# Perceived social distance/closeness

distance_d <- d_calc("Social Distance", soc_dist$distance, soc_dist$close_rating, "Close", "Distant")

distance_hist <- 
ggplot(soc_dist,
       aes(
         x = close_rating
       )) +
  facet_wrap(~ distance) +
  geom_histogram(
    binwidth = 1,
    color = "grey"
  ) +
  scale_x_continuous(
    breaks = 1:7
  ) +
  labs(
    x = "Perceived Closeness" 
  ) +
  theme_classic()

close_cor_mat <- cor(select(soc_dist, close_rating, similar, familiar, warm, competent, likeable, skilled, conventional, eccentric, immune))

# Additional Measures

similar_d      <- d_calc("Similar", soc_dist$distance, soc_dist$similar, "Close", "Distant")
familiar_d     <- d_calc("Familiar", soc_dist$distance, soc_dist$familiar, "Close", "Distant")
warm_d         <- d_calc("Warm", soc_dist$distance, soc_dist$warm, "Close", "Distant")
competent_d    <- d_calc("Competent", soc_dist$distance, soc_dist$competent, "Close", "Distant")
likeable_d     <- d_calc("Likeable", soc_dist$distance, soc_dist$likeable, "Close", "Distant")
skilled_d      <- d_calc("Skilled", soc_dist$distance, soc_dist$skilled, "Close", "Distant")
conventional_d <- d_calc("Conventional", soc_dist$distance, soc_dist$conventional, "Close", "Distant")
eccentric_d    <- d_calc("Eccentric", soc_dist$distance, soc_dist$eccentric, "Close", "Distant")

supplement_d <- rbind(similar_d, familiar_d, warm_d, competent_d, likeable_d, skilled_d, conventional_d, eccentric_d)

# Immune system

immune_d <- d_calc("Immunity", soc_dist$distance, soc_dist$immune, "Close", "Distant")

immune_hist <- 
  ggplot(soc_dist,
         aes(
           x = immune
         )) +
  facet_wrap(~ distance) +
  geom_histogram(
    binwidth = 1,
    color = "grey"
  ) +
  scale_x_continuous(
    breaks = -3:3
  ) +
  labs(
    x = "Immunity to Colds" 
  ) +
  theme_classic()

# Save plots

cowplot::save_plot("./figures/climr_social-distance-pretest-histogram.png", distance_hist, base_height = 5, base_width = 10)
cowplot::save_plot("./reports/figures/climr_social-distance-pretest-histogram.png", distance_hist, base_height = 5, base_width = 10)

