################################################################################

# CLIMR -- Validation 2, Exploration

################################################################################

# This script assumes you have already run CLIMR-validation-2_data_importation.R

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("psychonetrics", "qgraph", "psych")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

# Import data ------------------------------------------------------------------

## Create necessary directories and download data from OSF for Grinfeld et al.

if (!dir.exists("./data/validation/grinfeld/")) {
  
  dir.create("./data/validation/grinfeld/")
  
}

if (!file.exists("./data/validation/grinfeld/study2B.csv")) {
  
  osf_retrieve_file("6042607a035cf704b8c84d42") %>% 
    osf_download(path = "./data/validation/grinfeld/",
                 conflicts = "overwrite")
  
}

grinfeld_2b     <- read.csv("./data/validation/grinfeld/study2B.csv")

if (!file.exists("./data/validation/grinfeld/study2C.csv")) {
  
  osf_retrieve_file("6042607a67386c048261f97a") %>% 
    osf_download(path = "./data/validation/grinfeld/",
                 conflicts = "overwrite")
  
}

grinfeld_2c     <- read.csv("./data/validation/grinfeld/study2C.csv")

if (!file.exists(".data/validation/grinfeld/study2C_rep.csv")) {
  
  osf_retrieve_file("61e68037466d1505ffd564b6") %>% 
    osf_download(path = "./data/validation/grinfeld/",
                 conflicts = "overwrite")
  
}

grinfeld_2c_rep <- read.csv("./data/validation/grinfeld/study2C_rep.csv")

# Wrangle ----------------------------------------------------------------------

grinfeld_2b_bif <- grinfeld_2b %>% 
  pivot_longer(
    cols = c(ends_with("_A"), ends_with("_H")),
    names_pattern = "(.*)_.",
    names_to = "item",
    values_to = "bif_response"
  ) %>% 
  filter(complete.cases(bif_response)) %>% 
  pivot_wider(
    id_cols = "workerId",
    names_from = "item",
    values_from = "bif_response"
  )

grinfeld_2c_bif <- grinfeld_2c %>% 
  pivot_longer(
    cols = c(ends_with("_A"), ends_with("_H")),
    names_pattern = "(.*)_.",
    names_to = "item",
    values_to = "bif_response"
  ) %>% 
  filter(complete.cases(bif_response)) %>% 
  pivot_wider(
    id_cols = "workerId",
    names_from = "item",
    values_from = "bif_response"
  )

grinfeld_2c_rep_bif <- grinfeld_2c_rep %>% 
  pivot_longer(
    cols = c(ends_with("_A"), ends_with("_H")),
    names_pattern = "(.*)_.",
    names_to = "item",
    values_to = "bif_response"
  ) %>% 
  filter(complete.cases(bif_response)) %>% 
  pivot_wider(
    id_cols = "workerId",
    names_from = "item",
    values_from = "bif_response"
  )

## Data for modeling

grinfeld_2b_test <- grinfeld_2b_bif %>% 
  left_join(select(grinfeld_2b, workerId, condition), by = "workerId")

grinfeld_2b_long <- grinfeld_2b_test %>% 
  pivot_longer(
    cols = colnames(select(grinfeld_2b_test, -workerId, -condition)),
    names_to = "item",
    values_to = "bif"
  )

grinfeld_2c_test <- grinfeld_2c_bif %>% 
  left_join(select(grinfeld_2c, workerId, condition), by = "workerId")

grinfeld_2c_long <- grinfeld_2c_test %>% 
  pivot_longer(
    cols = colnames(select(grinfeld_2c_test, -workerId, -condition)),
    names_to = "item",
    values_to = "bif"
  )

grinfeld_2c_rep_test <- grinfeld_2c_rep_bif %>% 
  left_join(select(grinfeld_2c, workerId, condition), by = "workerId")

grinfeld_2c_rep_long <- grinfeld_2c_rep_test %>% 
  pivot_longer(
    cols = colnames(select(grinfeld_2c_rep_test, -workerId, -condition)),
    names_to = "item",
    values_to = "bif"
  )

# Explorations -----------------------------------------------------------------

# CLIMR spillover data is now in CLIMR-validation-spillover_exploration.R

# ## Krüger et al. (2014) Study 4, close replication
# 
# polycor_fruit_close <- psych::polychoric(select(fruit_close, starts_with("bif"), -bif_total))
# 
# fruit_close_efa_1 <- psych::fa(r = polycor_fruit_close[[1]], nfactors = 1, n.obs = nrow(fruit_close), fm = "ml")
# 
# fruit_close_parallel <- psych::fa.parallel(polycor_fruit_close[[1]], n.obs = nrow(fruit_close), fm = "ml")
# 
# fruit_close_alpha <- psych::alpha(polycor_fruit_close[[1]], n.obs = nrow(fruit_close))
# fruit_close_omega <- psych::omega(polycor_fruit_close[[1]], n.obs = nrow(fruit_close), fm = "ml")
# 
# ## Krüger et al. (2014) Study 4, modified replication
# 
# polycor_fruit_modified <- psych::polychoric(select(fruit_modified, starts_with("bif"), -bif_total))
# 
# fruit_modified_efa_1 <- psych::fa(r = polycor_fruit_modified[[1]], nfactors = 1, n.obs = nrow(fruit_modified), fm = "ml")
# 
# fruit_modified_parallel <- psych::fa.parallel(polycor_fruit_modified[[1]], n.obs = nrow(fruit_modified), fm = "ml")
# 
# fruit_modified_alpha <- psych::alpha(polycor_fruit_modified[[1]], n.obs = nrow(fruit_modified))
# fruit_modified_omega <- psych::omega(polycor_fruit_modified[[1]], n.obs = nrow(fruit_modified), fm = "ml")
# 
# ## Krüger et al. (2014) Study 1, validation
# 
# polycor_bridges <- psych::polychoric(select(bridges, starts_with("bif"), -bif_total))
# 
# bridges_efa_1 <- psych::fa(r = polycor_bridges[[1]], nfactors = 1, n.obs = nrow(bridges), fm = "ml")
# 
# bridges_parallel <- psych::fa.parallel(polycor_bridges[[1]], n.obs = nrow(bridges), fm = "ml")
# 
# bridges_alpha <- psych::alpha(polycor_bridges[[1]], n.obs = nrow(bridges))
# bridges_omega <- psych::omega(polycor_bridges[[1]], n.obs = nrow(bridges), fm = "ml")

## Grinfeld et al, Study 2B

polycor_grinfeld_2b_bif <- psych::polychoric(select(grinfeld_2b_bif, -workerId))

grinfeld_2b_bif_efa_1 <- psych::fa(r = polycor_grinfeld_2b_bif[[1]], nfactors = 1, n.obs = nrow(grinfeld_2b_bif), fm = "ml")

grinfeld_2b_bif_parallel <- psych::fa.parallel(polycor_grinfeld_2b_bif[[1]], n.obs = nrow(grinfeld_2b_bif), fm = "ml")

grinfeld_2b_bif_alpha <- psych::alpha(polycor_grinfeld_2b_bif[[1]], n.obs = nrow(grinfeld_2b_bif))
grinfeld_2b_bif_omega <- psych::omega(polycor_grinfeld_2b_bif[[1]], n.obs = nrow(grinfeld_2b_bif), fm = "ml")

## Grinfeld et al, Study 2C

polycor_grinfeld_2c_bif <- psych::polychoric(select(grinfeld_2c_bif, -workerId))

grinfeld_2c_bif_efa_1 <- psych::fa(r = polycor_grinfeld_2c_bif[[1]], nfactors = 1, n.obs = nrow(grinfeld_2c_bif), fm = "ml")

grinfeld_2c_bif_parallel <- psych::fa.parallel(polycor_grinfeld_2c_bif[[1]], n.obs = nrow(grinfeld_2c_bif), fm = "ml")

grinfeld_2c_bif_alpha <- psych::alpha(polycor_grinfeld_2c_bif[[1]], n.obs = nrow(grinfeld_2c_bif))
grinfeld_2c_bif_omega <- psych::omega(polycor_grinfeld_2c_bif[[1]], n.obs = nrow(grinfeld_2c_bif), fm = "ml")

## Grinfeld et al, Study 2C Replication

polycor_grinfeld_2c_rep_bif <- psych::polychoric(select(grinfeld_2c_rep_bif, -workerId))

grinfeld_2c_rep_bif_efa_1 <- psych::fa(r = polycor_grinfeld_2c_rep_bif[[1]], nfactors = 1, n.obs = nrow(grinfeld_2c_rep_bif), fm = "ml")

grinfeld_2c_rep_bif_parallel <- psych::fa.parallel(polycor_grinfeld_2c_rep_bif[[1]], n.obs = nrow(grinfeld_2c_rep_bif), fm = "ml")

grinfeld_2c_rep_bif_alpha <- psych::alpha(polycor_grinfeld_2c_rep_bif[[1]], n.obs = nrow(grinfeld_2c_rep_bif))
grinfeld_2c_rep_bif_omega <- psych::omega(polycor_grinfeld_2c_rep_bif[[1]], n.obs = nrow(grinfeld_2c_rep_bif), fm = "ml")

## Modeling of BIF responses

log_model_grinfeld_2b        <- glmer(bif ~ condition + (1|workerId) + (1|item), family = binomial(link = "logit"), data = grinfeld_2b_long)
log_model_grinfeld_2b_rs     <- glmer(bif ~ condition + (1|workerId) + (1 + condition|item), family = binomial(link = "logit"), data = grinfeld_2b_long)

log_model_grinfeld_2c        <- glmer(bif ~ condition + (1|workerId) + (1|item), family = binomial(link = "logit"), data = grinfeld_2c_long)
log_model_grinfeld_2c_rs     <- glmer(bif ~ condition + (1|workerId) + (1 + condition|item), family = binomial(link = "logit"), data = grinfeld_2c_long)

log_model_grinfeld_2c_rep    <- glmer(bif ~ condition + (1|workerId) + (1|item), family = binomial(link = "logit"), data = grinfeld_2c_rep_long)
log_model_grinfeld_2c_rep_rs <- glmer(bif ~ condition + (1|workerId) + (1 + condition|item), family = binomial(link = "logit"), data = grinfeld_2c_rep_long)

