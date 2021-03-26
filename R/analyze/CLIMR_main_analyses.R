#######################################################################

# CLIMR -- Meta-Analytic Models

#######################################################################

# Set up environment --------------------------------------------------

## Load functions

source("./R/functions/CLIMR_visualization_functions.R")
source("./R/functions/CLIMR_meta_analytic_functions.R")

## Load data

# NOTE
# Insert code here to load the effect size data

### Load original effects

original <- read.csv("./data/CLT_original.csv")

## Study colors

liberman_2002_color  <- "#37392E"
liberman_1998_color  <- "#B9E28C"
henderson_2006_color <- "#A47C79"
wakslak_2006_color   <- "#19647E"
tversky_1981_color   <- "#96BDC6"

study_colors <- c(liberman_2002_color,
                  liberman_1998_color,
                  henderson_2006_color,
                  wakslak_2006_color)

# Meta-analysis and forest plot for each experiment -------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

### Primary meta-analysis

meta_temporal <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal)

### Comprehension check meta-analysis

meta_temporal_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal_comp)

### Forest plot

forest_temporal <- forest_plot(
  replication_data = effects_temporal, 
  meta_analysis    = meta_temporal,
  org_d            = original$d[original$study == "temporal"],
  org_ci_lower     = original$ci_lower[original$study == "temporal"], 
  org_ci_upper     = original$ci_upper[original$study == "temporal"], 
  title            = "Liberman et al. (2002, Study 1)", 
  study_color      = liberman_2002_color
  )

## Liberman & Trope (1998, Study 1): Temporal Distance ----------------

### Primary meta-analysis

meta_temporal_2 <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal_2)

### Comprehension check meta-analysis

meta_temporal_2_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal_2_comp)

### Forest plot

forest_temporal_2 <- forest_plot(
  replication_data = effects_temporal_2, 
  meta_analysis    = meta_temporal_2,
  org_d            = original$d[original$study == "temporal_2"],
  org_ci_lower     = original$ci_lower[original$study == "temporal_2"], 
  org_ci_upper     = original$ci_upper[original$study == "temporal_2"], 
  title            = "Liberman & Trope (1998, Study 1)", 
  study_color      = liberman_1998_color
)

## Henderson et al. (2006, Study 1): Spatial Distance -----------------

### Primary meta-analysis

meta_spatial <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial)

### Comprehension check meta-analysis

meta_spatial_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial_comp)

### Forest plot

forest_spatial <- forest_plot(
  replication_data = effects_spatial, 
  meta_analysis    = meta_spatial,
  org_d            = original$d[original$study == "spatial"],
  org_ci_lower     = original$ci_lower[original$study == "spatial"], 
  org_ci_upper     = original$ci_upper[original$study == "spatial"], 
  title            = "Henderson et al. (2006, Study 1)", 
  study_color      = henderson_2006_color
)

## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------

### Primary meta-analysis

meta_likelihood <- rma(
  yi = d, 
  vi = var, 
  data = effects_likelihood)

### Comprehension check meta-analysis

meta_likelihood_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_likelihood_comp)

### Forest plot

forest_likelihood <- forest_plot(
  replication_data = effects_likelihood, 
  meta_analysis    = meta_likelihood,
  org_d            = original$d[original$study == "likelihood"],
  org_ci_lower     = original$ci_lower[original$study == "likelihood"], 
  org_ci_upper     = original$ci_upper[original$study == "likelihood"], 
  title            = "Wakslak et al. (2006, Study 1)", 
  study_color      = wakslak_2006_color
)

## Tversky & Kahneman (1981, Study 10): Active Control ----------------

### Primary meta-analysis

meta_control <- rma(
  yi = log_odds, 
  vi = var, 
  data = effects_control)

### Comprehension check meta-analysis

meta_control_comp <- rma(
  yi = log_odds, 
  vi = var, 
  data = effects_control_comp)

### Forest plot

forest_control <- forest_plot_lor(
  replication_data = effects_control,
  meta_analysis    = meta_temporal,
  org_lor          = original$lor[original$study == "control"],
  org_ci_lower     = original$ci_lower[original$study == "control"],
  org_ci_upper     = original$ci_upper[original$study == "control"],
  title            = "Tversky & Kahneman (1981, Study 10)",
  study_color      = tversky_1981_color
)

## Full data ----------------------------------------------------------

### Primary meta-analysis

meta_complete <- rma.mv(
  yi = d, 
  V = var,
  mods = ~ distance - 1,
  random = ~ 1|ID,
  data = effects_complete)

I2_complete <- I2_mv(meta_complete, effects_complete)

### Comprehension check meta-analysis

meta_complete_comp <- rma.mv(
  yi = d, 
  V = var, 
  mods = ~ distance - 1,
  random = ~ 1|ID,
  data = effects_complete_comp)

I2_complete_comp <- I2_mv(meta_complete_comp, effects_complete_comp)

# Arboretum plot ------------------------------------------------------

arboretum <- arboretum_plot(list(forest_temporal, forest_temporal_2, forest_spatial, forest_likelihood))

## Save plot

save_plot("./plots/climr_arboretum.png", arboretum, base_height = 12, base_width = 18)
save_plot("./plots/climr_arboretum.svg", arboretum, base_height = 12, base_width = 18)

# Main results: Beeswarm plot -----------------------------------------

climr_figure <- climr_swarm(
  meta_temporal   = meta_temporal, 
  meta_spatial    = meta_spatial, 
  meta_likelihood = meta_likelihood, 
  meta_temporal_2 = meta_temporal_2, 
  complete        = effects_complete, 
  original        = original, 
  study_colors    = study_colors, 
  titles          = c("Liberman et al. (2002, Study 1)", "Liberman & Trope (1998, Study 1)", "Henderson et al. (2006, Study 1)", "Wakslak et al. (2006, Study 1)")
  )

## Save plot

save_plot("./plots/climr_main_figure.png", climr_figure, base_asp = 1.6, base_height = 5)
save_plot("./plots/climr_main_figure.svg", climr_figure, base_asp = 1.6, base_height = 5)

# Planned moderator analysis ------------------------------------------

## Modality

### Liberman et al. (2002, Study 1): Temporal Distance ----------------

meta_temporal_mod <- rma(
  yi = d, 
  vi = var,
  mods = ~ modality,
  data = effects_temporal)

### Liberman & Trope (1998, Study 1): Temporal Distance ---------------

meta_temporal_2_mod <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_temporal_2)

### Henderson et al. (2006, Study 1): Spatial Distance ----------------

meta_spatial_mod <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_spatial)

### Wakslak et al. (2006, Study 1): Likelihood Distance ---------------

meta_likelihood_mod <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_likelihood)


