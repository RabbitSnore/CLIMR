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
      modality  = V3
    )
  
  ### Get file paths
  
  parsed$file_paths <- paste("./data/raw/", file_names, sep = "")
  
  ## Load data
  
  raw_list      <- lapply(parsed$file_paths, read.csv)
  
  if (codebook_base == TRUE) {
    
    variable_text <- raw_list[[1]] %>% 
      slice(1) %>% 
      t() %>% 
      as.data.frame() %>% 
      rename(
        variable_text = V1
      ) %>% 
      mutate(
        variable_name = rownames(.)
      )
    
  }
  
  ### Link lab identifier
  
  for (i in 1:length(raw_list)) {
    
    raw_list[[i]]          <- raw_list[[i]] %>%
      slice(-1, -2)
    
    raw_list[[i]]$lab      <- parsed$lab[i]
    raw_list[[i]]$modality <- parsed$modality[i]
    
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
    modality,
    sub,
    group,
    starts_with("t1")
  ) %>% 
  type_convert()

### Liberman et al (1998, Study 1)

temporal_2_raw <- raw %>% 
  filter(experiment == "temporal_2") %>% 
  select(
    experiment,
    lab,
    modality,
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
    lab,
    modality,
    sub,
    group,
    starts_with("sp"),
    space_counter
  ) %>% 
  type_convert()

### Wakslak et al (2006, Study 1)

likelihood_raw <- raw %>% 
  filter(experiment == "likelihood") %>% 
  select(
    experiment,
    lab,
    modality,
    sub,
    group,
    starts_with("li")
  ) %>% 
  type_convert()

# Data exportation ----------------------------------------------------

if (write_data == TRUE) {
  
  raw_complete <- bind_rows(temporal_raw, temporal_2_raw, spatial_raw, likelihood_raw)
  
  write.csv(raw_complete, "./data/climr_complete_data.csv", row.names = FALSE)

}

if (codebook_base == TRUE) {
  
  if (!exists("raw_complete")) {
    
    raw_complete <- bind_rows(temporal_raw, temporal_2_raw, spatial_raw, likelihood_raw)
    
  }
  
  class_raw <- data.frame(
    variable_name = colnames(raw_complete),
    variable_type = unlist(lapply(raw_complete, class))
  )
    
  codebook <- variable_text %>% 
    filter(variable_name %in% colnames(raw_complete)) %>% 
    select(variable_name, variable_text) %>% 
    left_join(class_raw, by = "variable_name")
  
  write.csv(codebook, "./data/climr_codebook.csv", row.names = FALSE)
  
}

# Cleaning - Liberman et al (2002, Study 1) ---------------------------

## Calculate number of used categories

temporal_cat <- temporal_raw %>% 
  
  select(lab, sub, condition = group, starts_with("t1_c_"), starts_with("t1_d_")) %>% 
  
  pivot_longer(
    cols          = starts_with("t1_"),
    names_to      = c("group", "stimulus", "object"),
    names_pattern = "t1_(.)_(.*)_(.*)",
    values_to     = "cats"
  ) %>% 
  
  group_by(sub, stimulus, condition) %>% 
  
  summarise(
    y = max(cats, na.rm = TRUE)
  ) 

## Manipulation checks

temporal_mc <- temporal_raw %>%
  
  select(lab, sub, condition = group, starts_with("t1_mc_temp")) %>% 
  
  pivot_longer(
    cols          = starts_with("t1_mc_temp"),
    names_pattern = "t1_mc_(.*)_(\\d)\\.?\\d?",
    names_to      = c("distance", "scenario"),
    values_to     = "mc"
  ) %>% 
  
  filter(complete.cases(mc))

## Adding comprehension checks

data_temporal <- temporal_raw %>% 
  
  select(lab, modality, sub, starts_with("t1_cc_")) %>% 
  
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
  
  select(lab, modality, sub, condition = group, starts_with("t2_c_bif"), starts_with("t2_d_bif")) %>% 
  
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
  
  select(lab, modality, sub, condition, y)

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

## Manipulation checks

temporal_2_mc <- temporal_2_raw %>% 
  
  select(lab, modality, sub, condition = group, starts_with("t2_mc_temp")) %>% 
  
  pivot_longer(
    cols          = starts_with("t2_mc_"),
    names_pattern = "t2_mc_temp_(bif\\d\\d?)\\..",
    names_to      = "item",
    values_to     = "mc"
  ) %>% 
  
  filter(complete.cases(mc))

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
  
  select(lab, modality, sub, condition = group, starts_with("sp_cc_"), y = segments) %>%
  
  mutate(
    comp_check = case_when(
      condition == "close"   & sp_cc_1 == "1" & sp_cc_2 == "2" ~ 0,
      condition == "close"   & sp_cc_1 != "1" | sp_cc_2 != "2" ~ 1,
      condition == "distant" & sp_cc_1 == "1" & sp_cc_2 == "1" ~ 0,
      condition == "distant" & sp_cc_1 != "1" | sp_cc_2 != "1" ~ 1
    )
  ) %>% 
  
  select(-starts_with("sp_cc_"))

## Manipulation checks

spatial_mc <- spatial_raw %>%
  
  select(lab, sub, condition = group, sp_mc_c_spat, sp_mc_d_spat) %>% 
  
  pivot_longer(
    cols          = starts_with("sp_mc"),
    names_to      = "distance",
    values_to     = "mc"
  ) %>% 
  
  filter(complete.cases(mc))

# Cleaning - Wakslak et al (2006, Study 1) ----------------------------

## Calculate number of used categories

likelihood_cat <- likelihood_raw %>% 
  
  select(lab, modality, sub, condition = group, starts_with("li_c_"), starts_with("li_d_")) %>% 
  
  pivot_longer(
    cols          = starts_with("li_"),
    names_to      = c("group", "stimulus", "object"),
    names_pattern = "li_(.)_(.*)_(.*)",
    values_to     = "cats"
  ) %>% 

  group_by(lab, modality, sub, stimulus, condition) %>% 
  
  summarise(
    y = sum(cats, na.rm = TRUE)
  )

## Manipulation checks

likelihood_mc <- likelihood_raw %>%
  
  select(lab, sub, condition = group, starts_with("li_mc_c_lik"), starts_with("li_mc_d_lik")) %>% 
  
  pivot_longer(
    cols          = starts_with("li_mc"),
    names_pattern = "li_mc_._(.*)_(\\d)\\.?\\d?",
    names_to      = c("distance", "scenario"),
    values_to     = "mc"
  ) %>% 
  
  filter(complete.cases(mc))

## Adding comprehension checks

data_likelihood <- likelihood_raw %>% 
  
  select(lab, modality, sub, starts_with("li_cc_")) %>% 
  
  pivot_longer(
    cols          = starts_with("li_cc_"),
    names_to      = "stimulus",
    names_pattern = "li_cc_(.*)",
    values_to     = "comp_check"
  ) %>% 
  
  left_join(likelihood_cat, by = c("lab", "modality", "sub", "stimulus")) %>% 
  
  mutate(
    comp_check = case_when(
      condition == "close"   & comp_check == "1" ~ 0,
      condition == "close"   & comp_check == "2" ~ 1,
      condition == "distant" & comp_check == "1" ~ 1,
      condition == "distant" & comp_check == "2" ~ 0
    )
  )
