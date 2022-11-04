################################################################################

# CLIMR -- Effect Size Calculation, Validation Summary

################################################################################

# This script assumes you have run all the main validations scripts to compose
# the reports for Validation 1 and Validation 2.

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

# Meta-Analysis of Spillover Effects -------------------------------------------

spillover <- bind_rows(
  effect_fruit_close_bif,
  effect_fruit_modified_bif,
  effect_bridge_bif
)

spillover_rma <- rma(yi = d, vi = var, data = spillover)

# Data for Plotting ------------------------------------------------------------

effect_temporal_2$ID     <- "BIF" 
effect_temporal$ID       <- "Categorization"
effect_spatial$ID        <- "Segmentation"
effect_fruit_close$ID    <- "Quantity Estimation (a)"
effect_fruit_modified$ID <- "Quantity Estimation (b)"
effect_bridge$ID         <- "Length Estimation"

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
    ci_upper = spillover_rma$ci.ub)
  )

validation_plot_data$ID <- ordered(validation_plot_data$ID, 
                                   levels = c(
                                     "BIF",
                                     "Categorization",
                                     "Segmentation",
                                     "Quantity Estimation (a)",
                                     "Quantity Estimation (b)",
                                     "Length Estimation",
                                     "Spillover Effect (BIF)"
                                   ))

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
    width = .25,
    size = 1
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
    breaks = seq(from = -0.50, to = 2.00, by = .10),
    limits = c(-0.50, 2.00)
  ) +
  labs(
    x = "",
    y = "Standardized Mean Difference"
  ) +
  theme_classic()

## Save plot

cowplot::save_plot("./plots/climr_validation_plot.png", validation_plot, base_height = 6, base_width = 10)
cowplot::save_plot("./plots/climr_validation_plot.svg", validation_plot, base_height = 6, base_width = 10)
