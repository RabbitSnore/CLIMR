#######################################################################

# CLIMR -- Map of Effects

#######################################################################

# Set up environment --------------------------------------------------

lab_coords <- read.csv("./data/lab_coordinates.csv") %>% 
  mutate(
    ID = 1:nrow(.), # REMOVE WHEN FINAL IDENTIFIERS ARE SET
    long = as.numeric(long),
    lat = as.numeric(lat)
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
palette_temporal_2 <- colorRamp(colors = c("#FFFFFF", "#B9E28C"))
palette_spatial    <- colorRamp(colors = c("#FFFFFF", "#A47C79"))
palette_likelihood <- colorRamp(colors = c("#FFFFFF", "#19647E"))

palette_negative   <- colorRamp(colors = c("#FFFFFF", "#93101D"))

# palette_temporal   <- colorRamp(colors = c("#D9DBD2", "#37392E"), bias = 5)
# palette_temporal_2 <- colorRamp(colors = c("#D7EFBE", "#B9E28C"), bias = 5)
# palette_spatial    <- colorRamp(colors = c("#DECFCE", "#A47C79"), bias = 5)
# palette_likelihood <- colorRamp(colors = c("#BBE4F2", "#19647E"), bias = 5)


effect_layer <- function(map, data, palette_fun, study_color, group_name) {

  addCircleMarkers(
    map          = map,
    lng          = data$long,
    lat          = data$lat,
    label        = data$Institution,
    popup        = paste(format(
      round(data$d, 2), nsmall = 2), 
      " [", format(round(data$ci_lower, 2), nsmall = 2),  
      ", ", format(round(data$ci_upper, 2), nsmall = 2), "]"),
    labelOptions = labelOptions(textsize = "1.1em"),
    radius       = (10 + data$d * 6) - (50 * data$var)/2,
    fillColor    = sapply(data$d, color_sign),
    fillOpacity  = 1.00,
    color        = study_color,
    stroke       = TRUE,
    weight       = 50 * data$var,
    opacity      = 0.75,
    group        = group_name
  )
  
}

# Data wrangling ------------------------------------------------------

## Convert log odds to d

effects_control_d <- effects_control %>% 
  mutate(
    d = log_odds*sqrt(3)/pi,
    var = var*3/pi^2,
    ci_lower = d - qnorm(.975)*sqrt(var),
    ci_upper = d + qnorm(.975)*sqrt(var)
  ) %>% 
  select(-log_odds)

## Link coordinates to effect estimates

effects_temporal <- effects_temporal %>% 
  left_join(lab_coords, by = "ID")

effects_temporal_2 <- effects_temporal_2 %>% 
  left_join(lab_coords, by = "ID")

effects_spatial <- effects_spatial %>% 
  left_join(lab_coords, by = "ID")

effects_likelihood <- effects_likelihood %>% 
  left_join(lab_coords, by = "ID")

effects_control_d <- effects_control_d %>% 
  left_join(lab_coords, by = "ID")

# Map -----------------------------------------------------------------

climr_leaflet <- leaflet() %>% 
  addTiles() %>% 
  
  # Temporal
  
  effect_layer(effects_temporal, palette_temporal, liberman_2002_color, "Liberman et al. (2002, Study 1)") %>% 
  
  # Spatial
  
  effect_layer(effects_temporal_2, palette_temporal_2, liberman_1998_color, "Liberman & Trope (1998, Study 1)") %>% 
  
  # Social
  
  effect_layer(effects_spatial, palette_spatial, henderson_2006_color, "Henderson et al. (2006, Study 1)") %>% 
  
  # Likelihood
  
  effect_layer(effects_likelihood, palette_likelihood, wakslak_2006_color, "Wakslak et al. (2006, Study 1)") %>% 
  
  # Layer control
  
  addLayersControl(
    baseGroups = c(
      "Liberman et al. (2002, Study 1)",
      "Liberman & Trope (1998, Study 1)",
      "Henderson et al. (2006, Study 1)",
      "Wakslak et al. (2006, Study 1)"
      ),
    options = layersControlOptions(collapsed = FALSE)
  )

