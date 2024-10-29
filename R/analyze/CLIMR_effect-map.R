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

color_sign <- function(x) {
  
  if (x < 0) {
    
    return("#F17E8A")
    
  } else {
    
    return("#71A253")
    
  }
  
}

palette_temporal   <- colorRamp(colors = c("#FFFFFF", "#37392E"))
palette_spatial    <- colorRamp(colors = c("#FFFFFF", "#B9E28C"))
palette_social     <- colorRamp(colors = c("#FFFFFF", "#A47C79"))
palette_likelihood <- colorRamp(colors = c("#FFFFFF", "#19647E"))

palette_negative   <- colorRamp(colors = c("#FFFFFF", "#93101D"))

effect_layer <- function(map, data, palette_fun, study_color, group_name) {

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
    radius       = (10 + data$d * 4) + (50 * data$var)/2,
    fillColor    = sapply(data$d, color_sign),
    fillOpacity  = 0.75,
    color        = study_color,
    stroke       = TRUE,
    weight       = 50 * data$var,
    opacity      = 0.75,
    group        = group_name,
  )
  
}

# Data wrangling ---------------------------------------------------------------

## Link coordinates to effect estimates

effects_temporal <- effects_temporal %>% 
  left_join(lab_coords, by = "lab")

effects_spatial <- effects_spatial %>% 
  left_join(lab_coords, by = "lab")

effects_social  <- effects_social %>% 
  left_join(lab_coords, by = "lab")

effects_likelihood <- effects_likelihood %>% 
  left_join(lab_coords, by = "lab")

# Map --------------------------------------------------------------------------

climr_leaflet <- leaflet() %>% 
  addTiles() %>% 
  
  # Temporal
  
  effect_layer(effects_temporal, 
               palette_temporal, 
               liberman_1998_color, 
               "Temporal (Liberman & Trope, 1998, Study 1)") %>% 
  
  # Spatial
  
  effect_layer(effects_spatial, 
               palette_spatial, 
               fujita_2006_color, 
               "Spatial (Fujita et al., 2006, Study 1)") %>% 
  
  # Social
  
  effect_layer(effects_social, 
               palette_social, 
               social_color, 
               "Social (paradigmatic replication)") %>% 
  
  # Likelihood
  
  effect_layer(effects_likelihood, 
               palette_likelihood, 
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

