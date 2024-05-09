################################################################################

# CLIMR -- Effect Size Calculation, Validation Summary

################################################################################

# This script assumes you have run all the main validations scripts to compose
# the reports for Validation 1, Validation 2, and Validation 3.

# Import data ------------------------------------------------------------------

# Ejelöv & Luke causal efficacy data

if(!file.exists("data/validation/causal_efficacy_data.csv")) {
  
  osf_retrieve_file("5d1b5d954994dd001916311f") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

causal_efficacy <- read.csv("data/validation/causal_efficacy_data.csv")

## Empirical cumulative distribution of manipulation check effect sizes

mc_ecdf <-  ecdf(causal_efficacy$MC_ES)

# Meta-Analysis of Spillover Effects -------------------------------------------

spillover <- bind_rows(
  effect_fruit_close_bif,
  effect_fruit_modified_bif,
  effect_bridge_bif
)

spillover_rma <- rma(yi = d, vi = var, data = spillover)

# Data for Plotting ------------------------------------------------------------

# Validation 1

effect_temporal_2$ID     <- "BIF" 
effect_temporal$ID       <- "Categorization"
effect_spatial$ID        <- "Segmentation"

# Validation 2

effect_fruit_close$ID    <- "Quantity Estimation (a)"
effect_fruit_modified$ID <- "Quantity Estimation (b)"
effect_bridge$ID         <- "Length Estimation"

# Validation 3

d_folk$ID                <- "Folk Concreteness" 
d_lcm$ID                 <- "LCM"
d_lcm_pd$ID              <- "LCM (Modified)"

# Assemble data

validation_plot_data <- bind_rows(
  effect_temporal_2,
  effect_temporal,
  effect_spatial,
  effect_fruit_close,
  effect_fruit_modified,
  effect_bridge,
  data.frame(
    ID       = "Spillover Effect (BIF)", 
    d        = spillover_rma$beta[[1]], 
    var      = spillover_rma$se^2, 
    ci_lower = spillover_rma$ci.lb, 
    ci_upper = spillover_rma$ci.ub),
  d_folk,
  d_lcm,
  d_lcm_pd
  )

validation_plot_data$ID <- ordered(validation_plot_data$ID, 
                                   levels = c(
                                     "BIF",
                                     "Categorization",
                                     "Segmentation",
                                     "Quantity Estimation (a)",
                                     "Quantity Estimation (b)",
                                     "Length Estimation",
                                     "Spillover Effect (BIF)",
                                     "Folk Concreteness",
                                     "LCM",
                                     "LCM (Modified)"
                                   ))

validation_plot_data$percentile_ejelov_luke <- mc_ecdf(validation_plot_data$d)

# Visualization ----------------------------------------------------------------

validation_plot <- 
ggplot(validation_plot_data,
       aes(
         x = ID,
         y = d,
         ymin = ci_lower,
         ymax = ci_upper
       )) +
  geom_point(
    size = 2
  ) +
  geom_errorbar(
    width     = .25,
    linewidth = 1
  ) +
  geom_hline(
    yintercept = 0,
    linetype = "dashed"
  ) +
  geom_hline(
    yintercept = .435,
    linetype = "dotted"
  ) +
  geom_hline(
    yintercept = 1.58,
    linetype = "dotdash",
    color = "grey"
  ) +
  # annotate(
  #   "text",
  #   x = 6.75,
  #   y = 0.48,
  #   label = "Conservative performance benchmark",
  #   size = 3
  # ) +
  # annotate(
  #   "text",
  #   x = 6.75,
  #   y = 1.625,
  #   label = "Average manipulation check performance",
  #   size = 3
  # ) +
  scale_y_continuous(
    breaks = seq(from = -0.50, to = 2.00, by = .25),
    limits = c(-0.50, 2.00)
  ) +
  labs(
    x = "",
    y = "Standardized Mean Difference"
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 10)
  )

## Save plot

cowplot::save_plot("./figures/climr_validation_plot.png", 
                   validation_plot, 
                   base_height = 6, base_width = 9)
cowplot::save_plot("./figures/climr_validation_plot.svg", 
                   validation_plot, 
                   base_height = 6, base_width = 9)

cowplot::save_plot("./reports/figures/climr_validation_plot.png", 
                   validation_plot, 
                   base_height = 6, base_width = 9)
