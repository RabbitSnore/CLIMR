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
  
  parsed <- str_match(
    file_names, 
    "climr_(temporal|spatial|social|likelihood)_((..)_..)_(..)_(lab|online)_.*.csv") %>% 
    as.data.frame()
  
  colnames(parsed) <- c(
    "filename",
    "experiment",
    "lab",
    "country",
    "language",
    "modality"
  )
  
  ### Get file paths
  
  parsed$file_paths <- paste("./data/raw/", file_names, sep = "")
  
  ## Load data
  
  raw_list <- lapply(parsed$file_paths, read.csv)

  ### Link lab identifier
  
  for (i in 1:length(raw_list)) {
    
    raw_list[[i]]          <- raw_list[[i]] %>%
      slice(-1, -2)
    
    raw_list[[i]]$experiment <- parsed$experiment[i]
    raw_list[[i]]$lab        <- parsed$lab[i]
    raw_list[[i]]$country    <- parsed$country[i]
    raw_list[[i]]$language   <- parsed$language[i]
    raw_list[[i]]$modality   <- parsed$modality[i]
    
  }
  
  ### Bind all data
  
  raw <- bind_rows(raw_list)
  
  ## Basic cleaning and renaming
  
  raw <- raw %>% 
    rename(
      sub            = ResponseId,
      total_duration = Duration..in.seconds.,
      start_date     = StartDate,
      end_date       = EndDate,
      recorded_date  = RecordedDate
    ) %>% 
    mutate (
      lab_modality = paste(lab, modality, sep = "_")
    ) %>% 
    select(
      lab, modality, lab_modality, country, language, experiment,
      sub, id_subject, id_internal,
      everything(),
      -Status, -IPAddress, -Progress, -Finished, -starts_with("Recipient"),
      -ExternalReference, -LocationLatitude, -LocationLongitude, 
      -DistributionChannel, -UserLanguage
    ) %>% 
    type_convert()
  
  ## Create codebook information
  
  if (codebook_base == TRUE) {
    
    extract_var_text <- function(x) {
      
      x$file_paths %>% 
      read.csv() %>%
        rename(
          sub            = ResponseId,
          total_duration = Duration..in.seconds.,
          start_date     = StartDate,
          end_date       = EndDate,
          recorded_date  = RecordedDate
        ) %>% 
        select(
          sub, id_subject, id_internal,
          everything(),
          -Status, -IPAddress, -Progress, -Finished, -starts_with("Recipient"),
          -ExternalReference, -LocationLatitude, -LocationLongitude, 
          -DistributionChannel, -UserLanguage
        ) %>% 
        slice(1) %>% 
        t() %>% 
        as.data.frame() %>% 
        rename(
          variable_text = V1
        ) %>% 
        mutate(
          variable_name = rownames(.)
        ) %>% 
        select(
          variable_name, variable_text
        )
      
    }
    
    temporal_first <- parsed %>% 
      filter(experiment == "temporal") %>%
      slice(1)
    
    spatial_first <- parsed %>% 
      filter(experiment == "spatial") %>%
      slice(1)
    
    social_first <- parsed %>% 
      filter(experiment == "social") %>%
      slice(1)
    
    likelihood_first <- parsed %>% 
      filter(experiment == "likelihood") %>%
      slice(1)
    
    temporal_var_text   <- extract_var_text(temporal_first)
    spatial_var_text    <- extract_var_text(spatial_first)
    social_var_text     <- extract_var_text(social_first)
    likelihood_var_text <- extract_var_text(likelihood_first)
    
    variable_text       <- bind_rows(
      temporal_var_text, spatial_var_text,
      social_var_text, likelihood_var_text
      ) %>% 
      unique()
    
  }
  
}

# Import pre-cleaned data ------------------------------------------------------

## Main data

if (read_precleaned == TRUE) {
  
  raw <- read.csv("./data/climr_complete-data.csv") # Replace with direct OSF download
  
}

# Wrangling for Analysis -------------------------------------------------------

# Separate variables by experiment and remove empty columns

## Liberman & Trope (1998, Study 1)

temporal_raw <- raw %>% 
  filter(experiment == "temporal")

temporal <- temporal_raw[, sapply(temporal_raw, 
                                  function(x) { !all(is.na(x)) })]

## Fujita et al (2006, Study 1)

spatial_raw <- raw %>% 
  filter(experiment == "spatial")

spatial <- spatial_raw[, sapply(spatial_raw, 
                                function(x) { !all(is.na(x)) })]

## Social Distance

social_raw <- raw %>% 
  filter(experiment == "social")

social <- social_raw[, sapply(social_raw, 
                              function(x) { !all(is.na(x)) })]

## Likelihood Distance

likelihood_raw <- raw %>% 
  filter(experiment == "likelihood")

likelihood <- likelihood_raw[, sapply(likelihood_raw, 
                                      function(x) { !all(is.na(x)) })]

# Data exportation -------------------------------------------------------------

# This section of code exports the complete data and codebook base. If you are
# reproducing the analyses, you probably don't need this code, since the
# complete data should be packaged with the compendium or will be automatically
# downloaded. This code is primarily for use by the CLIMR team.

if (write_data == TRUE) {
  
  write.csv(raw, "./data/climr_complete_data.csv", row.names = FALSE)

}

if (codebook_base == TRUE) {
  
  class_raw <- data.frame(
    variable_name = colnames(raw),
    variable_type = map_vec(raw, function(x) { class(x)[[1]] })
  )
  
  codebook <- class_raw %>% 
    left_join(variable_text, by = "variable_name")
  
  write.csv(codebook, "./data/climr_codebook.csv", row.names = FALSE)
  
}

# Cleaning - Liberman & Trope (1998, Study 1) ----------------------------------

## Calculate BIF scores

temporal_bif <- temporal %>% 
  select(lab, modality, sub, condition, 
         starts_with("t_c_bif"), starts_with("t_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("t_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("t_d_bif")))
    )
  )

## Adding comprehension checks

data_temporal <- temporal_raw %>% 
  select(sub, condition, ends_with("compcheck")) %>% 
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
      comp_check != "1" & condition == "distant" ~ 1, # 1 indicates an error
      comp_check != "2" & condition == "close"   ~ 1
    )
  ) %>% 
  select(sub, comp_check) %>% 
  left_join(temporal_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

# Cleaning - Fujita et al (2006, Study 1) --------------------------------------

## Calculate BIF scores

spatial_bif <- spatial %>% 
  select(lab, modality, sub, condition, 
         starts_with("sp_c_bif"), starts_with("sp_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("sp_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("sp_d_bif")))
    )
  )

## Adding comprehension checks

data_spatial <- spatial_raw %>% 
  select(sub, condition, sp_compcheck_c, sp_compcheck_d) %>% 
  pivot_longer(
    cols      = c("sp_compcheck_c", "sp_compcheck_d"),
    names_to  = "block",
    values_to = "comp_check"
  ) %>% 
  filter(complete.cases(comp_check)) %>% 
  mutate(
    comp_check = case_when(
      comp_check == "2" & condition == "distant" ~ 0,
      comp_check == "1" & condition == "close"   ~ 0,
      comp_check != "2" & condition == "distant" ~ 1, # 1 indicates an error
      comp_check != "1" & condition == "close"   ~ 1
    )
  ) %>% 
  select(sub, comp_check) %>% 
  left_join(spatial_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

# Cleaning - Social Distance ---------------------------------------------------

## Calculate BIF scores

social_bif <- social %>% 
  select(lab, modality, sub, condition, 
         starts_with("so_c_bif"), starts_with("so_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("so_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("so_d_bif")))
    )
  )

## Adding comprehension checks

data_social <- social_raw %>% 
  select(sub, condition, starts_with("comp")) %>% 
  mutate(
    comp_check = case_when(
      !is.na(female_young) & female_young == comp_female_1990 ~ 0,
      !is.na(female_young) & female_young != comp_female_1990 ~ 1,
      !is.na(female_old)   & female_old   == comp_female_1960 ~ 0,
      !is.na(female_old)   & female_old   != comp_female_1960 ~ 1,
      !is.na(male_young)   & male_young   == comp_male_1990   ~ 0,
      !is.na(male_young)   & male_young   != comp_male_1990   ~ 1,
      !is.na(male_old)     & male_old     == comp_male_1960   ~ 0,
      !is.na(male_old)     & male_old     != comp_male_1960   ~ 1,
      !is.na(unisex)       & unisex       == comp_female_1990 ~ 0,
      !is.na(unisex)       & unisex       != comp_nonbinary   ~ 1
    )
  ) %>% 
  select(sub, comp_check) %>% 
  left_join(social_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

# Cleaning - Likelihood Distance -----------------------------------------------

## Calculate BIF scores

likelihood_bif <- likelihood %>% 
  select(lab, modality, sub, condition, 
         starts_with("l_c_bif"), starts_with("l_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("l_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("l_d_bif")))
    )
  )

## Adding comprehension checks

data_likelihood <- likelihood_raw %>% 
  select(sub, condition, l_compcheck_c, l_compcheck_d) %>% 
  pivot_longer(
    cols      = c("l_compcheck_c", "l_compcheck_d"),
    names_to  = "block",
    values_to = "comp_check"
  ) %>% 
  filter(complete.cases(comp_check)) %>% 
  mutate(
    comp_check = case_when(
      comp_check == "1" & condition == "distant" ~ 0,
      comp_check == "6" & condition == "close"   ~ 0,
      comp_check != "1" & condition == "distant" ~ 1, # 1 indicates an error
      comp_check != "6" & condition == "close"   ~ 1
    )
  ) %>% 
  select(sub, comp_check) %>% 
  left_join(likelihood_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)
