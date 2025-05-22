################################################################################

# CLIMR -- Data Quality Investigation

################################################################################

# Set up environment -----------------------------------------------------------

source("./R/functions/CLIMR_effect-size-functions.R")

# Functions

cutcomp_effects <- function(data_subset, cutoff) {
  
  # Determine which labs have a rate of comprehension check failures lower than
  # the cutoff
  
  labs_retained <- data_subset %>% 
    group_by(lab) %>% 
    summarise(
      comp_prop = sum(comp_check)/n()
    ) %>% 
    filter(comp_prop < cutoff) %>% 
    pull(lab)
  
  # Create a subset of only the retained labs
  
  data_retained <- data_subset %>% 
    filter(lab %in% labs_retained)
  
  # Calculate effect sizes for retained labs
  
  effects_retained <- lab_d_calc(
    data       = data_retained, 
    distance   = "distance", 
    experiment = cutoff
  )
  
  data_retained_comp <- filter(data_retained, comp_check == 0)
  
  # Calculate effect sizes for retained labs, with inattentive participants removed
  
  effects_retained_comp <- lab_d_calc(
    data       = data_retained_comp, 
    distance   = "distance", 
    experiment = cutoff
  )
  
  # Meta-analysis with retained effects
  
  meta_retained <- rma(
    yi = d, 
    vi = var, 
    data = effects_retained)
  
  # Meta-analysis with retained effects, with inattentive participants removed
  
  meta_retained_comp <- rma(
    yi = d, 
    vi = var, 
    data = effects_retained_comp)
  
  # Extract relevant values from meta-analyses
  
  meta_retained_data <- data.frame(
    cutoff        = cutoff,
    b_retained    = meta_retained$beta[[1]], 
    cilb_retained = meta_retained$ci.lb[[1]],
    ciub_retained = meta_retained$ci.ub[[1]],
    n_retained    = nrow(data_retained),
    b_retcomp     = meta_retained_comp$beta[[1]], 
    cilb_retcomp  = meta_retained_comp$ci.lb[[1]],
    ciub_retcomp  = meta_retained_comp$ci.ub[[1]],
    n_retcomp     = nrow(data_retained_comp)
  )
  
  return(meta_retained_data)
  
}

# Load data --------------------------------------------------------------------

original <- read.csv("./data/CLT_original.csv")

# Data quality investigation ---------------------------------------------------

# Specify cutoffs

cuts <- seq(.10, 1, .01)

# Calculate effects based on different cutoffs

compcut_effects_temporal <- 
map_df(cuts, 
       \(cuts) cutcomp_effects(data_subset = data_temporal, cutoff = cuts))

compcut_effects_spatial <- 
map_df(cuts, 
       \(cuts) cutcomp_effects(data_subset = data_spatial, cutoff = cuts))

compcut_effects_social <- 
map_df(cuts, 
       \(cuts) cutcomp_effects(data_subset = data_social, cutoff = cuts))

compcut_effects_likelihood <- 
map_df(cuts, 
       \(cuts) cutcomp_effects(data_subset = data_likelihood, cutoff = cuts))

# Visualization

## Lab exclusions

cut_plot_temporal <- 
ggplot(compcut_effects_temporal,
       aes(
         y    = 1 - cutoff,
         x    = b_retained,
         xmin = cilb_retained,
         xmax = ciub_retained
       )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retained),
      x     = -.25
      ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.30, .30),
    breaks = round(seq(-.30, .30, .05), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Temporal (Liberman & Trope, 1998, Study 1)"
  ) +
  theme_classic()

cut_plot_spatial <- 
ggplot(compcut_effects_spatial,
       aes(
         y    = 1 - cutoff,
         x    = b_retained,
         xmin = cilb_retained,
         xmax = ciub_retained
       )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retained),
      x     = -.25
    ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.30, .30),
    breaks = round(seq(-.30, .30, .05), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Spatial (Fujita et al., 2006, Study 1)"
  ) +
  theme_classic()

cut_plot_social <- 
ggplot(compcut_effects_social,
       aes(
         y    = 1 - cutoff,
         x    = b_retained,
         xmin = cilb_retained,
         xmax = ciub_retained
       )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retained),
      x     = -.375
    ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.40, 0),
    breaks = round(seq(-.40, 0, .10), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Social (paradigmatic replication)"
  ) +
  theme_classic()

cut_plot_likelihood <- 
ggplot(compcut_effects_likelihood,
       aes(
         y    = 1 - cutoff,
         x    = b_retained,
         xmin = cilb_retained,
         xmax = ciub_retained
       )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retained),
      x     = -.25
    ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.30, .30),
    breaks = round(seq(-.30, .30, .05), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Likelihood (paradigmatic replication)"
  ) +
  theme_classic()

cut_plot_grid <- 
plot_grid(cut_plot_temporal,
          cut_plot_spatial,
          cut_plot_social,
          cut_plot_likelihood,
          nrow = 2)

save_plot("figures/climr_cut-comp_plot.png",
          cut_plot_grid,
          base_height = 20, base_width = 14)

save_plot("reports/figures/climr_cut-comp_plot.png",
          cut_plot_grid,
          base_height = 20, base_width = 14)

## With individual level exclusions

cut_plot_comp_temporal <- 
  ggplot(compcut_effects_temporal,
         aes(
           y    = 1 - cutoff,
           x    = b_retcomp,
           xmin = cilb_retcomp,
           xmax = ciub_retcomp
         )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retcomp),
      x     = -.25
    ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.30, .30),
    breaks = round(seq(-.30, .30, .05), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Temporal (Liberman & Trope, 1998, Study 1)"
  ) +
  theme_classic()

cut_plot_comp_spatial <- 
  ggplot(compcut_effects_spatial,
         aes(
           y    = 1 - cutoff,
           x    = b_retcomp,
           xmin = cilb_retcomp,
           xmax = ciub_retcomp
         )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retcomp),
      x     = -.25
    ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.30, .30),
    breaks = round(seq(-.30, .30, .05), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Spatial (Fujita et al., 2006, Study 1)"
  ) +
  theme_classic()

cut_plot_comp_social <- 
  ggplot(compcut_effects_social,
         aes(
           y    = 1 - cutoff,
           x    = b_retcomp,
           xmin = cilb_retcomp,
           xmax = ciub_retcomp
         )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retcomp),
      x     = -.375
    ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.40, 0),
    breaks = round(seq(-.40, 0, .10), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Social (paradigmatic replication)"
  ) +
  theme_classic()

cut_plot_comp_likelihood <- 
  ggplot(compcut_effects_likelihood,
         aes(
           y    = 1 - cutoff,
           x    = b_retcomp,
           xmin = cilb_retcomp,
           xmax = ciub_retcomp
         )) +
  geom_vline(
    xintercept = 0,
    linetype = "dotted"
  ) +
  geom_point() +
  geom_errorbarh(
    height = .005
  ) +
  geom_text(
    aes(
      label = paste("N =", n_retcomp),
      x     = -.25
    ),
    size = 3
  ) +
  scale_x_continuous(
    limits = c(-.30, .30),
    breaks = round(seq(-.30, .30, .05), 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, .05)
  ) +
  labs(
    y = "Required Pass Rate",
    x = "Meta-Analytic Effect Size",
    title = "Likelihood (paradigmatic replication)"
  ) +
  theme_classic()

cut_plot_comp_grid <- 
plot_grid(cut_plot_comp_temporal,
          cut_plot_comp_spatial,
          cut_plot_comp_social,
          cut_plot_comp_likelihood,
          nrow = 2)

save_plot("figures/climr_cut-comp-exclusions_plot.png",
          cut_plot_comp_grid,
          base_height = 20, base_width = 14)

save_plot("reports/figures/climr_cut-comp-exclusions_plot.png",
          cut_plot_comp_grid,
          base_height = 20, base_width = 14)

# Contextualizing effect sizes -------------------------------------------------

histogram_temporal <-
ggplot(data_temporal,
       aes(
         x    = bif_total,
         fill = condition
       )) +
  stat_function(
    inherit.aes = FALSE,
    fun  = function(x, mean, sd, n){
      n * dnorm(x = x, mean = mean, sd = sd)
    },
    args = list(
      mean = 10.19, # Values taken from materials sent by Liberman
      sd   = 3.69,
      n    = nrow(data_temporal[data_temporal$condition == "close", ])
    ),
    color      = "#88527F",
    linewidth  = 1,
    alpha      = .50,
    linetype   = "dashed"
  ) +
  stat_function(
    inherit.aes = FALSE,
    fun  = function(x, mean, sd, n){
      n * dnorm(x = x, mean = mean, sd = sd)
    },
    args = list(
      mean = 13.44, # Values taken from materials sent by Liberman
      sd   = 3.44,
      n    = nrow(data_temporal[data_temporal$condition == "distant", ])
    ),
    color      = "#7EB09B",
    linewidth  = 1,
    alpha      = .50,
    linetype   = "dashed"
  ) +
  geom_histogram(
    binwidth = 1,
    position = "identity",
    alpha    = .50,
    color    = "black"
  ) +
  scale_fill_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  scale_x_continuous(
    breaks = 0:19
  ) +
  labs(
    x = "BIF Total Score",
    y = "Count",
    fill = "Condition",
    title = "Temporal (Liberman & Trope, 1998, Study 1)"
  ) +
  theme_classic()

histogram_spatial <- 
ggplot(data_spatial,
       aes(
         x    = bif_total,
         fill = condition
       )) +
  stat_function(
    inherit.aes = FALSE,
    fun  = function(x, mean, sd, n){
      n * dnorm(x = x, mean = mean, sd = sd)
    },
    args = list(
      mean = 8.47,  # Taken from publication 
      sd   = 2.563, # Estimated using t-statistics
      n    = nrow(data_spatial[data_spatial$condition == "close", ])
    ),
    color      = "#88527F",
    linewidth  = 1,
    alpha      = .50,
    linetype   = "dashed"
  ) +
  stat_function(
    inherit.aes = FALSE,
    fun  = function(x, mean, sd, n){
      n * dnorm(x = x, mean = mean, sd = sd)
    },
    args = list(
      mean = 9.88,  # Taken from publication 
      sd   = 2.563, # Estimated using t-statistics
      n    = nrow(data_spatial[data_spatial$condition == "distant", ])
    ),
    color      = "#7EB09B",
    linewidth  = 1,
    alpha      = .50,
    linetype   = "dashed"
  ) +
  geom_histogram(
    binwidth = 1,
    position = "identity",
    alpha    = .50,
    color    = "black"
  ) +
  scale_fill_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  scale_x_continuous(
    breaks = 0:13
  ) +
  labs(
    x = "BIF Total Score",
    y = "Count",
    fill = "Condition",
    title = "Spatial (Fujita et al., 2006, Study 1)"
  ) +
  theme_classic()

histogram_social <- 
ggplot(data_social,
       aes(
         x    = bif_total,
         fill = condition
       )) +
  geom_histogram(
    binwidth = 1,
    position = "identity",
    alpha    = .50,
    color    = "black"
  ) +
  scale_fill_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  scale_x_continuous(
    breaks = 0:25
  ) +
  labs(
    x = "BIF Total Score",
    y = "Count",
    fill = "Condition",
    title = "Social (paradigmatic replication)"
  ) +
  theme_classic()

histogram_likelihood <- 
ggplot(data_likelihood,
       aes(
         x     = bif_total,
         fill = condition
       )) +
  geom_histogram(
    binwidth = 1,
    position = "identity",
    alpha    = .50,
    color    = "black"
  ) +
  scale_fill_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  scale_x_continuous(
    breaks = 0:9
  ) +
  labs(
    x = "BIF Total Score",
    y = "Count",
    fill = "Condition",
    title = "Likelihood (paradigmatic replication)"
  ) +
  theme_classic()

historgram_grid <- 
plot_grid(histogram_temporal,
          histogram_spatial,
          histogram_social,
          histogram_likelihood,
          nrow = 2)

save_plot("figures/climr_histogram-grid.png",
          historgram_grid,
          base_height = 9, base_width = 12)

save_plot("reports/figures/climr_histogram-grid.png",
          historgram_grid,
          base_height = 9, base_width = 12)
