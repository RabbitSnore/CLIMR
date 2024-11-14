################################################################################

# CLIMR -- Exploratory analysis, manipulation checks

################################################################################

# Manipulation check effect sizes vs. outcome effect sizes ---------------------

meta_temporal_ce   <- rma.mv(
  yi     = d, 
  V      = var, 
  mods = ~ d_mc,
  data   = effects_temporal)

meta_spatial_ce    <- rma.mv(
  yi     = d, 
  V      = var,
  mods = ~ d_mc,
  data   = effects_spatial)

meta_social_ce     <- rma.mv(
  yi     = d, 
  V      = var, 
  mods = ~ d_mc,
  data   = effects_social)

meta_likelihood_ce <- rma.mv(
  yi     = d, 
  V      = var, 
  mods = ~ d_mc,
  data   = effects_likelihood)

# Visualizations

scatter_mc_temporal <- 
  ggplot(effects_temporal,
         aes(
           x = d_mc,
           y = d,
           size = 1/sqrt(var)
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = meta_temporal$beta[[1]]
  ) +
  geom_vline(
    linetype   = "dashed",
    xintercept = meta_mc_temporal$beta[[1]]
  ) +
  geom_point(
    alpha = .70
  ) +
  scale_size_continuous(
    range = c(.25, 4)
  ) +
  guides(
    size = "none"
  ) +
  labs(
    title = "Liberman & Trope (1998, Study 1)",
    y     = "Outcome effect size (d)",
    x     = "Manipulation check effect size (d)"
  ) +
  theme_classic()

scatter_mc_spatial <- 
  ggplot(effects_spatial,
         aes(
           x = d_mc,
           y = d,
           size = 1/sqrt(var)
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = meta_spatial$beta[[1]]
  ) +
  geom_vline(
    linetype   = "dashed",
    xintercept = meta_mc_spatial$beta[[1]]
  ) +
  geom_point(
    alpha = .70
  ) +
  scale_size_continuous(
    range = c(.25, 4)
  ) +
  guides(
    size = "none"
  ) +
  labs(
    title = "Fujita et al. (2006, Study 1)",
    y     = "Outcome effect size (d)",
    x     = "Manipulation check effect size (d)"
  ) +
  theme_classic()

scatter_mc_social <- 
  ggplot(effects_social,
         aes(
           x = d_mc,
           y = d,
           size = 1/sqrt(var)
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = meta_social$beta[[1]]
  ) +
  geom_vline(
    linetype   = "dashed",
    xintercept = meta_mc_social$beta[[1]]
  ) +
  geom_point(
    alpha = .70
  ) +
  scale_size_continuous(
    range = c(.25, 4)
  ) +
  guides(
    size = "none"
  ) +
  labs(
    title = "Social Distance (Paradigmatic Replication)",
    y     = "Outcome effect size (d)",
    x     = "Manipulation check effect size (d)"
  ) +
  theme_classic()

scatter_mc_likelihood <- 
  ggplot(effects_likelihood,
         aes(
           x = d_mc,
           y = d,
           size = 1/sqrt(var)
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = meta_likelihood$beta[[1]]
  ) +
  geom_vline(
    linetype   = "dashed",
    xintercept = meta_mc_likelihood$beta[[1]]
  ) +
  geom_point(
    alpha = .70
  ) +
  scale_size_continuous(
    range = c(.25, 4)
  ) +
  guides(
    size = "none"
  ) +
  labs(
    title = "Likelihood Distance (Paradigmatic Replication)",
    y     = "Outcome effect size (d)",
    x     = "Manipulation check effect size (d)"
  ) +
  theme_classic()

grid_scatter_mc <- plot_grid(
  scatter_mc_temporal,
  scatter_mc_spatial,
  scatter_mc_social,
  scatter_mc_likelihood,
  nrow = 2
)

save_plot("./figures/climr_manipulation-checks-vs-outcomes.png",
          grid_scatter_mc,
          base_height = 9, base_width = 9)

save_plot("./reports/figures/climr_manipulation-checks-vs-outcomes.png",
          grid_scatter_mc,
          base_height = 9, base_width = 9)
