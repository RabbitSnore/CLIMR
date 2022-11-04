################################################################################

# CLIMR -- Smallest Effect of Interest Analysis 

################################################################################

# Set up environment -----------------------------------------------------------

## Load functions

# These should already be loaded, but on the off chance they're not, this will
# load them.

source("./R/functions/CLIMR_visualization_functions.R")

# FUnction to calculate frequencies and proportions of excluded SEOI estimates

seoi_count <- function(meta, data = seoi_complete) {
  
  seoi_contr_count <- 
    sum(meta$ci.ub < seoi_complete[seoi_complete$distance == "temporal" & seoi_complete$sample == "Contributor", ]$d)
  
  seoi_contr_prop <- seoi_contr_count / nrow(seoi_complete[seoi_complete$sample == "Contributor", ])
  
  seoi_clt_count <- 
    sum(meta$ci.ub < seoi_complete[seoi_complete$distance == "temporal" & 
                                     seoi_complete$sample == "Expert", ]$d)
  
  seoi_clt_prop <- seoi_clt_count / nrow(seoi_complete[seoi_complete$sample == "Expert", ])
  
  out <- data.frame(
    seoi_contr_count,
    seoi_contr_prop,
    seoi_clt_count,
    seoi_clt_prop
  )
  
  return(out)
  
}

# Frequency and Proportion SEOIs excluded --------------------------------------

## Temporal (Liberman & Trope, 1998, Exp 1)

seoi_temporal   <- seoi_count(meta_temporal)

## Spatial (Fujita et al., 2006, Exp 1)

seoi_spatial    <- seoi_count(meta_spatial)

## Social

seoi_social     <- seoi_count(meta_social)

## Likelihood

seoi_likelihood <- seoi_count(meta_likelihood)

# SEOI visualization -----------------------------------------------------------

climr_seoi_figure <- seoi_swarm(
  meta_temporal   = meta_temporal, 
  meta_spatial    = meta_spatial, 
  meta_social     = meta_social,
  meta_likelihood = meta_likelihood, 
  complete        = seoi_complete,
  study_colors    = study_colors, 
  titles          = c("Temporal (Liberman & Trope, 1998, Exp 1)",
                      "Spatial (Fujita et al., 2006, Exp 1)",
                      "Social (paradigmatic replication)",
                      "Likelihood (paradigmatic replication)")
  )

## Save plot

save_plot("./figures/climr_seoi_figure.png", climr_seoi_figure, base_asp = 1.6, base_height = 5)
save_plot("./figures/climr_seoi_figure.svg", climr_seoi_figure, base_asp = 1.6, base_height = 5)

save_plot("./reports/figures/climr_seoi_figure.png", climr_seoi_figure, base_asp = 1.6, base_height = 5)