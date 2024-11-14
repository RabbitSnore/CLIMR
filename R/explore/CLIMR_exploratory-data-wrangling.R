################################################################################

# CLIMR -- Exploration wrangling

################################################################################

# Data wrangling for exploration -----------------------------------------------

# Lab languages

lab_languages <- raw %>% 
  select(lab, language) %>% 
  unique() %>% 
  # Remove TR_06 because they used two languages
  filter(lab != "TR_06")

# Country, region, and language for all effects

effects_temporal <- effects_temporal %>% 
  extract(
    col    = "lab",
    into   = "country",
    regex  = "(..)_..",
    remove = FALSE
  ) %>% 
  left_join(region_data, by = c("country" = "alpha_2")) %>% 
  left_join(lab_languages, by = "lab")

effects_spatial <- effects_spatial %>% 
  extract(
    col    = "lab",
    into   = "country",
    regex  = "(..)_..",
    remove = FALSE
  ) %>% 
  left_join(region_data, by = c("country" = "alpha_2")) %>% 
  left_join(lab_languages, by = "lab")

effects_social <- effects_social %>% 
  extract(
    col    = "lab",
    into   = "country",
    regex  = "(..)_..",
    remove = FALSE
  ) %>% 
  left_join(region_data, by = c("country" = "alpha_2")) %>% 
  left_join(lab_languages, by = "lab")

effects_likelihood <- effects_likelihood %>% 
  extract(
    col    = "lab",
    into   = "country",
    regex  = "(..)_..",
    remove = FALSE
  ) %>% 
  left_join(region_data, by = c("country" = "alpha_2")) %>% 
  left_join(lab_languages, by = "lab")

# Manipulation check effects

effects_temporal <- effects_temporal %>% 
  left_join(
    effects_mc_temporal %>% 
      rename(
        d_mc   = d,
        var_mc = var
      ) %>% 
      select(ID, d_mc, var_mc),
    by = "ID"
  )

effects_spatial <- effects_spatial %>% 
  left_join(
    effects_mc_spatial %>% 
      rename(
        d_mc   = d,
        var_mc = var
      ) %>% 
      select(ID, d_mc, var_mc),
    by = "ID"
  )

effects_social <- effects_social %>% 
  left_join(
    effects_mc_social %>% 
      rename(
        d_mc   = d,
        var_mc = var
      ) %>% 
      select(ID, d_mc, var_mc),
    by = "ID"
  )

effects_likelihood <- effects_likelihood %>% 
  left_join(
    effects_mc_likelihood %>% 
      rename(
        d_mc   = d,
        var_mc = var
      ) %>% 
      select(ID, d_mc, var_mc),
    by = "ID"
  )

# BIF items for reliability analysis -------------------------------------------

data_bif_temporal_wide <- data_bif_temporal %>% 
  pivot_wider(
    id_cols     = sub,
    names_from  = item,
    values_from = bif
  )

data_bif_spatial_wide <- data_bif_spatial %>% 
  pivot_wider(
    id_cols     = sub,
    names_from  = item,
    values_from = bif
  )

data_bif_social_wide <- data_bif_social %>% 
  pivot_wider(
    id_cols     = sub,
    names_from  = item,
    values_from = bif
  )

data_bif_likelihood_wide <- data_bif_likelihood %>% 
  pivot_wider(
    id_cols     = sub,
    names_from  = item,
    values_from = bif
  )

