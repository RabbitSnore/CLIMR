################################################################################

# CLIMR -- Map of Effects

################################################################################

# Set up environment -----------------------------------------------------------

lab_coords <- read.csv("./data/climr_lab-coordinates.csv") %>% 
  mutate(
    long = as.numeric(long),
    lat  = as.numeric(lat)
  )

## Functions

color_scale <- function(effects) {
  
  colorNumeric(
    viridis::viridis(128, option = "D"),
    effects %>% pull(d)
  )
  
}

range_std <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

color_sign_pos  <- colorRampPalette(c("#F2F5EA", "#065A82"), bias = 2)
color_sign_neg  <- colorRampPalette(c("#F95738", "#F2F5EA"), bias = 2)

palette_pos     <- color_sign_pos(101)
palette_neg     <- color_sign_neg(101)

color_sign <- function(x) {
  
  x_pos <- round(1 + range_std(x[x >= 0]) * 100)
  x_neg <- round(1 + range_std(x[x <  0]) * 100)
  
  return(c(palette_neg[x_neg], palette_pos[x_pos]))
  
}

effect_layer <- function(map, data, study_color, group_name) {

  addCircleMarkers(
    map          = map,
    lng          = data$long,
    lat          = data$lat,
    label        = data$affiliation,
    popup        = paste(format(
      round(data$d, 2), nsmall = 2), 
      " [", format(round(data$ci_lower, 2), nsmall = 2),  
      ", ", format(round(data$ci_upper, 2), nsmall = 2), "]"),
    labelOptions = labelOptions(textsize = "1.1em"),
    radius       = 5 * log(1/data$var),
    fillColor    = color_sign(data$d),
    fillOpacity  = 0.75,
    color        = study_color,
    stroke       = TRUE,
    weight       = 5,
    opacity      = 0.90,
    group        = group_name,
  )
  
}

# Data wrangling ---------------------------------------------------------------

## Link coordinates to effect estimates

effects_temporal_map   <- effects_temporal %>% 
  left_join(lab_coords, by = "lab") %>% 
  arrange(d)

effects_temporal_map$effect_color <- color_sign(effects_temporal_map$d)

effects_spatial_map    <- effects_spatial %>% 
  left_join(lab_coords, by = "lab") %>% 
  arrange(d)

effects_social_map     <- effects_social %>% 
  left_join(lab_coords, by = "lab") %>% 
  arrange(d)

effects_likelihood_map <- effects_likelihood %>% 
  left_join(lab_coords, by = "lab") %>% 
  arrange(d)

# Map --------------------------------------------------------------------------

climr_leaflet <- leaflet() %>% 
  addTiles() %>% 
  
  # Temporal
  
  effect_layer(effects_temporal_map, 
               liberman_1998_color, 
               "Temporal (Liberman & Trope, 1998, Study 1)") %>% 
  
  # Spatial
  
  effect_layer(effects_spatial_map, 
               fujita_2006_color, 
               "Spatial (Fujita et al., 2006, Study 1)") %>% 
  
  # Social
  
  effect_layer(effects_social_map,  
               social_color, 
               "Social (paradigmatic replication)") %>% 
  
  # Likelihood
  
  effect_layer(effects_likelihood_map, 
               likelihood_color, 
               "Likelihood (paradigmatic replication)") %>% 
  
  # Layer control
  
  addLayersControl(
    baseGroups = c(
      "Temporal (Liberman & Trope, 1998, Study 1)", 
      "Spatial (Fujita et al., 2006, Study 1)", 
      "Social (paradigmatic replication)", 
      "Likelihood (paradigmatic replication)"
      ),
    options  = layersControlOptions(collapsed = FALSE),
    position = "bottomleft"
  )

# Export Map -------------------------------------------------------------------

mapshot(climr_leaflet,
        url = "./figures/climr_effect-map.html",
        remove_controls = NULL)

