#######################################################################

# CLIMR -- Data Importation and Cleaning

#######################################################################

# Load raw data -------------------------------------------------------

# This section of code is designed for use with the raw data downloaded directly
# from the survey platform. If you are reproducing the results, you probably do
# not need to use this code.

if (read_precleaned == FALSE) {
  
  ## Get file names, lab information, and paths
  
  file_names <- list.files("./data/raw/")
  
  ### Parse file names
  
  parsed <- str_match(file_names, "climr_(.*)_(.*).csv") %>% 
    as.data.frame() %>% 
    rename(
      file_name = V1,
      lab       = V2,
      mode      = V3
    )
  
  ### Get file paths
  
  parsed$file_paths <- paste("./data/raw/", file_names, sep = "")
  
  ## Load data
  
  raw_list <- lapply(parsed$file_paths, read.csv)
  
  ### Link lab identifier
  
  for (i in 1:length(raw_list)) {
    
    raw_list[[i]]$lab  <- parsed$lab[i]
    raw_list[[i]]$mode <- parsed$mode[i]
    
  }
  
  ### Bind all data
  
  raw <- bind_rows(raw_list)
  
}

# Import pre-cleaned data ---------------------------------------------

if (read_precleaned == TRUE) {
  
  raw <- read.csv("./data/climr_complete_data.csv") # Replace with direct OSF download
  
}

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
    lab,
    mode,
    sub,
    group,
    starts_with("t1")
  )

### Liberman et al (1998, Study 1)

temporal_2_raw <- raw %>% 
  filter(experiment == "temporal_2") %>% 
  select(
    experiment,
    lab,
    mode,
    sub,
    group,
    starts_with("t2")
  )

### Henderson et al (2006, Study 1)

spatial_raw <- raw %>% 
  filter(experiment == "spatial") %>% 
  select(
    experiment,
    lab,
    mode,
    sub,
    group,
    starts_with("sp")
  )

### Wakslak et al (2006, Study 1)

likelihood_raw <- raw %>% 
  filter(experiment == "likelihood") %>% 
  select(
    experiment,
    lab,
    mode,
    sub,
    group,
    starts_with("li")
  )

# Data exportation ----------------------------------------------------

if (write_data == TRUE) {
  
  raw_complete <- bind_rows(temporal_raw, temporal_2_raw, spatial_raw, likelihood_raw)
  
  write.csv(raw_complete, "./data/climr_complete_data.csv")
  
}

# Cleaning - Liberman et al (2002, Study 1) ---------------------------

## Calculate number of used categories

temporal_cat <- temporal_raw %>% 
  
  select(lab, sub, condition = group, starts_with("t1_c_"), starts_with("t1_d_")) %>% 
  
  pivot_longer(
    cols          = starts_with("t1_"),
    names_to      = c("group", "stimulus", "category"),
    names_pattern = "t1_(.)_(.*)_(.*)",
    values_to     = "objects"
  ) %>% 
  
  mutate(
    objects = case_when(
      objects != "" ~ 1,
      objects == "" ~ 0
      )
  ) %>% 
  
  group_by(sub, stimulus, condition) %>% 
  
  summarise(
    y = sum(objects, na.rm = TRUE)
  ) 

## Adding comprehension checks

data_temporal <- temporal_raw %>% 
  
  select(lab, mode, sub, starts_with("t1_cc_")) %>% 
  
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
    )
  )

# Cleaning - Liberman et al (1998, Study 1) ---------------------------

## Calculate BIF scores

temporal_2_bif <- temporal_2_raw %>% 
  
  select(lab, mode, sub, condition = group, starts_with("t2_c_bif"), starts_with("t2_d_bif")) %>% 
  
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
  
  select(lab, mode, sub, condition, y)

## Adding comprehension checks

data_temporal_2 <- temporal_2_raw %>% 
  
  select(sub, condition = group, t2_cc) %>% 
  
  mutate(
    comp_check = case_when(
      condition == "close"   & t2_cc == "2" ~ 0,
      condition == "close"   & t2_cc != "2" ~ 1,
      condition == "distant" & t2_cc == "1" ~ 0,
      condition == "distant" & t2_cc != "1" ~ 1
    )
  ) %>% 
  
  select(sub, comp_check) %>% 
  
  left_join(temporal_2_bif, by = "sub")

# Cleaning - Henderson et al (2006, Study 1) --------------------------

data_spatial <- spatial_raw %>% 
  
  select(lab, mode, sub, condition = group, starts_with("sp_cc_"), y = space_bar) %>% # replace with actual space bar variable 
  
  mutate(
    comp_check = case_when(
      condition == "close"   & sp_cc_1 == "1" & sp_cc_2 == "2" ~ 0,
      condition == "close"   & sp_cc_1 != "1" | sp_cc_2 != "2" ~ 1,
      condition == "distant" & sp_cc_1 == "1" & sp_cc_2 == "1" ~ 0,
      condition == "distant" & sp_cc_1 != "1" | sp_cc_2 != "1" ~ 1
    )
  ) %>% 
  
  select(-starts_with("sp_cc_"))

# Cleaning - Wakslak et al (2006, Study 1) ----------------------------

## Calculate number of used categories

data_likelihood <- likelihood_raw %>% 
  
  select(lab, mode, sub, condition = group, starts_with("li_c_")    , starts_with("li_d_")) %>% 
  
  pivot_longer(
    cols          = starts_with("li_"),
    names_to      = c("group", "stimulus", "category"),
    names_pattern = "li_(.)_(.*)_(.*)",
    values_to     = "objects"
  ) %>% 
  
  mutate(
    objects = case_when(
      objects != "" ~ 1,
      objects == "" ~ 0
    )
  ) %>% 
  
  group_by(lab, mode, sub, stimulus, condition) %>% 
  
  summarise(
    y = sum(objects, na.rm = TRUE)
  )

## Adding comprehension checks

likeihood_cc <- likelihood_raw %>% 
  
  select(lab, mode, sub, starts_with("li_cc_")) %>% 
  
  pivot_longer(
    cols          = starts_with("li_cc_"),
    names_to      = "stimulus",
    names_pattern = "li_cc_(.*)",
    values_to     = "comp_check"
  ) %>% 
  
  left_join(likelihood_cat, by = c("lab", "sub", "stimulus")) %>% 
  
  mutate(
    comp_check = case_when(
      condition == "close"   & comp_check == "1" ~ 0,
      condition == "close"   & comp_check == "2" ~ 1,
      condition == "distant" & comp_check == "1" ~ 1,
      condition == "distant" & comp_check == "2" ~ 0
    )
  )
