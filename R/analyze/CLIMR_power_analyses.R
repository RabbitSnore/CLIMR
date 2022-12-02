################################################################################

# CLIMR -- Power Analyses

################################################################################

# Set up environment -----------------------------------------------------------

## Load data

clt_samples <- read.csv("./data/study-sample-data.csv")

## Load functions

source("./R/functions/CLIMR_power_functions.R")

# Required sample sizes --------------------------------------------------------

power_range <- seq(.01, .99, .01)

required_n_temporal   <- power_sample(id = "temporal",
                                      d = meta_temporal$beta[[1]],
                                      power = power_range)

required_n_spatial    <- power_sample(id = "spatial",
                                      d = meta_spatial$beta[[1]],
                                      power = power_range)

required_n_social     <- power_sample(id = "social",
                                      d = meta_social$beta[[1]],
                                      power = power_range)

required_n_likelihood <- power_sample(id = "likelihood",
                                      d = meta_likelihood$beta[[1]],
                                      power = power_range)

required_n <- bind_rows(required_n_temporal,
                        required_n_spatial,
                        required_n_social,
                        required_n_likelihood)

## Data visualization

required_n$id <- factor(required_n$id, 
                        levels = c("temporal", "spatial", "social", "likelihood"))

N_top <- round(max(required_n$N), -floor(log10(max(required_n$N)))) * 1.1

required_n_curves <- 
ggplot(required_n,
       aes(
         x = power,
         y = N,
         group = id,
         color = id
       )) +
  geom_line(
    size  = 1,
    alpha = .80
  ) +
  scale_color_manual(
    values = study_colors,
    labels = c("Temporal", 
               "Spatial", 
               "Social", 
               "Likelihood")
  ) +
  geom_vline(
    xintercept = .80,
    linetype   = "dashed",
    color      = "grey"
  ) +
  geom_vline(
    xintercept = .95,
    linetype   = "dashed",
    color      = "grey"
  ) +
  geom_hline(
    yintercept = median(clt_samples$n_total),
    linetype   = "dotted",
    color      = "darkgrey"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1, .10),
    labels = paste(seq(0, 1, .10) * 100, "%", sep = "")
  ) +
  scale_y_continuous(
    limits = c(0, N_top),
    breaks = seq(0, N_top, 100)
  ) +
  labs(
    x = "Power",
    y = "Required Total Sample Size",
    color = "",
    title = "Sample Sizes Needed to Detect Replication Effects"
  ) +
  theme_classic() +
  theme(
    legend.position = "top"
  )

# Detectable effects -----------------------------------------------------------

detectable_effects <- clt_samples %>%
  select(id = citation, N = n_total, k = k_groups) %>% 
  pmap(power_effect) %>% 
  bind_rows()

detectable_hist <- 
ggplot(detectable_effects,
       aes(
         x = d
       )) +
  geom_histogram(
    binwidth = 0.05,
    fill = "grey",
    color = "darkgrey"
  ) +
  geom_vline(
    xintercept = median(detectable_effects$d),
    linetype = "dotted",
    size = 1,
    alpha = .80,
    color = "black"
  ) +
  geom_vline(
    xintercept = abs(meta_temporal$beta[[1]]),
    linetype = "dashed",
    size = 1,
    alpha = .80,
    color = liberman_1998_color
  ) +
  geom_vline(
    xintercept = abs(meta_spatial$beta[[1]]),
    linetype = "dashed",
    size = 1,
    alpha = .80,
    color = fujita_2006_color
  ) +
  geom_vline(
    xintercept = abs(meta_social$beta[[1]]),
    linetype = "dashed",
    size = 1,
    alpha = .80,
    color = social_color
  ) +
  geom_vline(
    xintercept = abs(meta_likelihood$beta[[1]]),
    linetype = "dashed",
    size = 1,
    alpha = .80,
    color = likelihood_color
  ) +
  scale_x_continuous(
    breaks = seq(0, 5.00, 0.05)
  ) +
  labs(
    x = "Detectable Standardized Mean Difference (80% Power)",
    y = "Count",
    title = "Existing Literature's Ability to Detect Effects"
  ) +
  theme_classic()

# Power to detect replication effects ------------------------------------------

detection_power_temporal <- clt_samples %>%
  select(id = citation, N = n_total, k = k_groups) %>% 
  pmap(power_achieved, d = meta_temporal$beta[[1]]) %>% 
  bind_rows()

detection_power_spatial <- clt_samples %>%
  select(id = citation, N = n_total, k = k_groups) %>% 
  pmap(power_achieved, d = meta_spatial$beta[[1]]) %>% 
  bind_rows()

detection_power_social <- clt_samples %>%
  select(id = citation, N = n_total, k = k_groups) %>% 
  pmap(power_achieved, d = meta_social$beta[[1]]) %>% 
  bind_rows()

detection_power_likelihood <- clt_samples %>%
  select(id = citation, N = n_total, k = k_groups) %>% 
  pmap(power_achieved, d = meta_likelihood$beta[[1]]) %>% 
  bind_rows()

## Data visualizations

detection_plot_temporal <- 
ggplot(detection_power_temporal,
       aes(
         x = power
       )) +
  geom_histogram(
    binwidth = .05,
    fill = "grey",
    color = "darkgrey"
  ) +
  scale_x_continuous(
    limits = c(0, 1),
    breaks = seq(0, 1, .10),
    labels = paste(seq(0, 1, .10) * 100, "%", sep = "")
  ) +
  labs(
    x     = "Power to Detect Replication Effect Estimate",
    y     = "Count",
    title = "Temporal (Liberman & Trope, 1998, Exp 1)"
  ) +
  theme_classic()

detection_plot_spatial <- 
  ggplot(detection_power_spatial,
         aes(
           x = power
         )) +
  geom_histogram(
    binwidth = .05,
    fill = "grey",
    color = "darkgrey"
  ) +
  scale_x_continuous(
    limits = c(0, 1),
    breaks = seq(0, 1, .10),
    labels = paste(seq(0, 1, .10) * 100, "%", sep = "")
  ) +
  labs(
    x     = "Power to Detect Replication Effect Estimate",
    y     = "Count",
    title = "Spatial (Fujita et al., 2006, Exp 1)"
  ) +
  theme_classic()

detection_plot_social <- 
  ggplot(detection_power_social,
         aes(
           x = power
         )) +
  geom_histogram(
    binwidth = .05,
    fill = "grey",
    color = "darkgrey"
  ) +
  scale_x_continuous(
    limits = c(0, 1),
    breaks = seq(0, 1, .10),
    labels = paste(seq(0, 1, .10) * 100, "%", sep = "")
  ) +
  labs(
    x     = "Power to Detect Replication Effect Estimate",
    y     = "Count",
    title = "Social (paradigmatic replication)"
  ) +
  theme_classic()

detection_plot_likelihood <- 
  ggplot(detection_power_likelihood,
         aes(
           x = power
         )) +
  geom_histogram(
    binwidth = .05,
    fill = "grey",
    color = "darkgrey"
  ) +
  scale_x_continuous(
    limits = c(0, 1),
    breaks = seq(0, 1, .10),
    labels = paste(seq(0, 1, .10) * 100, "%", sep = "")
  ) +
  labs(
    x     = "Power to Detect Replication Effect Estimate",
    y     = "Count",
    title = "Likelihood (paradigmatic replication)"
  ) +
  theme_classic()

# Joining visualizations -------------------------------------------------------

detection_grid_plot <- 
plot_grid(detection_plot_temporal, 
          detection_plot_spatial, 
          detection_plot_social, 
          detection_plot_likelihood,
          nrow = 2)

upper_plots <-
  plot_grid(required_n_curves,
            detectable_hist,
            nrow = 1)

climr_power_figure <- 
plot_grid(upper_plots,
          detection_grid_plot,
          nrow = 2)

# Export figures ---------------------------------------------------------------

save_plot("./figures/climr_power_figure.png", climr_power_figure, 
          base_asp = 1.5, base_height = 10)
save_plot("./figures/climr_power_figure.svg", climr_power_figure, 
          base_asp = 1.5, base_height = 10)


save_plot("./reports/figures/climr_power_figure.png", climr_power_figure, 
          base_asp = 1.5, base_height = 10)
