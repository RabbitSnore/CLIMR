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
    "climr_(temporal|spatial|social|likelihood)_((..)_..)_(..-?.*?)_(lab|online)_.*.csv") %>% 
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
      recorded_date  = RecordedDate,
      id_sona        = id
    ) %>% 
    mutate (
      lab_modality = paste(lab, modality, sep = "_")
    ) %>% 
    select(
      lab, modality, lab_modality, country, language, experiment,
      sub, id_subject, id_internal, id_sona,
      everything(),
      -Status, -Progress, -Finished, -starts_with("Recipient"),
      -DistributionChannel, -UserLanguage,
    ) %>% 
    type_convert()
  
  ## Handle deviations
          
  source("R/import/CLIMR_deviation-handling.R")
  
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
          -Status, -Progress, -Finished, -starts_with("Recipient"),
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
