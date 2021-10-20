#######################################################################

# CLIMR -- Data Importation and Cleaning, Validation Pretest

#######################################################################

# Set up environment --------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the Many Legal Labs project

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr", "viridis", "leaflet")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)


# Load raw data -------------------------------------------------------

# This section of code is designed for use with the raw data downloaded directly
# from the survey platform. If you are reproducing the results, you probably do
# not need to use this code.

# Import data ---------------------------------------------

raw <- read.csv("./data/validation/climr_validation_data.csv") %>%  # Replace with direct OSF download
  slice(-1, -2)
  
# Basic cleaning ------------------------------------------------------

## Rename variables

raw <- raw %>% 
  rename(
    sub            = ResponseId,
    total_duration = Duration..in.seconds.
  )

## Separate variables by experiment

### Liberman et al (2002, Study 1)

temporal_raw <- raw %>% 
  filter(experiment == "temporal_1") %>% 
  select(
    experiment,
    sub,
    group,
    starts_with("t1")
  ) %>% 
  type_convert()

### Liberman & Trope (1998, Study 1)

temporal_2_raw <- raw %>% 
  filter(experiment == "temporal_2") %>% 
  select(
    experiment,
    sub,
    group,
    starts_with("t2")
  ) %>% 
  type_convert()

### Henderson et al (2006, Study 1)

spatial_raw <- raw %>% 
  filter(experiment == "spatial") %>% 
  select(
    experiment,
    sub,
    group,
    starts_with("sp"),
    space_counter
  ) %>% 
  type_convert()

# Cleaning - Liberman et al (2002, Study 1) ---------------------------

## Calculate number of used categories

temporal_cat <- temporal_raw %>% 
  
  select(sub, condition = group, starts_with("t1_c_"), starts_with("t1_d_")) %>% 
  
  pivot_longer(
    cols          = starts_with("t1_"),
    names_to      = c("group", "stimulus", "object"),
    names_pattern = "t1_(.)_(.*)_(.*)",
    values_to     = "cats"
  ) %>% 
  
  group_by(sub, stimulus, condition) %>% 
  
  summarise(
    y = max(cats, na.rm = TRUE),
    y = case_when(
      is.infinite(y) ~ NA_real_,
      !is.infinite(y) ~ y
    )
  ) 

## Adding comprehension checks

data_temporal <- temporal_raw %>% 
  
  select(sub, starts_with("t1_cc_")) %>% 
  
  pivot_longer(
    cols          = starts_with("t1_cc_"),
    names_to      = "stimulus",
    names_pattern = "t1_cc_(.*)",
    values_to     = "comp_check"
  ) %>% 
  
  left_join(temporal_cat, by = c("sub", "stimulus")) %>% 
  
  mutate(
    comp_check = case_when(
      condition == "close"   & comp_check == "1" ~ 0,
      condition == "close"   & comp_check == "2" ~ 1,
      condition == "distant" & comp_check == "1" ~ 1,
      condition == "distant" & comp_check == "2" ~ 0,
      comp_check == "3" & comp_check == "4"      ~ 1,
    )
  ) %>% 
  
  filter(complete.cases(y))

# Cleaning - Liberman et al (1998, Study 1) ---------------------------

## Calculate BIF scores

temporal_2_bif <- temporal_2_raw %>% 
  
  select(sub, condition = group, starts_with("t2_c_bif"), starts_with("t2_d_bif")) %>% 
  
  mutate(
    across(starts_with("t2_c_bif"), as.numeric),
    across(starts_with("t2_d_bif"), as.numeric)
  ) %>% 
  
  rowwise() %>% 
  mutate(
    y = case_when(
      condition == "close"   ~ sum(c_across(starts_with("t2_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("t2_d_bif")))
    )
  ) %>% 
  
  select(sub, condition, y)

## Adding comprehension checks

data_temporal_2 <- temporal_2_raw %>% 
  
  select(sub, condition = group, t2_cc_1) %>% 
  
  pivot_longer(
    cols      = t2_cc_1,
    names_to  = "block",
    values_to = "comp_check"
  ) %>% 
  
  filter(complete.cases(comp_check)) %>% 
  
  mutate(
    comp_check = case_when(
      comp_check == "1" & condition == "distant" ~ 0,
      comp_check == "2" & condition == "close"   ~ 0,
      comp_check == "1" & condition == "close"   ~ 1,
      comp_check == "2" & condition == "distant" ~ 1,
      comp_check == "3" | comp_check == "4"      ~ 1
    )
  ) %>% 
  
  select(sub, comp_check) %>% 
  
  left_join(temporal_2_bif, by = "sub") %>% 
  
  filter(complete.cases(y))

# Cleaning - Henderson et al (2006, Study 1) --------------------------

## Extract number of spacebar presses

spatial_seg <- spatial_raw %>% 
  
  mutate(
    segments = case_when(
      is.na(space_counter) ~ NA_integer_,
      !is.na(space_counter) ~ str_match_all(space_counter, "\\d*\\.\\d*") %>% sapply(length)
    )
  ) %>% 
  
  select(-space_counter)

## Adding comprehension checks

data_spatial <- spatial_seg %>% 
  
  select(sub, condition = group, starts_with("sp_cc_"), y = segments) %>%
  
  mutate(
    comp_check = case_when(
      condition == "close"   & (sp_cc_1 == "1" & sp_cc_2 == "2") ~ 0,
      condition == "close"   & (sp_cc_1 != "1" | sp_cc_2 != "2") ~ 1,
      condition == "distant" & (sp_cc_1 == "1" & sp_cc_2 == "1") ~ 0,
      condition == "distant" & (sp_cc_1 != "1" | sp_cc_2 != "1") ~ 1,
      sp_cc_2 == "3" | sp_cc_2 == "4" | is.na(sp_cc_2)           ~ 1
    )
  ) %>% 
  
  select(-starts_with("sp_cc_")) %>% 
  
  filter(complete.cases(y))
