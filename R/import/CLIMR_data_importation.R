################################################################################

# CLIMR -- Data Importation and Cleaning

################################################################################

# Load raw data ----------------------------------------------------------------

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

# Import pre-cleaned data ------------------------------------------------------

## Main data

if (read_precleaned == TRUE) {
  
  raw <- read.csv("./data/climr_complete_data.csv") # Replace with direct OSF download
  
}

## SEOI data

if (read_precleaned == TRUE) {
  
  seoi_complete <- read.csv("./data/climr_seoi_data.csv") # Replace with direct OSF download
  
}

# Basic cleaning ---------------------------------------------------------------

## Rename variables

raw <- raw %>% 
  rename(
    sub            = ResponseId,
    total_duration = Duration..in.seconds.
  ) %>% 
  mutate (
    lab = paste(lab, modality, sep = "_")
  )

## Separate variables by experiment

### Liberman & Trope (1998, Study 1)

temporal <- raw %>% 
  filter(experiment == "temporal") %>% 
  select(
    experiment,
    lab,
    modality,
    sub,
    group,
    starts_with("t_")
  ) %>% 
  type_convert()

### Fujita et al (2006, Study 1)

spatial_raw <- raw %>% 
  filter(experiment == "spatial") %>% 
  select(
    experiment,
    lab,
    modality,
    sub,
    group,
    starts_with("sp_")
  ) %>% 
  type_convert()

### Social Distance

social <- raw %>% 
  filter(experiment == "social") %>% 
  select(
    experiment,
    lab,
    modality,
    sub,
    group,
    starts_with("s_")
  ) %>% 
  type_convert()

### Likelihood Distance

likelihood_raw <- raw %>% 
  filter(experiment == "likelihood") %>% 
  select(
    experiment,
    lab,
    modality,
    sub,
    group,
    starts_with("l_")
  ) %>% 
  type_convert()

# Data exportation -------------------------------------------------------------

# This section of code exports the complete data and codebook base. If you are
# reproducing the analyses, you probably don't need this code, since the
# complete data should be packaged with the compendium or will be automatically
# downloaded. This code is primarily for use by the CLIMR team.

if (write_data == TRUE) {
  
  raw_complete <- bind_rows(temporal_raw, temporal_2_raw, spatial_raw, likelihood_raw)
  
  write.csv(raw_complete, "./data/climr_complete_data.csv", row.names = FALSE)

}

if (codebook_base == TRUE) {
  
  if (!exists("raw_complete")) {
    
    raw_complete <- bind_rows(temporal_raw, spatial_raw, social_raw, likelihood_raw)
    
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

# Cleaning - Liberman & Trope (1998, Study 1) ----------------------------------

## Calculate BIF scores

temporal_bif <- temporal_raw %>% 
  
  select(lab, modality, sub, condition = group, starts_with("t_c_bif"), starts_with("t_d_bif")) %>% 
  
  mutate(
    across(starts_with("t_c_bif"), as.numeric),
    across(starts_with("t_d_bif"), as.numeric)
  ) %>% 
  
  rowwise() %>% 
  mutate(
    y = case_when(
      condition == "close"   ~ sum(c_across(starts_with("t_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("t_d_bif")))
    )
  ) %>% 
  
  select(lab, modality, sub, condition, y)

## Adding comprehension checks

data_temporal <- temporal_raw %>% 
  
  select(sub, condition = group, t_c_compcheck, t_d_compcheck) %>% 
  
  pivot_longer(
    cols      = ends_with("compcheck"),
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
  
  left_join(temporal_bif, by = "sub") %>% 
  
  filter(complete.cases(y))


