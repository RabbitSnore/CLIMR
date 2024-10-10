################################################################################

# CLIMR -- Data Importation and Cleaning, BIF Valence Pretest, Relative

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

smd_calc_rel <- function(x) {
  
  m <- mean(x, na.rm = TRUE)
  
  n <- sum(!is.na(x), na.rm = TRUE)
  
  df <- n - 1
  
  sd <- sd(x, na.rm = TRUE)
  
  d <- m/sd
  
  se <- sd/sqrt(n)
  
  ci_upper <- (m + se * qt(.975, df)) / sd
  
  ci_lower <- (m - se * qt(.975, df)) / sd
  
  out <- data.frame(d = d, se = se, ci_lower = ci_lower, ci_upper = ci_upper, m = m, sd = sd)
  
  return(out)
  
}

# Import data ------------------------------------------------------------------

# Cleaning from raw data

# raw <- read.csv("./data/validation/climr_bif-valence-relative-pretest-data_raw.csv") %>%
#   slice(-1, -2) %>%
#   type_convert()
# 
# raw <- raw %>%
#   select(id = ResponseId, finished = Finished, starts_with("bif"))
# 
# write.csv(raw, "./data/validation/climr_bif-valence-relative-pretest-data.csv", row.names = FALSE)

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

if (!file.exists("./data/validation/climr_bif-valence-relative-pretest-data.csv")) {
  
  osf_retrieve_file("636a537b4a18c602898e8476") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite",
                 recurse = TRUE)
  
}

raw_val <- 
  read.csv("./data/validation/climr_bif-valence-relative-pretest-data.csv")

bif_rel <- raw_val %>% 
  filter(finished == 1)

bif_rel_long <- bif_rel %>% 
  select(id, matches("bif_.._.")) %>% 
  pivot_longer(
    cols      = starts_with("bif"),
    names_to  = c("item", "first"),
    names_pattern = "(bif_..)_valence_rel_(.)",
    values_to = "bif"
  ) %>% 
  filter(complete.cases(bif))

bif_rel_long <- bif_rel_long %>% 
  mutate(
    bif = case_when(
      first == "A" & item == "bif_01" ~ 4 - bif,
      first == "A" & item == "bif_02" ~ bif - 4,
      first == "A" & item == "bif_03" ~ 4 - bif,
      first == "A" & item == "bif_04" ~ 4 - bif,
      first == "A" & item == "bif_05" ~ 4 - bif,
      first == "A" & item == "bif_06" ~ bif - 4,
      first == "A" & item == "bif_07" ~ 4 - bif,
      first == "A" & item == "bif_08" ~ 4 - bif,
      first == "A" & item == "bif_09" ~ bif - 4,
      first == "A" & item == "bif_10" ~ 4 - bif,
      first == "A" & item == "bif_11" ~ bif - 4,
      first == "A" & item == "bif_12" ~ bif - 4,
      first == "A" & item == "bif_13" ~ 4 - bif,
      first == "A" & item == "bif_14" ~ 4 - bif,
      first == "A" & item == "bif_15" ~ bif - 4,
      first == "A" & item == "bif_16" ~ 4 - bif,
      first == "A" & item == "bif_17" ~ bif - 4,
      first == "A" & item == "bif_18" ~ bif - 4,
      first == "A" & item == "bif_19" ~ bif - 4,
      first == "A" & item == "bif_20" ~ 4 - bif,
      first == "A" & item == "bif_21" ~ bif - 4,
      first == "A" & item == "bif_22" ~ bif - 4,
      first == "A" & item == "bif_23" ~ 4 - bif,
      first == "A" & item == "bif_24" ~ 4 - bif,
      first == "A" & item == "bif_25" ~ bif - 4,
      first == "B" & item == "bif_01" ~ bif - 4,
      first == "B" & item == "bif_02" ~ 4 - bif,
      first == "B" & item == "bif_03" ~ bif - 4,
      first == "B" & item == "bif_04" ~ bif - 4,
      first == "B" & item == "bif_05" ~ bif - 4,
      first == "B" & item == "bif_06" ~ 4 - bif,
      first == "B" & item == "bif_07" ~ bif - 4,
      first == "B" & item == "bif_08" ~ bif - 4,
      first == "B" & item == "bif_09" ~ 4 - bif,
      first == "B" & item == "bif_10" ~ bif - 4,
      first == "B" & item == "bif_11" ~ 4 - bif,
      first == "B" & item == "bif_12" ~ 4 - bif,
      first == "B" & item == "bif_13" ~ bif - 4,
      first == "B" & item == "bif_14" ~ bif - 4,
      first == "B" & item == "bif_15" ~ 4 - bif,
      first == "B" & item == "bif_16" ~ bif - 4,
      first == "B" & item == "bif_17" ~ 4 - bif,
      first == "B" & item == "bif_18" ~ 4 - bif,
      first == "B" & item == "bif_19" ~ 4 - bif,
      first == "B" & item == "bif_20" ~ bif - 4,
      first == "B" & item == "bif_21" ~ 4 - bif,
      first == "B" & item == "bif_22" ~ 4 - bif,
      first == "B" & item == "bif_23" ~ bif - 4,
      first == "B" & item == "bif_24" ~ bif - 4,
      first == "B" & item == "bif_25" ~ 4 - bif
    )
  )

bif_rel_wide <- bif_rel_long %>% 
  pivot_wider(
    id_cols = "id",
    names_from = "item",
    values_from = "bif"
  )

# Effect calculation -----------------------------------------------------------

## Item-level valence differences

bif_01_smd <- smd_calc_rel(bif_rel_wide$bif_01)
bif_02_smd <- smd_calc_rel(bif_rel_wide$bif_02)
bif_03_smd <- smd_calc_rel(bif_rel_wide$bif_03)
bif_04_smd <- smd_calc_rel(bif_rel_wide$bif_04)
bif_05_smd <- smd_calc_rel(bif_rel_wide$bif_05)
bif_06_smd <- smd_calc_rel(bif_rel_wide$bif_06)
bif_07_smd <- smd_calc_rel(bif_rel_wide$bif_07)
bif_08_smd <- smd_calc_rel(bif_rel_wide$bif_08)
bif_09_smd <- smd_calc_rel(bif_rel_wide$bif_09)
bif_10_smd <- smd_calc_rel(bif_rel_wide$bif_10)
bif_11_smd <- smd_calc_rel(bif_rel_wide$bif_11)
bif_12_smd <- smd_calc_rel(bif_rel_wide$bif_12)
bif_13_smd <- smd_calc_rel(bif_rel_wide$bif_13)
bif_14_smd <- smd_calc_rel(bif_rel_wide$bif_14)
bif_15_smd <- smd_calc_rel(bif_rel_wide$bif_15)
bif_16_smd <- smd_calc_rel(bif_rel_wide$bif_16)
bif_17_smd <- smd_calc_rel(bif_rel_wide$bif_17)
bif_18_smd <- smd_calc_rel(bif_rel_wide$bif_18)
bif_19_smd <- smd_calc_rel(bif_rel_wide$bif_19)
bif_20_smd <- smd_calc_rel(bif_rel_wide$bif_20)
bif_21_smd <- smd_calc_rel(bif_rel_wide$bif_21)
bif_22_smd <- smd_calc_rel(bif_rel_wide$bif_22)
bif_23_smd <- smd_calc_rel(bif_rel_wide$bif_23)
bif_24_smd <- smd_calc_rel(bif_rel_wide$bif_24)
bif_25_smd <- smd_calc_rel(bif_rel_wide$bif_25)

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

bif_d_rel <- bif_d %>% 
  select(item, everything())

## Difference across all items

bif_scale_smd_rel <- smd_calc_rel(bif_rel_long$bif)

# Export data ------------------------------------------------------------------

write.csv(bif_d_rel, "./data/validation/climr_bif-valence_relative.csv", row.names = FALSE)

