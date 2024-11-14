################################################################################

# CLIMR -- Exploratory analyses, Influence statistics

################################################################################

# Calculate Cook's distances ---------------------------------------------------

meta_cook_temporal   <- cooks.distance(meta_temporal)
meta_cook_spatial    <- cooks.distance(meta_spatial)
meta_cook_social     <- cooks.distance(meta_social)
meta_cook_likelihood <- cooks.distance(meta_likelihood)

# Data wrangling ---------------------------------------------------------------

effects_temporal$cooks_distance   <- meta_cook_temporal
effects_spatial$cooks_distance    <- meta_cook_spatial
effects_social$cooks_distance     <- meta_cook_social
effects_likelihood$cooks_distance <- meta_cook_likelihood

# Visualizations ---------------------------------------------------------------

cook_plot_temporal <- 
ggplot(effects_temporal,
       aes(
         x = 1:nrow(effects_temporal),
         y = cooks_distance
       )) +
  geom_point() +
  geom_hline(
    yintercept = 4/nrow(effects_temporal),
    linetype   = "dashed"
  ) +
  scale_y_continuous(
    limits = c(0, .35)
  ) +
  labs(
    x     = "",
    y     = "Cook's Distance",
    title = "Liberman & Trope (1998, Study 1)"
  ) +
  theme_classic()

cook_plot_spatial <- 
ggplot(effects_spatial,
       aes(
         x = 1:nrow(effects_spatial),
         y = cooks_distance
       )) +
  geom_point() +
  geom_hline(
    yintercept = 4/nrow(effects_spatial),
    linetype   = "dashed"
  ) +
  scale_y_continuous(
    limits = c(0, .35)
  ) +
  labs(
    x     = "",
    y     = "Cook's Distance",
    title = "Fujita et al. (2006, Study 1)"
  ) +
  theme_classic()

cook_plot_social <- 
ggplot(effects_social,
       aes(
         x = 1:nrow(effects_social),
         y = cooks_distance
       )) +
  geom_point() +
  geom_hline(
    yintercept = 4/nrow(effects_social),
    linetype   = "dashed"
  ) +
  scale_y_continuous(
    limits = c(0, .35)
  ) +
  labs(
    x     = "",
    y     = "Cook's Distance",
    title = "Social Distance (Paradigmatic Replication)"
  ) +
  theme_classic()

cook_plot_likelihood <- 
ggplot(effects_likelihood,
       aes(
         x = 1:nrow(effects_likelihood),
         y = cooks_distance
       )) +
  geom_point() +
  geom_hline(
    yintercept = 4/nrow(effects_likelihood),
    linetype   = "dashed"
  ) +
  scale_y_continuous(
    limits = c(0, .35)
  ) +
  labs(
    x     = "",
    y     = "Cook's Distance",
    title = "Likelihood Distance (Paradigmatic Replication)"
  ) +
  theme_classic()

cook_plot_grid <- plot_grid(
  cook_plot_temporal, 
  cook_plot_spatial,
  cook_plot_social,
  cook_plot_likelihood,
  nrow = 2
)

save_plot("./figures/climr_cooks-distance.png",
          cook_plot_grid,
          base_height = 9, base_width = 9)

save_plot("./reports/figures/climr_cooks-distance.png",
          cook_plot_grid,
          base_height = 9, base_width = 9)

# Robustness checks ------------------------------------------------------------

# Refit meta-analytic models dropping influential cases according to the 4/n
# rule.

meta_temporal_inf <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal %>% 
    filter(cooks_distance < 4/n()))

meta_spatial_inf <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial %>% 
    filter(cooks_distance < 4/n()))

meta_social_inf <- rma(
  yi = d, 
  vi = var, 
  data = effects_social %>% 
    filter(cooks_distance < 4/n()))

meta_likelihood_inf <- rma(
  yi = d, 
  vi = var, 
  data = effects_likelihood %>% 
    filter(cooks_distance < 4/n()))

