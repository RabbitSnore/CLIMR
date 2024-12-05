################################################################################

# CLIMR -- Exploratory analyses, spatial effects across actual distance

################################################################################

# Load data --------------------------------------------------------------------

lab_coords <- read.csv("./data/climr_lab-coordinates.csv") %>% 
  mutate(
    long = as.numeric(long),
    lat  = as.numeric(lat)
  )

# Function for great circle distance -------------------------------------------

haversine <- function(lat_1, long_1, lat_2, long_2, earth = 6371) {
  
  # Convert to radians and calculate deltas
  
  phi_1        <- lat_1 * pi/180
  phi_2        <- lat_2 * pi/180
  
  delta_phi    <- (lat_2 - lat_1)   * pi/180
  delta_lambda <- (long_1 - long_2) * pi/180
  
  # Great circle distance
  
  a <- sin(delta_phi/2)^2 + (cos(phi_1) * cos(phi_2)) * sin(delta_lambda/2)^2
  
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  
  d <- earth * c
  
  return(d)
  
}

# Data wrangling ---------------------------------------------------------------

# Calculate haversine distances

lab_coords$haversine <- haversine(lab_coords$lat, 
                                  lab_coords$long, 
                                  lab_coords$lat_distant, 
                                  lab_coords$long_distant)

# Join data

data_bif_spatial <- data_bif_spatial %>% 
  left_join(
    select(lab_coords, lab, haversine),
    by = "lab"
  )

data_bif_spatial$haversine_rescale <- as.numeric(
  scale(data_bif_spatial$haversine,
        scale = FALSE)
)

data_bif_spatial$haversine_rescale <- data_bif_spatial$haversine_rescale/100

data_spatial <- data_spatial %>% 
  left_join(
    select(lab_coords, lab, haversine),
    by = "lab"
  )

effects_mc_spatial <- effects_mc_spatial %>% 
  left_join(
    select(lab_coords, lab, haversine),
    by = "lab"
  )

# Analysis ---------------------------------------------------------------------

# Actual distance and psychological distance effect

glmm_spatial_km_base <- glmer(bif 
                              ~ condition 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_spatial %>% 
                                filter(complete.cases(haversine)))

glmm_spatial_km_add  <- glmer(bif 
                              ~ condition 
                              + haversine_rescale 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family  = binomial(link = "logit"), 
                              data    = data_bif_spatial %>% 
                                filter(complete.cases(haversine)),
                              control = glmerControl(
                                optimizer = "bobyqa"
                              ))

glmm_spatial_km_int  <- glmer(bif 
                              ~ condition 
                              * haversine_rescale
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_spatial %>% 
                                filter(complete.cases(haversine)),
                              control = glmerControl(
                                optimizer = "bobyqa"
                              ))

lrt_km_spatial       <- anova(glmm_spatial_km_base, 
                              glmm_spatial_km_add, 
                              glmm_spatial_km_int, 
                              test = "LRT")

# Actual distance and cause size

meta_spatial_mc_km <- rma.mv(
  yi     = d, 
  V      = var,
  mods = ~ haversine,
  data   = effects_mc_spatial %>% 
    filter(complete.cases(d, haversine)))

effects_mc_spatial_km <- bind_cols(
  effects_mc_spatial  %>% 
    filter(complete.cases(d, haversine)),
  as.data.frame(predict(meta_spatial_mc_km))
)

# Visualizations ---------------------------------------------------------------

# Figures

scatter_km_spatial <- 
ggplot(data_spatial,
       aes(
         x     = haversine,
         y     = bif_total,
         color = condition,
         group = condition
       )) +
  geom_point(
    shape = 1,
    position = position_jitter(width = 0, height = .33)
  ) +
  geom_smooth(
    method  = "lm",
    formula = "y ~ x"
  ) +
  scale_y_continuous(
    limits = c(0, 13),
    breaks = 0:13
  ) +
  scale_x_continuous(
    breaks = seq(0, 6000, 1000)
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y     = "BIF Sum Score",
    x     = "Actual Distance (km)",
    color = "Condition"
  ) +
  theme_classic()

plot_cause_size_km <- 
ggplot(effects_mc_spatial_km,
       aes(
         x = haversine,
         y = d,
         size = 1/sqrt(var)
       )) +
  geom_point(
    alpha = .70
  ) +
  geom_line(
    inherit.aes = FALSE,
    aes(
      y = pred,
      x = haversine,
      group = 1
    ),
    color = "#B9E28C",
    linewidth = 1
  ) +
  geom_line(
    inherit.aes = FALSE,
    aes(
      y = ci.lb,
      x = haversine,
      group = 1
    ),
    color = "#B9E28C",
    linewidth = 1,
    linetype  = "dashed"
  ) +
  geom_line(
    inherit.aes = FALSE,
    aes(
      y = ci.ub,
      x = haversine,
      group = 1
    ),
    color = "#B9E28C",
    linewidth = 1,
    linetype  = "dashed"
  ) +
  scale_size_continuous(
    range = c(.25, 4)
  ) +
  guides(
    size = "none"
  ) +
  scale_x_continuous(
    breaks = seq(0, 6000, 1000)
  ) +
  labs(
    x     = "Actual Distance (km)",
    y     = "Manipulation check effect size (d)"
  ) +
  theme_classic()

# Export figures

save_plot("figures/climr_spatial-actual-distance-cause-size.png",
          plot_cause_size_km,
          base_height = 5, base_width = 6)


save_plot("reports/figures/climr_spatial-actual-distance-cause-size.png",
          plot_cause_size_km,
          base_height = 5, base_width = 6)
