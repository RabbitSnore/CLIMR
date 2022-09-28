################################################################################

# CLIMR -- Validations, Exploration of BIF Spillover Effect Data

################################################################################

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr", "viridis", "leaflet", "osfr", "psychonetrics", "qgraph", "psych")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

# Import data ------------------------------------------------------------------

# This exploratory analysis combines all the data from the "spillover" effects
# assessed in the second validation study.

# Download the validation spillover data if it is not already downloaded

if (!file.exists("./data/validation/bridge_validation_data.csv")) {
  
  osf_retrieve_file("62176cc6b702cd0270fc4b30") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

bridge <- read.csv("./data/validation/bridge_validation_data.csv")

if (!file.exists("./data/validation/fruit-close_validation_data.csv")) {
  
  osf_retrieve_file("62176cc52538b80332264c50") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

fruit_close <- read.csv("./data/validation/fruit-close_validation_data.csv")

if (!file.exists("./data/validation/fruit-modified_validation_data.csv")) {
  
  osf_retrieve_file("62176cc77f411202a9fa17d3") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

fruit_mod <- read.csv("./data/validation/fruit-modified_validation_data.csv")

spillover <- bind_rows(
  select(bridge, sub, starts_with("bif")),
  select(fruit_close, sub, starts_with("bif")),
  select(fruit_mod, sub, starts_with("bif"))
)

# Explorations -----------------------------------------------------------------

## CLIMR (Spillover)

polycor_spill <- psych::polychoric(select(spillover, starts_with("bif")))

spill_efa_1 <- psych::fa(r = polycor_spill[[1]], nfactors = 1, n.obs = nrow(spillover), fm = "ml")

spill_parallel <- psych::fa.parallel(polycor_spill[[1]], n.obs = nrow(spillover), fm = "ml")

spill_alpha <- psych::alpha(polycor_spill[[1]], n.obs = nrow(spillover))
spill_omega <- psych::omega(polycor_spill[[1]], n.obs = nrow(spillover), fm = "ml")

### Network modeling

network_model_spill_1 <- varcov(data = select(spillover, starts_with("bif")),
                                # ordered = TRUE,
                                type = "ggm",
                                missing = "pairwise")

network_model_pruned_spill_1 <- network_model_spill_1 %>% 
  prune(alpha = 0.001, recursive = TRUE)

network_model_final_spill_1 <- network_model_pruned_spill_1 %>% 
  stepup(
    alpha = 0.001
  )

network_fit_spill_1 <- 
  network_model_final_spill_1 %>% 
  runmodel()

spill_net_par <- parameters(network_fit_spill_1)

spill_net_fit <- fit(network_fit_spill_1)

spill_network_graph_1 <- 
  qgraph(getmatrix(network_fit_spill_1, "omega"),
         layout = "spring")
