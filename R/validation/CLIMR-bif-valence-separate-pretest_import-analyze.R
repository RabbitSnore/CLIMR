################################################################################

# CLIMR -- Data Importation and Cleaning, BIF Valence Pretest

################################################################################

# Set up environment -----------------------------------------------------------

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

## Functions

smd_calc <- function(x1, x2) {
  
  m_diff <- mean(x1, na.rm = TRUE) - mean(x2, na.rm = TRUE)
  
  n_1 <- sum(!is.na(x1), na.rm = TRUE) 
  
  n_2 <- sum(!is.na(x2), na.rm = TRUE)
  
  df <- n_1 + n_2 - 2
  
  sd_1 <- sd(x1, na.rm = TRUE)
  
  sd_2 <- sd(x2, na.rm = TRUE)
  
  sd_pooled <- sqrt( (((n_1 - 1) * sd_1^2) + ((n_2 - 1) * sd_2^2)) / df )
  
  d <- m_diff/sd_pooled
  
  var <- ((n_1 + n_2) / (n_1 * n_2)) + ((d^2) / (2*df))
  
  ci_upper <- d + sqrt(var) * qt(.975, df)
  
  ci_lower <- d - sqrt(var) * qt(.975, df)
  
  out <- data.frame(d = d, var = var, ci_lower = ci_lower, ci_upper = ci_upper)
  
  return(out)
  
}

# Import data ------------------------------------------------------------------

# Cleaning from raw data

# raw <- read.csv("./data/validation/climr_bif-valence-separate-pretest-data_raw.csv") %>% 
#   slice(-1, -2) %>% 
#   type_convert()
# 
# raw <- raw %>% 
#   select(id = ResponseId, finished = Finished, starts_with("bif"))
# 
# write.csv(raw, "./data/validation/climr_bif-valence-separate-pretest-data.csv", row.names = FALSE)

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

if (!file.exists("/data/validation/validation/climr_bif-valence-separate-pretest-data.csv")) {
  
  osf_retrieve_file("6364d0f3a3a1dd06f19c1d04") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite",
                 recurse = TRUE)
  
}

raw <- read.csv("./data/validation/climr_bif-valence-separate-pretest-data.csv")

bif_sep <- raw %>% 
  filter(finished == 1)

bif_sep_long_a <- bif_sep %>% 
  select(id, matches("bif_.._a")) %>% 
  pivot_longer(
    cols      = starts_with("bif"),
    names_to  = "item",
    names_pattern = "(bif_..)_.*",
    values_to = "bif"
  )

bif_sep_long_c <- bif_sep %>% 
  select(id, matches("bif_.._c")) %>% 
  pivot_longer(
    cols      = starts_with("bif"),
    names_to  = "item",
    names_pattern = "(bif_..)_.*",
    values_to = "bif"
  )

# Effect calculation -----------------------------------------------------------

## Item-level valence differences

bif_01_smd <- smd_calc(bif_sep$bif_01_a_valence_sep, bif_sep$bif_01_c_valence_sep)
bif_02_smd <- smd_calc(bif_sep$bif_02_a_valence_sep, bif_sep$bif_02_c_valence_sep)
bif_03_smd <- smd_calc(bif_sep$bif_03_a_valence_sep, bif_sep$bif_03_c_valence_sep)
bif_04_smd <- smd_calc(bif_sep$bif_04_a_valence_sep, bif_sep$bif_04_c_valence_sep)
bif_05_smd <- smd_calc(bif_sep$bif_05_a_valence_sep, bif_sep$bif_05_c_valence_sep)
bif_06_smd <- smd_calc(bif_sep$bif_06_a_valence_sep, bif_sep$bif_06_c_valence_sep)
bif_07_smd <- smd_calc(bif_sep$bif_07_a_valence_sep, bif_sep$bif_07_c_valence_sep)
bif_08_smd <- smd_calc(bif_sep$bif_08_a_valence_sep, bif_sep$bif_08_c_valence_sep)
bif_09_smd <- smd_calc(bif_sep$bif_09_a_valence_sep, bif_sep$bif_09_c_valence_sep)
bif_10_smd <- smd_calc(bif_sep$bif_10_a_valence_sep, bif_sep$bif_10_c_valence_sep)
bif_11_smd <- smd_calc(bif_sep$bif_11_a_valence_sep, bif_sep$bif_11_c_valence_sep)
bif_12_smd <- smd_calc(bif_sep$bif_12_a_valence_sep, bif_sep$bif_12_c_valence_sep)
bif_13_smd <- smd_calc(bif_sep$bif_13_a_valence_sep, bif_sep$bif_13_c_valence_sep)
bif_14_smd <- smd_calc(bif_sep$bif_14_a_valence_sep, bif_sep$bif_14_c_valence_sep)
bif_15_smd <- smd_calc(bif_sep$bif_15_a_valence_sep, bif_sep$bif_15_c_valence_sep)
bif_16_smd <- smd_calc(bif_sep$bif_16_a_valence_sep, bif_sep$bif_16_c_valence_sep)
bif_17_smd <- smd_calc(bif_sep$bif_17_a_valence_sep, bif_sep$bif_17_c_valence_sep)
bif_18_smd <- smd_calc(bif_sep$bif_18_a_valence_sep, bif_sep$bif_18_c_valence_sep)
bif_19_smd <- smd_calc(bif_sep$bif_19_a_valence_sep, bif_sep$bif_19_c_valence_sep)
bif_20_smd <- smd_calc(bif_sep$bif_20_a_valence_sep, bif_sep$bif_20_c_valence_sep)
bif_21_smd <- smd_calc(bif_sep$bif_21_a_valence_sep, bif_sep$bif_21_c_valence_sep)
bif_22_smd <- smd_calc(bif_sep$bif_22_a_valence_sep, bif_sep$bif_22_c_valence_sep)
bif_23_smd <- smd_calc(bif_sep$bif_23_a_valence_sep, bif_sep$bif_23_c_valence_sep)
bif_24_smd <- smd_calc(bif_sep$bif_24_a_valence_sep, bif_sep$bif_24_c_valence_sep)
bif_25_smd <- smd_calc(bif_sep$bif_25_a_valence_sep, bif_sep$bif_25_c_valence_sep)

bif_d <- bind_rows(
  bif_01_smd,
  bif_02_smd,
  bif_03_smd,
  bif_04_smd,
  bif_05_smd,
  bif_06_smd,
  bif_07_smd,
  bif_08_smd,
  bif_09_smd,
  bif_10_smd,
  bif_11_smd,
  bif_12_smd,
  bif_13_smd,
  bif_14_smd,
  bif_15_smd,
  bif_16_smd,
  bif_17_smd,
  bif_18_smd,
  bif_19_smd,
  bif_20_smd,
  bif_21_smd,
  bif_22_smd,
  bif_23_smd,
  bif_24_smd,
  bif_25_smd
)

bif_d$item <- paste("bif_", str_pad(1:25, 2, pad = 0), sep = "")

bif_d <- bif_d %>% 
  select(item, everything())

## Difference across all items

bif_scale_smd <- smd_calc(bif_sep_long_a$bif, bif_sep_long_c$bif)

# Export data ------------------------------------------------------------------

write.csv(bif_d, "./data/validation/climr_bif-valence_separate.csv", row.names = FALSE)
