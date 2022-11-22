################################################################################

# CLIMR -- Meta-Analytic Models

################################################################################

# Set up environment -----------------------------------------------------------

## Load functions

source("./R/functions/CLIMR_visualization_functions.R")
source("./R/functions/CLIMR_meta_analytic_functions.R")

## Load data

# NOTE
# Insert code here to load the effect size data

### Load original effects

original <- read.csv("./data/CLT_original.csv")

## Study colors

liberman_1998_color  <- "#37392E"
fujita_2006_color    <- "#B9E28C"
social_color         <- "#A47C79"
likelihood_color     <- "#19647E"

study_colors <- c(liberman_1998_color,
                  fujita_2006_color,
                  social_color,
                  likelihood_color)

# Meta-analysis and forest plot for each experiment ----------------------------

## Liberman & Trope (1998, Study 1): Temporal Distance -------------------------

### Primary meta-analysis

meta_temporal <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal)

bt_temporal <- diff_calc(
  y        = data_temporal$y, 
  d        = meta_temporal$beta[[1]], 
  ci_lower = meta_temporal$ci.lb[[1]], 
  ci_upper = meta_temporal$ci.ub[[1]])

### Comprehension check meta-analysis

meta_temporal_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal_comp)

bt_temporal_comp <- diff_calc(
  y        = filter(data_temporal, comp_check == 0)$y, 
  d        = meta_temporal_comp$beta[[1]], 
  ci_lower = meta_temporal_comp$ci.lb[[1]], 
  ci_upper = meta_temporal_comp$ci.ub[[1]])

### Forest plot

forest_temporal <- forest_plot(
  replication_data = effects_temporal, 
  meta_analysis    = meta_temporal,
  org_d            = original$d[original$study == "temporal"],
  org_ci_lower     = original$ci_lower[original$study == "temporal"], 
  org_ci_upper     = original$ci_upper[original$study == "temporal"], 
  title            = "Temporal (Liberman & Trope, 1998, Exp 1)", 
  study_color      = liberman_1998_color
  )


## Fujita et al. (2006, Study 1): Spatial Distance -----------------------------

### Primary meta-analysis

meta_spatial <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial)

bt_spatial <- diff_calc(
  y        = data_spatial$y, 
  d        = meta_spatial$beta[[1]], 
  ci_lower = meta_spatial$ci.lb[[1]], 
  ci_upper = meta_spatial$ci.ub[[1]])

### Comprehension check meta-analysis

meta_spatial_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial_comp)

bt_spatial_comp <- diff_calc(
  y        = filter(data_spatial, comp_check == 0)$y, 
  d        = meta_spatial_comp$beta[[1]], 
  ci_lower = meta_spatial_comp$ci.lb[[1]], 
  ci_upper = meta_spatial_comp$ci.ub[[1]])

### Forest plot

forest_spatial <- forest_plot(
  replication_data = effects_spatial, 
  meta_analysis    = meta_spatial,
  org_d            = original$d[original$study == "spatial"],
  org_ci_lower     = original$ci_lower[original$study == "spatial"], 
  org_ci_upper     = original$ci_upper[original$study == "spatial"], 
  title            = "Spatial (Fujita et al., 2006, Exp 1)", 
  study_color      = fujita_2006_color
)

## Social Distance (Paradigmatic Replication) ----------------------------------

### Primary meta-analysis

meta_social <- rma(
  yi = d, 
  vi = var, 
  data = effects_social)

bt_social <- diff_calc(
  y        = data_social$y, 
  d        = meta_social$beta[[1]], 
  ci_lower = meta_social$ci.lb[[1]], 
  ci_upper = meta_social$ci.ub[[1]])

### Comprehension check meta-analysis

meta_social_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_social_comp)

bt_social_comp <- diff_calc(
  y        = filter(data_social, comp_check == 0)$y, 
  d        = meta_social_comp$beta[[1]], 
  ci_lower = meta_social_comp$ci.lb[[1]], 
  ci_upper = meta_social_comp$ci.ub[[1]])

### Forest plot

forest_social <- forest_plot(
  replication_data = effects_social, 
  meta_analysis    = meta_social,
  org_d            = original$d[original$study == "social"],
  org_ci_lower     = original$ci_lower[original$study == "social"], 
  org_ci_upper     = original$ci_upper[original$study == "social"], 
  title            = "Social (paradigmatic replication)", 
  study_color      = social_color
)

## Likelihood Distance (Paradigmatic Replication) ------------------------------

### Primary meta-analysis

meta_likelihood <- rma(
  yi = d, 
  vi = var, 
  data = effects_likelihood)

bt_likelihood <- diff_calc(
  y        = data_likelihood$y, 
  d        = meta_likelihood$beta[[1]], 
  ci_lower = meta_likelihood$ci.lb[[1]], 
  ci_upper = meta_likelihood$ci.ub[[1]])

### Comprehension check meta-analysis

meta_likelihood_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_likelihood_comp)

bt_likelihood_comp <- diff_calc(
  y        = filter(data_likelihood, comp_check == 0)$y, 
  d        = meta_likelihood_comp$beta[[1]], 
  ci_lower = meta_likelihood_comp$ci.lb[[1]], 
  ci_upper = meta_likelihood_comp$ci.ub[[1]])

### Forest plot

forest_likelihood <- forest_plot(
  replication_data = effects_likelihood, 
  meta_analysis    = meta_likelihood,
  org_d            = original$d[original$study == "likelihood"],
  org_ci_lower     = original$ci_lower[original$study == "likelihood"], 
  org_ci_upper     = original$ci_upper[original$study == "likelihood"], 
  title            = "Likelihood (paradigmatic replication)", 
  study_color      = likelihood_color
)

## Full data -------------------------------------------------------------------

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

# Arboretum plot ---------------------------------------------------------------

arboretum <- arboretum_plot(list(forest_temporal, forest_spatial, forest_social, forest_likelihood))

## Save plot

save_plot("./figures/climr_arboretum.png", arboretum, base_height = 12, base_width = 18)
save_plot("./figures/climr_arboretum.svg", arboretum, base_height = 12, base_width = 18)

save_plot("./reports/figures/climr_arboretum.png", arboretum, base_height = 12, base_width = 18)

# Main results: Beeswarm plot --------------------------------------------------

climr_figure <- climr_swarm(
  meta_temporal   = meta_temporal, 
  meta_spatial    = meta_spatial, 
  meta_social     = meta_social,
  meta_likelihood = meta_likelihood, 
  complete        = effects_complete, 
  original        = original, 
  study_colors    = study_colors, 
  titles          = c("Temporal (Liberman & Trope, 1998, Exp 1)", 
                      "Spatial (Fujita et al., 2006, Exp 1)", 
                      "Social (paradigmatic replication)", 
                      "Likelihood (paradigmatic replication)")
)

## Save plot

save_plot("./figures/climr_main_figure.png", climr_figure, base_asp = 1.6, base_height = 5)
save_plot("./figures/climr_main_figure.svg", climr_figure, base_asp = 1.6, base_height = 5)

save_plot("./reports/figures/climr_main_figure.png", climr_figure, base_asp = 1.6, base_height = 5)

# Planned moderator analysis ---------------------------------------------------

## Modality

### Liberman & Trope (1998, Study 1): Temporal Distance ------------------------

meta_temporal_mod <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_temporal)

### Fujita et al. (2006, Study 1): Spatial Distance ----------------------------

meta_spatial_mod <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_spatial)

### Social Distance (Paradigmatic Replication) ---------------------------------

meta_social_mod <- rma(
  yi = d, 
  vi = var,
  mods = ~ modality,
  data = effects_social)

### Likelihood Distance (Paradigmatic Replication) -----------------------------

meta_likelihood_mod <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_likelihood)


