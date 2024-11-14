################################################################################

# CLIMR -- Exploratory analyses, Item level analysis of the BIF

################################################################################

# Standardized mean differences, item by item ----------------------------------

# Calculate standardized mean difference

# This approach simply collapses across each lab.

item_effects_temporal <- data_bif_temporal %>% 
  group_by(item) %>% 
  summarise(
    d     = d_calc(1, condition, bif, "distant", "close")$d,
    ci_lb = d_calc(1, condition, bif, "distant", "close")$ci_lower,
    ci_ub = d_calc(1, condition, bif, "distant", "close")$ci_upper
  )

item_effects_spatial <- data_bif_spatial %>% 
  group_by(item) %>% 
  summarise(
    d     = d_calc(1, condition, bif, "distant", "close")$d,
    ci_lb = d_calc(1, condition, bif, "distant", "close")$ci_lower,
    ci_ub = d_calc(1, condition, bif, "distant", "close")$ci_upper
  )

item_effects_social <- data_bif_social %>% 
  group_by(item) %>% 
  summarise(
    d     = d_calc(1, condition, bif, "distant", "close")$d,
    ci_lb = d_calc(1, condition, bif, "distant", "close")$ci_lower,
    ci_ub = d_calc(1, condition, bif, "distant", "close")$ci_upper
  )

item_effects_likelihood <- data_bif_likelihood %>% 
  group_by(item) %>% 
  summarise(
    d     = d_calc(1, condition, bif, "distant", "close")$d,
    ci_lb = d_calc(1, condition, bif, "distant", "close")$ci_lower,
    ci_ub = d_calc(1, condition, bif, "distant", "close")$ci_upper
  )

# Calculate effects at the lab level

item_lab_effects_temporal <- data_bif_temporal %>% 
  group_by(lab_modality, item) %>% 
  summarise(
    d   = d_calc(1, condition, bif, "distant", "close")$d,
    var = d_calc(1, condition, bif, "distant", "close")$var
  ) %>% 
  filter(abs(d) != Inf) # Remove cases that are not calculable

item_lab_effects_spatial <- data_bif_spatial %>% 
  group_by(lab_modality, item) %>% 
  summarise(
    d   = d_calc(1, condition, bif, "distant", "close")$d,
    var = d_calc(1, condition, bif, "distant", "close")$var
  ) %>% 
  filter(abs(d) != Inf)

item_lab_effects_social <- data_bif_social %>% 
  group_by(lab_modality, item) %>% 
  summarise(
    d   = d_calc(1, condition, bif, "distant", "close")$d,
    var = d_calc(1, condition, bif, "distant", "close")$var
  ) %>% 
  filter(abs(d) != Inf)

item_lab_effects_likelihood <- data_bif_likelihood %>% 
  group_by(lab_modality, item) %>% 
  summarise(
    d   = d_calc(1, condition, bif, "distant", "close")$d,
    var = d_calc(1, condition, bif, "distant", "close")$var
  ) %>% 
  filter(abs(d) != Inf)

# Meta-analytic models ---------------------------------------------------------

meta_temporal_bif_item <- rma.mv(yi = d,
                                 V  = var,
                                 random = list(
                                   ~ 1 | lab_modality
                                 ),
                                 mods = ~ item - 1,
                                 data = item_lab_effects_temporal)

meta_spatial_bif_item <- rma.mv(yi = d,
                                V  = var,
                                random = list(
                                  ~ 1 | lab_modality
                                ),
                                mods = ~ item - 1,
                                data = item_lab_effects_spatial)

meta_social_bif_item <- rma.mv(yi = d,
                               V  = var,
                               random = list(
                                 ~ 1 | lab_modality
                               ),
                               mods = ~ item - 1,
                               data = item_lab_effects_social)

meta_likelihood_bif_item <- rma.mv(yi = d,
                                   V  = var,
                                   random = list(
                                     ~ 1 | lab_modality
                                   ),
                                   mods = ~ item - 1,
                                   data = item_lab_effects_likelihood)

# Create data set for visualization

effects_lab_bif_item <- data.frame(
  distance = c(
    rep("temporal", length(meta_temporal_bif_item$beta)),
    rep("spatial", length(meta_spatial_bif_item$beta)),
    rep("social", length(meta_social_bif_item$beta)),
    rep("likelihood", length(meta_likelihood_bif_item$beta))
  ),
  item = str_remove(
    c(
      rownames(meta_temporal_bif_item$beta),
      rownames(meta_spatial_bif_item$beta),
      rownames(meta_social_bif_item$beta),
      rownames(meta_likelihood_bif_item$beta)
    ),
    "itembif_"
  ),
  d = c(
    meta_temporal_bif_item$beta,
    meta_spatial_bif_item$beta,
    meta_social_bif_item$beta,
    meta_likelihood_bif_item$beta
  ),
  ci_lb = c(
    meta_temporal_bif_item$ci.lb,
    meta_spatial_bif_item$ci.lb,
    meta_social_bif_item$ci.lb,
    meta_likelihood_bif_item$ci.lb
  ),
  ci_ub = c(
    meta_temporal_bif_item$ci.ub,
    meta_spatial_bif_item$ci.ub,
    meta_social_bif_item$ci.ub,
    meta_likelihood_bif_item$ci.ub
  )
)

# Visualizations ---------------------------------------------------------------

# Raw data

manhattan_bif_temporal <- 
ggplot(item_effects_temporal,
       aes(
         x    = item,
         y    = d,
         ymin = ci_lb,
         ymax = ci_ub
       )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point() +
  geom_errorbar(
    width     = .33,
    linewidth = 1
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_temporal$item, "bif_")
  ) +
  labs(
    title = "Liberman & Trope (1998, Study 1)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_bif_spatial <- 
ggplot(item_effects_spatial,
       aes(
         x    = item,
         y    = d,
         ymin = ci_lb,
         ymax = ci_ub
       )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point() +
  geom_errorbar(
    width     = .33,
    linewidth = 1
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_spatial$item, "bif_")
  ) +
  labs(
    title = "Fujita et al. (2006, Study 1)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_bif_social <- 
ggplot(item_effects_social,
       aes(
         x    = item,
         y    = d,
         ymin = ci_lb,
         ymax = ci_ub
       )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point() +
  geom_errorbar(
    width     = .33,
    linewidth = 1
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_social$item, "bif_")
  ) +
  labs(
    title = "Social Distance (Paradigmatic Replication)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_bif_likelihood <- 
ggplot(item_effects_likelihood,
       aes(
         x    = item,
         y    = d,
         ymin = ci_lb,
         ymax = ci_ub
       )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point() +
  geom_errorbar(
    width     = .33,
    linewidth = 1
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_likelihood$item, "bif_")
  ) +
  labs(
    title = "Likelihood Distance (Paradigmatic Replication)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_bif_grid <- plot_grid(
  manhattan_bif_temporal,
  manhattan_bif_spatial,
  manhattan_bif_social,
  manhattan_bif_likelihood,
  nrow = 4
)

save_plot("./figures/climr_bif-items.png",
          manhattan_bif_grid,
          base_height = 12, base_width = 6)

save_plot("./reports/figures/climr_bif-items.png",
          manhattan_bif_grid,
          base_height = 12, base_width = 6)

# Meta-analytic

manhattan_rma_bif_temporal <- 
  ggplot(effects_lab_bif_item %>% 
           filter(distance == "temporal"),
         aes(
           x    = item,
           y    = d,
           ymin = ci_lb,
           ymax = ci_ub
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point(
    color = liberman_1998_color
  ) +
  geom_errorbar(
    width     = .33,
    linewidth = 1,
    color = liberman_1998_color
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_temporal$item, "bif_")
  ) +
  labs(
    title = "Liberman & Trope (1998, Study 1)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_rma_bif_spatial <- 
  ggplot(effects_lab_bif_item %>% 
           filter(distance == "spatial"),
         aes(
           x    = item,
           y    = d,
           ymin = ci_lb,
           ymax = ci_ub
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point(
    color = fujita_2006_color
  ) +
  geom_errorbar(
    width     = .33,
    linewidth = 1,
    color = fujita_2006_color
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_spatial$item, "bif_")
  ) +
  labs(
    title = "Fujita et al. (2006, Study 1)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_rma_bif_social <- 
  ggplot(effects_lab_bif_item %>% 
           filter(distance == "social"),
         aes(
           x    = item,
           y    = d,
           ymin = ci_lb,
           ymax = ci_ub
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point(
    color = social_color
  ) +
  geom_errorbar(
    width     = .33,
    linewidth = 1,
    color = social_color
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_social$item, "bif_")
  ) +
  labs(
    title = "Social Distance (Paradigmatic Replication)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_rma_bif_likelihood <- 
  ggplot(effects_lab_bif_item %>% 
           filter(distance == "likelihood"),
         aes(
           x    = item,
           y    = d,
           ymin = ci_lb,
           ymax = ci_ub
         )) +
  geom_hline(
    linetype   = "dashed",
    yintercept = 0 
  ) +
  geom_point(
    color = likelihood_color
  ) +
  geom_errorbar(
    width     = .33,
    linewidth = 1,
    color = likelihood_color
  ) +
  scale_y_continuous(
    limits = c(-.40, .40),
    breaks = round(seq(-.40, .40, .05), 2)
  ) +
  scale_x_discrete(
    labels = str_remove(item_effects_likelihood$item, "bif_")
  ) +
  labs(
    title = "Likelihood Distance (Paradigmatic Replication)",
    y     = "Effect size",
    x     = "Item"
  ) +
  theme_classic()

manhattan_rma_bif_grid <- plot_grid(
  manhattan_rma_bif_temporal,
  manhattan_rma_bif_spatial,
  manhattan_rma_bif_social,
  manhattan_rma_bif_likelihood,
  nrow = 4
)

save_plot("./figures/climr_bif-items-rma.png",
          manhattan_rma_bif_grid,
          base_height = 12, base_width = 6)

save_plot("./reports/figures/climr_bif-items-rma.png",
          manhattan_rma_bif_grid,
          base_height = 12, base_width = 6)
