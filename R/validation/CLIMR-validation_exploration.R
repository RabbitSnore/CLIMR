################################################################################

# CLIMR -- Validation Pretest, Exploration and Comparison with External Data

################################################################################

# This script assumes you have already run CLIMR-validation_data_importation.R

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
                  "psychonetrics", 
                  "qgraph", 
                  "psych")

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

if (!file.exists(".data/validation/climr_validation_data.csv")) {
  
  osf_retrieve_file("618a53742730b700d75ce0e3") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

raw <- read.csv("./data/validation/climr_validation_data.csv")

# Download the Sánchez et al data from OSF if it is not already downloaded.

if (!file.exists(".data/validation/BIF Study Data.csv")) {
  
  osf_retrieve_file("5eb0a19469d3e10137de8ec2") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}


sanchez_raw <- read.csv("./data/validation/BIF Study Data.csv")


# Download the CLIMR replication of Amit et al. (2013, Experiment 2)

if (!file.exists(".data/validation/replication_data.csv")) {
  
  osf_retrieve_file("60919fa36801ab03712ab695") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}


amit_raw <- read.csv("./data/validation/replication_data.csv")

# Basic cleaning ---------------------------------------------------------------

temporal_2_raw <- raw %>% 
  filter(experiment == "temporal_2") %>% 
  select(
    experiment,
    sub,
    group,
    starts_with("t2")
  ) %>% 
  type_convert()

# Cleaning  --------------------------------------------------------------------

## CLIMR

bif_long <- temporal_2_raw %>% 
  pivot_longer(
    cols = starts_with("t2"),
    names_to = "item",
    values_to = "bif_response"
  ) %>% 
  filter(!is.na(bif_response)) %>% 
  filter(item != "t2_cc_1") %>% 
  mutate(
    item = gsub("t2_._", "", item)
  )

bif_wide <- bif_long %>% 
  pivot_wider(
    id_cols = c("sub", "group"),
    names_from = "item",
    values_from = "bif_response"
  )

## Sánchez et al (2021)

sanchez <- sanchez_raw %>% 
  filter(Exclude == 0)

sanchez_long <- sanchez %>% 
  select(-BIF_Total) %>% 
  pivot_longer(
    cols = starts_with("BIF"),
    names_to = "item",
    values_to = "bif_response"
  )

# CLIMR Amit et al

amit <- amit_raw %>% 
  select(id, starts_with("BIF")) %>% 
  pivot_longer(
    cols = starts_with("BIF"),
    names_to = "item",
    values_to = "bif_response"
  ) %>% 
  mutate(
    bif_response = bif_response - 1
  )

amit_wide <- amit %>% 
  pivot_wider(
    id_cols = "id",
    names_from = "item",
    values_from = "bif_response"
  )

# Correlations and Structure ---------------------------------------------------

## CLIMR

polycor_climr <- psych::polychoric(select(bif_wide, starts_with("bif")))

climr_efa_1 <- psych::fa(r = polycor_climr[[1]], nfactors = 1, n.obs = nrow(bif_wide), fm = "ml")

climr_parallel <- psych::fa.parallel(polycor_climr[[1]], n.obs = nrow(bif_wide), fm = "ml")

climr_alpha <- psych::alpha(polycor_climr[[1]], n.obs = nrow(bif_wide))
climr_omega <- psych::omega(polycor_climr[[1]], n.obs = nrow(bif_wide), fm = "ml")

log_model_climr <- glmer(bif_response ~ group + (1|sub) + (1|item), family = binomial(link = "logit"), data = bif_long)

log_model_climr_rs <- glmer(bif_response ~ group + (1|sub) + (1 + group|item), family = binomial(link = "logit"), data = bif_long)

### Network modeling

network_model_climr_1 <- varcov(data = select(bif_wide, starts_with("bif")),
                                # ordered = TRUE,
                                type = "ggm",
                                missing = "pairwise")

network_model_pruned_1 <- network_model_climr_1 %>% 
  prune(alpha = 0.001, recursive = TRUE)

network_model_final_1 <- network_model_pruned_1 %>% 
  stepup(
    alpha = 0.001
  )

network_fit_1 <- 
  network_model_final_1 %>% 
  runmodel()

climr_net_par <- parameters(network_fit_1)

climr_net_fit <- fit(network_fit_1)

climr_network_graph_1 <- 
  qgraph(getmatrix(network_fit_1, "omega"),
         layout = "spring")

## Sánchez et al

polycor_sanchez <- psych::polychoric(select(sanchez, starts_with("BIF"), -BIF_Total))

sanchez_efa_1 <- psych::fa(r = polycor_sanchez[[1]], nfactors = 1, n.obs = nrow(sanchez), fm = "ml")

sanchez_parallel <- psych::fa.parallel(polycor_sanchez[[1]], n.obs = nrow(sanchez), fm = "ml")

sanchez_alpha <- psych::alpha(polycor_sanchez[[1]], n.obs = nrow(sanchez))
sanchez_omega <- psych::omega(polycor_sanchez[[1]], n.obs = nrow(sanchez), fm = "ml")

log_model_sanchez <- glmer(bif_response ~ as.factor(Distance_condition) + (1|ID) + (1|item), family = binomial(link = "logit"), data = sanchez_long)

log_model_sanchez_rs <- glmer(bif_response ~ as.factor(Distance_condition) + (1|ID) + (1 + as.factor(Distance_condition)|item), family = binomial(link = "logit"), data = sanchez_long)

### Network modeling

network_model_sanchez_1 <- varcov(data = select(sanchez, starts_with("BIF"), -BIF_Total),
                                # ordered = TRUE,
                                type = "ggm",
                                missing = "pairwise")

network_sanchez_pruned_1 <- network_model_sanchez_1 %>% 
  prune(alpha = 0.001, recursive = TRUE)

network_sanchez_final_1 <- network_sanchez_pruned_1 %>% 
  stepup(
    alpha = 0.001
  )

network_sanchez_fit_1 <- 
  network_sanchez_final_1 %>% 
  runmodel()

sanchez_net_par <- parameters(network_sanchez_fit_1)

sanchez_net_fit <- fit(network_sanchez_fit_1)

sanchez_network_graph_1 <- 
  qgraph(getmatrix(network_sanchez_fit_1, "omega"),
         layout = "spring")

## CLIMR Amit et al

polycor_amit <- psych::polychoric(select(amit_wide, starts_with("BIF")))

amit_efa_1 <- psych::fa(r = polycor_climr[[1]], nfactors = 1, n.obs = nrow(bif_wide), fm = "ml")

amit_parallel <- psych::fa.parallel(polycor_climr[[1]], n.obs = nrow(bif_wide), fm = "ml")

amit_alpha <- psych::alpha(polycor_climr[[1]], n.obs = nrow(bif_wide))
amit_omega <- psych::omega(polycor_climr[[1]], n.obs = nrow(bif_wide), fm = "ml")

log_model_amit <- glmer(bif_response ~ group + (1|sub) + (1|item), family = binomial(link = "logit"), data = bif_long)

### Network modeling

network_model_amit_1 <- varcov(data = select(amit_wide, starts_with("BIF")),
                                # ordered = TRUE,
                                type = "ggm",
                                missing = "pairwise")

network_amit_pruned_1 <- network_model_amit_1 %>% 
  prune(alpha = 0.001, recursive = TRUE)

network_amit_final_1 <- network_amit_pruned_1 %>% 
  stepup(
    alpha = 0.001
  )

network_amit_fit_1 <- 
  network_amit_final_1 %>% 
  runmodel()

amit_net_par <- parameters(network_amit_fit_1)

amit_net_fit <- fit(network_amit_fit_1)

amit_network_graph_1 <- 
  qgraph(getmatrix(network_amit_fit_1, "omega"),
         layout = "spring")



