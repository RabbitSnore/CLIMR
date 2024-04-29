################################################################################

# CLIMR -- Validation of Linguistic Measures of Concreteness, Cleaning

################################################################################

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("dplyr", 
                  "tidyr", 
                  "stringr", 
                  "readr", 
                  "metafor", 
                  "lme4", 
                  "ggplot2", 
                  "cowplot", 
                  "rmarkdown", 
                  "ggbeeswarm", 
                  "ggstance", 
                  "simr", 
                  "viridis", 
                  "leaflet", 
                  "osfr",
                  "readxl", # Not included in broader project
                  "spacyr") # Not included in broader project

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

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

# Load raw data 

linguistic_raw <- read_csv("data/validation/climr_linguistic-validation_data.csv")

# Import Brysbaert et al (2014) folk concreteness dictionary

if (!file.exists("./data/validation/Concreteness_ratings_Brysbaert_et_al_BRM.xlsx")) {
  
  osf_retrieve_file("62003c64370e6c0630f3db86") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

concrete_dictionary <- 
  read_xlsx("./data/validation/Concreteness_ratings_Brysbaert_et_al_BRM.xlsx")

# Import LCM dictionary (Seih et al, 2017)

if (!file.exists("./data/validation/LCM.dic")) {
  
  osf_retrieve_file("5a11ec5e9ad5a102661d0906") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

lcm_dictionary <- read.delim("./data/validation/LCM.dic", 
                             sep = "\t", 
                             row.names = NULL,
                             header    = FALSE,
                             col.names = c("word", "verb_type"))

lcm_key <- lcm_dictionary %>% 
  slice(2:4)

lcm_dictionary <- lcm_dictionary %>% 
  slice(-(1:5))

lcm_dictionary <- lcm_dictionary %>% 
  mutate(
    verb_type = case_when(
      verb_type == 1 ~ "DAV",
      verb_type == 2 ~ "IAV",
      verb_type == 3 ~ "SV"
    )
  )

# Clean and wrangle ------------------------------------------------------------

linguistic_raw <- linguistic_raw %>% 
  slice(-1, -2) %>% 
  type_convert()

linguistic_long <- linguistic_raw %>% 
  pivot_longer(
    cols = colnames(select(linguistic_raw, 
                           starts_with("a_"), 
                           starts_with("c_"))),
    names_to       = c("distance", "type", "item"),
    names_pattern  = "(.)_(..)_(.)",
    values_to      = "text", 
    values_drop_na = TRUE
  )

linguistic_long$item   <- paste(linguistic_long$type, "_", linguistic_long$item,
                                sep = "")

linguistic_long$doc_id <- paste("text", 1:nrow(linguistic_long), sep = "")

# Natural language processing --------------------------------------------------

# Parse with spaCy

# This code assumes you have already set up spacyr

spacy_initialize()

linguistic_parsed <- linguistic_long %>% 
  pull(text) %>% 
  spacy_parse()

spacy_finalize()

# Folk concreteness

## Join with dictionary data

linguistic_parsed <- linguistic_parsed %>% 
  filter(pos != "PUNCT") %>% 
  left_join(concrete_dictionary, by = join_by(lemma == Word)) %>% 
  left_join(lcm_dictionary, by = join_by(lemma == word))

## LCM wrangling

linguistic_parsed <- linguistic_parsed %>% 
  mutate(
    lcm_word_type = case_when(
      !is.na(verb_type) ~ verb_type,
      pos == "NOUN"     ~ "NOUN",
      pos == "PROPN"    ~ "NOUN",
      pos == "ADJ"      ~ "ADJ"
    ),
    lcm_value = case_when( # For Seih et al (2017) LCM scoring
      lcm_word_type == "DAV"  ~ 1,
      lcm_word_type == "IAV"  ~ 2,
      lcm_word_type == "SV"   ~ 3,
      lcm_word_type == "ADJ"  ~ 4,
      lcm_word_type == "NOUN" ~ 5
    ),
    lcm_pd_value = case_when( # For Puddle-Duck scoring
      lcm_word_type == "DAV"  ~ 1,
      lcm_word_type == "IAV"  ~ 2,
      lcm_word_type == "SV"   ~ 3,
      lcm_word_type == "ADJ"  ~ 4,
      lcm_word_type == "NOUN" ~ 0
    ),
  )

## Create composite measures of concreteness

linguistic_summary <- linguistic_parsed %>% 
  group_by(doc_id) %>% 
  summarise(
    concreteness = mean(Conc.M, na.rm = TRUE),
    lcm          = mean(lcm_value, na.rm = TRUE),
    lcm_pd       = mean(lcm_pd_value, na.rm = TRUE)
  )
  
linguistic_long <- linguistic_long %>% 
  left_join(linguistic_summary, by = "doc_id")

# Export parsed data -----------------------------------------------------------

write_csv(linguistic_long, 
          "data/validation/climr_linguistic-validation_cleaned-parsed_data.csv")

