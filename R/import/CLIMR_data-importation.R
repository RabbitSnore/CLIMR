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
      recorded_date  = RecordedDate
    ) %>% 
    mutate (
      lab_modality = paste(lab, modality, sep = "_")
    ) %>% 
    select(
      lab, modality, lab_modality, country, language, experiment,
      sub, id_subject, id_internal,
      everything(),
      -Status, -Progress, -Finished, -starts_with("Recipient"),
      -DistributionChannel, -UserLanguage,
    ) %>% 
    type_convert()
  
  ## Handle deviations
  
  # The code below handles technical errors and cases where there were
  # deviations from the procedures. This code is not optimized for efficiency.
  # Rather, it is written to make it easy to add and remove components and to be
  # transparent about each step in the process. As a consequence, it may run
  # somewhat slowly, but none of the operations are very computationally
  # demanding.
  
  ### AU_04, AU_01: Known duplicate submissions
  
  # There are notes about this case of known duplicate submissions included in
  # the comments of the script that handles these cases.
  
  source("R/import/CLIMR_duplicate-data-handling.R")
  
  ### MY_01: Test cases
  
  # Lab MY_01 included a test run case in the data, which should be removed
  # prior to analysis. This case is marked with "PILOT" as it ID.
  
  raw <- raw %>% 
    filter(id_subject != "PILOT" | is.na(id_subject))
  
  ### NL_02: Test cases
  
  # NL_02 reported testing the experiments a few times, flagging their test
  # cases using the subject ID variable. These cases should be removed.

  raw <- raw %>% 
    filter(!str_detect(id_subject, "test|Test") | is.na(id_subject))
  
  ### US_12: Incorrect surveys for some participants and test cases
  
  # Notes about a technical error are included in the script that is run below
  
  source("R/import/CLIMR_survey-error-handling.R")
  
  # US_12 reported testing the experiments a few times, flagging their test
  # cases using the subject ID variable. These cases should be removed.
  
  raw <- raw %>% 
    filter(id_subject != "US_12_9998"  | is.na(id_subject)) %>% 
    filter(id_subject != "US_12_9999"  | is.na(id_subject)) %>% 
    filter(id_subject != "US_12_99999" | is.na(id_subject)) %>% 
    filter(id_subject != "us129999"    | is.na(id_subject))
  
  ### Duplicated participant IDs
  
  # Some labs reported accidentally reusing some participant ID values These
  # values are not used in any analysis, so these non-unique cases are retained.
  # They don't seem to pose any practical issue, since the Qualtrics response ID
  # still identifies each unique response.
  
  ### Removal of known invalid or incomplete cases 
  
  # There are some cases that should be removed because of their missing or
  # invalid demographic information. In these rows of data, there are no
  # responses to the experimental questions, since the session was terminated
  # prior to responding to any items or because the would-be participant entered
  # invalid information (e.g., being under 18) and was thus prevented from
  # proceeding. These cases should be removed.
  
  raw <- raw %>% 
    filter(age >= 18 & !is.na(age))
  
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
