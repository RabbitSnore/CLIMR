################################################################################

# CLIMR -- Robustness check for valence difference in BIF response options

################################################################################

# Data wrangling ---------------------------------------------------------------

data_bif_temporal <- data_bif_temporal %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_spatial <- data_bif_spatial %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_social <- data_bif_social %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_likelihood <- data_bif_likelihood %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

# Analysis ---------------------------------------------------------------------

# Temporal

glmm_temporal_bif_base <- glmer(bif 
                                ~ condition 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal)

glmm_temporal_bif_val  <- glmer(bif 
                                ~ condition 
                                + d 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal)

glmm_temporal_bif_int  <- glmer(bif 
                                ~ condition 
                                * d 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal)

lrt_val_temporal       <- anova(glmm_temporal_bif_base, 
                                glmm_temporal_bif_val, 
                                glmm_temporal_bif_int, 
                                test = "LRT")

# Spatial

glmm_spatial_bif_base <- glmer(bif 
                               ~ condition 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial)

glmm_spatial_bif_val  <- glmer(bif 
                               ~ condition 
                               + d 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial)

glmm_spatial_bif_int  <- glmer(bif 
                               ~ condition 
                               * d 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial)

lrt_val_spatial       <- anova(glmm_spatial_bif_base, 
                               glmm_spatial_bif_val, 
                               glmm_spatial_bif_int, 
                               test = "LRT")

# Social

glmm_social_bif_base <- glmer(bif 
                              ~ condition 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social)

glmm_social_bif_val  <- glmer(bif 
                              ~ condition 
                              + d 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social)

glmm_social_bif_int  <- glmer(bif 
                              ~ condition 
                              * d 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social)

lrt_val_social       <- anova(glmm_social_bif_base, 
                              glmm_social_bif_val, 
                              glmm_social_bif_int, 
                              test = "LRT")

# Likelihood

glmm_likelihood_bif_base <- glmer(bif 
                                  ~ condition 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood)

glmm_likelihood_bif_val  <- glmer(bif 
                                  ~ condition 
                                  + d 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood)

glmm_likelihood_bif_int  <- glmer(bif 
                                  ~ condition 
                                  * d 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood)

lrt_val_likelihood       <- anova(glmm_likelihood_bif_base, 
                                  glmm_likelihood_bif_val, 
                                  glmm_likelihood_bif_int, 
                                  test = "LRT")

# Visualizations ---------------------------------------------------------------

# Temporal distance

## Create new data for predictions

newdata_val_temporal <- expand.grid(
  condition = c("close", "distant"), 
  d         = unique(data_bif_temporal$d)
)

## Create predictions

newdata_val_temporal$pred <- predict(glmm_temporal_bif_int,
                                     newdata = newdata_val_temporal,
                                     re.form = NA,
                                     type    = "response")

plot_pred_val_temporal <- 
  ggplot(newdata_val_temporal,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Temporal (Liberman & Trope, 1998, Study 1)"
  ) +
  theme_classic()

plot_pred_val_prop_temporal <- 
  ggplot(newdata_val_temporal,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    data = data_bif_temporal %>% 
      group_by(condition, d) %>% 
      summarise(
        prop = mean(bif)
      ),
    aes(
      y = prop
    ),
    shape = 2
  ) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Temporal (Liberman & Trope, 1998, Study 1)"
  ) +
  theme_classic()

# Spatial distance

## Create new data for predictions

newdata_val_spatial <- expand.grid(
  condition = c("close", "distant"), 
  d         = unique(data_bif_spatial$d)
)

## Create predictions

newdata_val_spatial$pred <- predict(glmm_spatial_bif_val,
                                     newdata = newdata_val_spatial,
                                     re.form = NA,
                                     type    = "response")

plot_pred_val_spatial <- 
  ggplot(newdata_val_spatial,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Spatial (Fujita et al., 2006, Study 1)"
  ) +
  theme_classic()

plot_pred_val_prop_spatial <- 
  ggplot(newdata_val_spatial,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    data = data_bif_spatial %>% 
      group_by(condition, d) %>% 
      summarise(
        prop = mean(bif)
      ),
    aes(
      y = prop
    ),
    shape = 2
  ) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Spatial (Fujita et al., 2006, Study 1)"
  ) +
  theme_classic()

# Social distance

## Create new data for predictions

newdata_val_social <- expand.grid(
  condition = c("close", "distant"), 
  d         = unique(data_bif_social$d)
)

## Create predictions

newdata_val_social$pred <- predict(glmm_social_bif_int,
                                   newdata = newdata_val_social,
                                   re.form = NA,
                                   type    = "response")


plot_pred_val_social <- 
  ggplot(newdata_val_social,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Social (Paradigmatic Replication)"
  ) +
  theme_classic()

plot_pred_val_prop_social <- 
  ggplot(newdata_val_social,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    data = data_bif_social %>% 
      group_by(condition, d) %>% 
      summarise(
        prop = mean(bif)
      ),
    aes(
      y = prop
    ),
    shape = 2
  ) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Social (Paradigmatic Replication)"
  ) +
  theme_classic()

# Likelihood distance

## Create new data for predictions

newdata_val_likelihood <- expand.grid(
  condition = c("close", "distant"), 
  d         = unique(data_bif_likelihood$d)
)

## Create predictions

newdata_val_likelihood$pred <- predict(glmm_likelihood_bif_val,
                                   newdata = newdata_val_likelihood,
                                   re.form = NA,
                                   type    = "response")


plot_pred_val_likelihood <- 
  ggplot(newdata_val_likelihood,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Likelihood (Paradigmatic Replication)"
  ) +
  theme_classic()

plot_pred_val_prop_likelihood <- 
  ggplot(newdata_val_likelihood,
         aes(
           y = pred,
           x = d,
           color = condition,
           group = condition
         )) +
  geom_point(
    data = data_bif_likelihood %>% 
      group_by(condition, d) %>% 
      summarise(
        prop = mean(bif)
      ),
    aes(
      y = prop
    ),
    shape = 2
  ) +
  geom_point(
    size = 1.5
  ) +
  geom_line(
    linewidth = 1
  ) +
  geom_vline(
    xintercept = 0,
    linetype   = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1.75, .25)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .1),
    limits = c(0, 1)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "Predicted probability of abstract choice",
    x     = "Valence difference of response options (d)",
    color = "Condition",
    title = "Likelihood (Paradigmatic Replication)"
  ) +
  theme_classic()


# Combine plots

## Model predictions

val_grid <- plot_grid(plot_pred_val_temporal,
                      plot_pred_val_spatial,
                      plot_pred_val_social,
                      plot_pred_val_likelihood,
                      nrow = 2)

save_plot("figures/climr_bif-valence-predictions.png",
          val_grid,
          base_height = 8,
          base_width  = 10)

save_plot("reports/figures/climr_bif-valence-predictions.png",
          val_grid,
          base_height = 8,
          base_width  = 10)

## With raw proportions

val_prop_grid <- plot_grid(plot_pred_val_prop_temporal,
                           plot_pred_val_prop_spatial,
                           plot_pred_val_prop_social,
                           plot_pred_val_prop_likelihood,
                           nrow = 2)

save_plot("figures/climr_bif-valence-predictions-with-prop.png",
          val_prop_grid,
          base_height = 8,
          base_width  = 10)

save_plot("reports/figures/climr_bif-valence-predictions-with-prop.png",
          val_prop_grid,
          base_height = 8,
          base_width  = 10)
