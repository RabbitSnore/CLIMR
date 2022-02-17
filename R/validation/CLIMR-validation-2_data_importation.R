#######################################################################

# CLIMR -- Data Importation and Cleaning, Validation 2

#######################################################################

# Set up environment --------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr", "viridis", "leaflet", "osfr")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

# Import data ------------------------------------------------------------------

## Create necessary directories and download data from OSF

# The data stored on OSF have been cleaned to rename variables and to remove
# unnecessary metadata from Qualtrics, as well as Prolific IDs.
# No participants have been removed from this data set.

### Krüger et al. (2014) Study 4, close replication

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

if (!file.exists("./data/validation/fruit-close_validation_data.csv")) {
  
  osf_retrieve_file("") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

fruit_close <- read.csv("./data/validation/fruit-close_validation_data.csv")

### Krüger et al. (2014) Study 4, modified replication

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

if (!file.exists("./data/validation/fruit-modified_validation_data.csv")) {
  
  osf_retrieve_file("") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

fruit_modified <- read.csv("./data/validation/fruit-modified_validation_data.csv")

### Krüger et al. (2014) Study 1, validation 

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

if (!file.exists("./data/validation/bridge_validation_data.csv")) {
  
  osf_retrieve_file("") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

bridges <- read.csv("./data/validation/bridge_validation_data.csv")

# Wrangle ----------------------------------------------------------------------

## Krüger et al. (2014) Study 4, close replication

fruit_close_long <- fruit_close %>% 
  pivot_longer(
    cols = c(starts_with("L"), starts_with("H")),
    values_to = "estimate",
    names_pattern = "(.)(.*)_(.)",
    names_to = c("distance", "item", "minmax")
  ) %>% 
  filter(!is.na(estimate))

fruit_close_long <- fruit_close_long %>% 
  mutate(
    minmax = case_when(
      minmax == 1 ~ "min",
      minmax == 2 ~ "max"
    )
  ) %>% 
  pivot_wider(
    id_cols = c("sub", "distance", "item"),
    names_from = "minmax",
    values_from = "estimate"
  )

fruit_close_long <- fruit_close_long %>% 
  filter(min < max)

outlier_bounds <- fruit_close_long %>% 
  group_by(item) %>% 
  summarise(
    upper_max = median(max) + mad(max)*3,
    lower_max = median(max) - mad(max)*3,
    upper_min = median(min) + mad(min)*3,
    lower_min = median(min) - mad(min)*3
  )

fruit_close_long <- fruit_close_long %>% 
  left_join(outlier_bounds, by = "item")

fruit_close_long <- fruit_close_long %>%
  filter(
      min < upper_min &
      min > lower_min &
      max < upper_max &
      max > lower_max
  )

fruit_close_long <- fruit_close_long %>% 
  mutate(
    interval = max - min
  )

fruit_close_wide <- fruit_close_long %>% 
  pivot_wider(
    id_cols = c("sub", "distance"),
    names_from = "item",
    values_from = "interval",
    names_prefix = "fruit_"
  ) %>% 
  mutate(
    interval_z_01 = scale(fruit_1),
    interval_z_02 = scale(fruit_2),
    interval_z_03 = scale(fruit_3),
    interval_z_04 = scale(fruit_4),
    interval_z_05 = scale(fruit_5),
    interval_z_06 = scale(fruit_6),
    interval_z_07 = scale(fruit_7),
    interval_z_08 = scale(fruit_8),
    interval_z_09 = scale(fruit_9),
    interval_z_10 = scale(fruit_10)
  )

fruit_close_wide$interval_mean_z <- select(fruit_close_wide, starts_with("interval_z")) %>% 
  rowMeans(na.rm = TRUE)

fruit_close$bif_total <- select(fruit_close, starts_with("bif")) %>% 
  rowSums()

## Krüger et al. (2014) Study 4, modified replication

fruit_modified <- fruit_modified %>% 
  filter(att_check == 1 & condition == "abstract" | att_check == 2 & condition == "concrete")

fruit_modified_long <- fruit_modified %>% 
  pivot_longer(
    cols = c(starts_with("L"), starts_with("H")),
    values_to = "estimate",
    names_pattern = "(.)(.*)_(.)",
    names_to = c("distance", "item", "minmax")
  ) %>% 
  filter(!is.na(estimate))

fruit_modified_long <- fruit_modified_long %>% 
  mutate(
    minmax = case_when(
      minmax == 1 ~ "min",
      minmax == 2 ~ "max"
    )
  ) %>% 
  pivot_wider(
    id_cols = c("sub", "distance", "item"),
    names_from = "minmax",
    values_from = "estimate"
  )

fruit_modified_long <- fruit_modified_long %>% 
  filter(min < max)

outlier_bounds_modified <- fruit_modified_long %>% 
  group_by(item) %>% 
  summarise(
    upper_max = median(max) + mad(max)*3,
    lower_max = median(max) - mad(max)*3,
    upper_min = median(min) + mad(min)*3,
    lower_min = median(min) - mad(min)*3
  )

fruit_modified_long <- fruit_modified_long %>% 
  left_join(outlier_bounds_modified, by = "item")

fruit_modified_long <- fruit_modified_long %>%
  filter(
      min < upper_min &
      min > lower_min &
      max < upper_max &
      max > lower_max
  )

fruit_modified_long <- fruit_modified_long %>% 
  mutate(
    interval = max - min
  )

fruit_modified_wide <- fruit_modified_long %>% 
  pivot_wider(
    id_cols = c("sub", "distance"),
    names_from = "item",
    values_from = "interval",
    names_prefix = "fruit_"
  ) %>% 
  mutate(
    interval_z_01 = scale(fruit_1),
    interval_z_02 = scale(fruit_2),
    interval_z_03 = scale(fruit_3),
    interval_z_04 = scale(fruit_4),
    interval_z_05 = scale(fruit_5),
    interval_z_06 = scale(fruit_6),
    interval_z_07 = scale(fruit_7),
    interval_z_08 = scale(fruit_8),
    interval_z_09 = scale(fruit_9),
    interval_z_10 = scale(fruit_10)
  )

fruit_modified_wide$interval_mean_z <- select(fruit_modified_wide, starts_with("interval_z")) %>% 
  rowMeans(na.rm = TRUE)

fruit_modified$bif_total <- select(fruit_modified, starts_with("bif")) %>% 
  rowSums()

## Krüger et al. (2014) Study 1, validation

bridges <- bridges %>% 
  filter(att_check == 1 & condition == "abstract" | att_check == 2 & condition == "concrete")

bridges_long <- bridges %>% 
  pivot_longer(
    cols = c(starts_with("L"), starts_with("H")),
    values_to = "estimate",
    names_pattern = "(.)(.*)_(.)",
    names_to = c("distance", "item", "minmax")
  ) %>% 
  filter(!is.na(estimate))

bridges_long <- bridges_long %>% 
  mutate(
    minmax = case_when(
      minmax == 1 ~ "min",
      minmax == 2 ~ "max"
    )
  ) %>% 
  pivot_wider(
    id_cols = c("sub", "distance", "item"),
    names_from = "minmax",
    values_from = "estimate"
  )

bridges_long <- bridges_long %>% 
  filter(min < max)

outlier_bounds_bridges <- bridges_long %>% 
  group_by(item) %>% 
  summarise(
    upper_max = median(max) + mad(max)*3,
    lower_max = median(max) - mad(max)*3,
    upper_min = median(min) + mad(min)*3,
    lower_min = median(min) - mad(min)*3
  )

bridges_long <- bridges_long %>% 
  left_join(outlier_bounds_bridges, by = "item")

bridges_long <- bridges_long %>%
  filter(
    min < upper_min &
    min > lower_min &
    max < upper_max &
    max > lower_max
  )

bridges_long <- bridges_long %>% 
  mutate(
    interval = max - min
  )

bridges_wide <- bridges_long %>% 
  pivot_wider(
    id_cols = c("sub", "distance"),
    names_from = "item",
    values_from = "interval",
    names_prefix = "bridge_"
  ) %>% 
  mutate(
    interval_z_01 = scale(bridge_1),
    interval_z_02 = scale(bridge_2),
    interval_z_03 = scale(bridge_3),
    interval_z_04 = scale(bridge_4),
    interval_z_05 = scale(bridge_5),
    interval_z_06 = scale(bridge_6),
    interval_z_07 = scale(bridge_7),
    interval_z_08 = scale(bridge_8),
    interval_z_09 = scale(bridge_9),
    interval_z_10 = scale(bridge_10),
    interval_z_11 = scale(bridge_11),
    interval_z_12 = scale(bridge_12)
  )

bridges_wide$interval_mean_z <- select(bridges_wide, starts_with("interval_z")) %>% 
  rowMeans(na.rm = TRUE)

bridges$bif_total <- select(bridges, starts_with("bif")) %>% 
  rowSums()

