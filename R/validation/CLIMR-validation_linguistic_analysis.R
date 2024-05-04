################################################################################

# CLIMR -- Validation of Linguistic Measures of Concreteness, Analyze

################################################################################

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("dplyr", 
                  "tidyr", 
                  "stringr", 
                  "readr", 
                  "metafor", 
                  "lme4", 
                  "ggplot2", 
                  "cowplot", 
                  "rmarkdown", 
                  "ggbeeswarm", 
                  "ggstance", 
                  "simr", 
                  "viridis", 
                  "leaflet", 
                  "osfr",
                  "lmerTest") # Not included in broader project

### Check whether packages are installed locally and get list of what needs to
### be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

## Load general functions

source("./R/functions/CLIMR_effect-size-functions.R")

# Import data ------------------------------------------------------------------

if (!file.exists("data/validation/climr_linguistic-validation_cleaned-parsed_data.csv")) {
  
  osf_retrieve_file("6636272a419d001a7dfea022") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

linguistic_long <- 
  read_csv("data/validation/climr_linguistic-validation_cleaned-parsed_data.csv")

# Analysis ---------------------------------------------------------------------

# Mixed effects models

lmer_folk   <- lmer(concreteness
                    ~ 1
                    + distance
                    + (1 |ResponseId)
                    + (1 + distance| item),
                    data = linguistic_long,
                    control = lmerControl(
                      optimizer = "nlminbwrap"
                    ))

lmer_lcm    <- lmer(lcm
                    ~ 1
                    + distance
                    + (1 |ResponseId)
                    + (1 + distance| item),
                    data = linguistic_long,
                    control = lmerControl(
                      optimizer = "bobyqa"
                    ))

lmer_lcm_pd <- lmer(lcm_pd
                    ~ 1
                    + distance
                    + (1 |ResponseId)
                    + (1 + distance| item),
                    data = linguistic_long,
                    control = lmerControl(
                      optimizer = "nlminbwrap"
                    ))

# Effect size calculations

# Coded such that positive signs are in the expected direction.

d_folk <- d_calc(
  ID = 1, 
  x = linguistic_long$distance, 
  y = linguistic_long$concreteness,
  cond_1 = "c", cond_2 = "a"
)

d_lcm <- d_calc(
  ID = 1, 
  x = linguistic_long$distance, 
  y = linguistic_long$lcm,
  cond_1 = "a", cond_2 = "c"
)

d_lcm_pd <- d_calc(
  ID = 1, 
  x = linguistic_long$distance, 
  y = linguistic_long$lcm_pd,
  cond_1 = "a", cond_2 = "c"
)

# Visualization

swarm_folk <- 
  ggplot(linguistic_long,
         aes(
           x = distance,
           y = concreteness
         )) +
  geom_quasirandom(
    shape = 1,
    alpha = .20
  ) +
  scale_y_continuous(
    breaks = seq(1, 5, .5),
    limits = c(1, 5)
  ) +
  scale_x_discrete(
    labels = c("Abstract", "Concrete")
  ) +
  labs(
    x = "Condition",
    y = "Folk Concreteness"
  ) +
  theme_classic()

swarm_lcm <- 
  ggplot(linguistic_long,
         aes(
           x = distance,
           y = lcm
         )) +
  geom_quasirandom(
    shape = 1,
    alpha = .20
  ) +
  scale_y_continuous(
    breaks = seq(1, 5, .5),
    limits = c(1, 5)
  ) +
  scale_x_discrete(
    labels = c("Abstract", "Concrete")
  ) +
  labs(
    x = "Condition",
    y = "LCM"
  ) +
  theme_classic()

swarm_lcm_pd <- 
  ggplot(linguistic_long,
         aes(
           x = distance,
           y = lcm_pd
         )) +
  geom_quasirandom(
    shape = 1,
    alpha = .20
  ) +
  scale_y_continuous(
    breaks = seq(0, 4, .5),
    limits = c(0, 4)
  ) +
  scale_x_discrete(
    labels = c("Abstract", "Concrete")
  ) +
  labs(
    x = "Condition",
    y = "LCM (Modified)"
  ) +
  theme_classic()

swarm_grid <- plot_grid(swarm_folk, swarm_lcm, swarm_lcm_pd, 
                        nrow = 1)

save_plot("figures/climr_linguistic-measure-swarm_figure.png", 
          swarm_grid,
          base_height = 6, base_width = 10)

save_plot("reports/figures/climr_linguistic-measure-swarm_figure.png", 
          swarm_grid,
          base_height = 6, base_width = 10)

# Random effects exploration ---------------------------------------------------

# Extract random effects

lmm_folk_ranef <- ranef(lmer_folk)$ResponseId

hist_folk_ranef <- 
ggplot(lmm_folk_ranef,
       aes(
         x = distancec
       )) +
  geom_histogram(
    binwidth = .05,
    color    = "black",
    fill     = "darkgrey"
  ) +
  labs(
    x = "Random Slope for Abstraction",
    
  ) +
  theme_classic()

# LCM Analyses -----------------------------------------------------------------

# Activities only

lmer_lcm_ac <- lmer(lcm
                    ~ 1
                    + distance
                    + (1 |ResponseId)
                    + (1 + distance| item),
                    data = linguistic_long %>% 
                      filter(type == "ac"),
                    control = lmerControl(
                      optimizer = "bobyqa"
                    ))

d_lcm_ac <- d_calc(
  ID = 1, 
  x = filter(linguistic_long, type == "ac")$distance, 
  y = filter(linguistic_long, type == "ac")$lcm,
  cond_1 = "a", cond_2 = "c"
)

swarm_lcm_ac <- 
  ggplot(filter(linguistic_long, type == "ac"),
         aes(
           x = distance,
           y = lcm
         )) +
  geom_quasirandom(
    shape = 1,
    alpha = .20
  ) +
  scale_y_continuous(
    breaks = seq(1, 5, .5),
    limits = c(1, 5)
  ) +
  scale_x_discrete(
    labels = c("Abstract", "Concrete")
  ) +
  labs(
    x = "Condition",
    y = "LCM"
  ) +
  theme_classic()

# Activities only (Puddle Ducks)

lmer_lcm_pd_ac <- lmer(lcm_pd
                    ~ 1
                    + distance
                    + (1 |ResponseId)
                    + (1 + distance| item),
                    data = linguistic_long %>% 
                      filter(type == "ac"),
                    control = lmerControl(
                      optimizer = "nlminbwrap"
                    ))

d_lcm_pd_ac <- d_calc(
  ID = 1, 
  x = filter(linguistic_long, type == "ac")$distance, 
  y = filter(linguistic_long, type == "ac")$lcm_pd,
  cond_1 = "a", cond_2 = "c"
)

swarm_lcm_pd_ac <- 
  ggplot(filter(linguistic_long, type == "ac"),
         aes(
           x = distance,
           y = lcm_pd
         )) +
  geom_quasirandom(
    shape = 1,
    alpha = .20
  ) +
  scale_y_continuous(
    breaks = seq(0, 4, .5),
    limits = c(0, 4)
  ) +
  scale_x_discrete(
    labels = c("Abstract", "Concrete")
  ) +
  labs(
    x = "Condition",
    y = "LCM (Modified)"
  ) +
  theme_classic()
