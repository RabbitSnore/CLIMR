################################################################################

# CLIMR -- Data Wrangling and Transformation

################################################################################

# Wrangling - Liberman & Trope (1998, Study 1) ---------------------------------

## Calculate BIF scores

temporal_bif <- temporal %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("t_c_bif"), starts_with("t_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("t_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("t_d_bif")))
    )
  )

## Adding comprehension checks

data_temporal <- temporal_raw %>% 
  select(sub, condition, ends_with("compcheck")) %>% 
  pivot_longer(
    cols      = ends_with("compcheck"),
    names_to  = "block",
    values_to = "comp_check"
  ) %>% 
  filter(complete.cases(comp_check)) %>% 
  mutate(
    comp_check = case_when(
      comp_check == "1" & condition == "distant" ~ 0,
      comp_check == "2" & condition == "close"   ~ 0,
      comp_check != "1" & condition == "distant" ~ 1, # 1 indicates an error
      comp_check != "2" & condition == "close"   ~ 1
    )
  ) %>% 
  select(sub, comp_check) %>% 
  left_join(temporal_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

# Wrangling - Fujita et al (2006, Study 1) -------------------------------------

## Calculate BIF scores

spatial_bif <- spatial %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("sp_c_bif"), starts_with("sp_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("sp_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("sp_d_bif")))
    )
  )

## Adding comprehension checks

data_spatial <- spatial_raw %>% 
  select(sub, condition, sp_compcheck_c, sp_compcheck_d) %>% 
  pivot_longer(
    cols      = c("sp_compcheck_c", "sp_compcheck_d"),
    names_to  = "block",
    values_to = "comp_check"
  ) %>% 
  filter(complete.cases(comp_check)) %>% 
  mutate(
    comp_check = case_when(
      comp_check == "2" & condition == "distant" ~ 0,
      comp_check == "1" & condition == "close"   ~ 0,
      comp_check != "2" & condition == "distant" ~ 1, # 1 indicates an error
      comp_check != "1" & condition == "close"   ~ 1
    )
  ) %>% 
  select(sub, comp_check) %>% 
  left_join(spatial_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

# Wrangling - Social Distance --------------------------------------------------

## Calculate BIF scores

social_bif <- social %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("so_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = sum(c_across(starts_with("so_bif")))
  )

## Adding comprehension checks

### Load lab-specific social distance stimuli (i.e., names)

social_names <- read.csv("data/utility/climr_social-stimuli.csv")

social_names_long <- social_names %>% 
  pivot_longer(
    cols          = c(
      starts_with("female"), 
      starts_with("male"), 
      starts_with("unisex")),
    names_pattern = "(.*)_(.)",
    names_to      = c("type", "number"),
    values_to     = "name"
  ) %>% 
  select(
    lab = lab_id, type, number, name
  ) %>% 
  mutate(
    name = tolower(name)
  ) %>% 
  type_convert()

### Join name information with raw data to identify comprehension check failures

social_comp <- social %>% 
  select(lab, sub, starts_with("comp"), name_pipe) %>% 
  mutate(
    name_pipe = tolower(name_pipe)
  ) %>% 
  pivot_longer(
    cols = starts_with("comp"),
    names_to = "check",
    values_to = "number",
    values_drop_na = TRUE
  ) %>% 
  mutate(
    type = case_when(
      check == "comp_female_1990" ~ "female_young",
      check == "comp_female_1960" ~ "female_old",
      check == "comp_male_1990" ~ "male_young",
      check == "comp_male_1960" ~ "male_old",
      check == "comp_nonbinary"    ~ "unisex",
    )
  ) %>% 
  left_join(social_names_long, by = c("lab", "type", "number")) %>% 
  mutate(
    comp_check = case_when(
      name_pipe == name ~ 0,
      name_pipe != name ~ 1
    )
  ) %>% 
  select(
    sub, comp_check
  )

### Join comprehension check data with main outcomes

data_social <- social_comp %>% 
  left_join(social_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

# Wrangling - Likelihood Distance ----------------------------------------------

## Calculate BIF scores

likelihood_bif <- likelihood %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("l_c_bif"), starts_with("l_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("l_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("l_d_bif")))
    )
  )

## Adding comprehension checks

data_likelihood <- likelihood_raw %>% 
  select(sub, condition, l_compcheck_c, l_compcheck_d) %>% 
  pivot_longer(
    cols      = c("l_compcheck_c", "l_compcheck_d"),
    names_to  = "block",
    values_to = "comp_check"
  ) %>% 
  filter(complete.cases(comp_check)) %>% 
  mutate(
    comp_check = case_when(
      comp_check == "1" & condition == "distant" ~ 0,
      comp_check == "6" & condition == "close"   ~ 0,
      comp_check != "1" & condition == "distant" ~ 1, # 1 indicates an error
      comp_check != "6" & condition == "close"   ~ 1
    )
  ) %>% 
  select(sub, comp_check) %>% 
  left_join(likelihood_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

# Wrangling - Manipulation Checks ----------------------------------------------

data_manipulation_check <- raw %>% 
  select(lab, modality, lab_modality, sub, id_subject, id_internal,
         contains("mancheck")) %>% 
  extract(
    col    = "mancheck",
    into   = c("distance", "condition"),
    regex  = "(.*)_.*_(.)",
    remove = FALSE
  ) %>% 
  mutate(
    distance = case_when(
      distance == "t"  ~ "temporal",
      distance == "sp" ~ "spatial",
      distance == "so" ~ "social",
      distance == "l"  ~ "likelihood"
    ),
    condition = case_when(
      condition == "c" ~ "close",
      condition == "d" ~ "distant"
    )
  )

data_manipulation_check$mc <- data_manipulation_check %>% 
  select(ends_with("_c"), ends_with("_d")) %>% 
  coalesce(!!!.)

data_mc_temporal   <- data_manipulation_check %>% 
  filter(distance == "temporal")

data_mc_spatial    <- data_manipulation_check %>% 
  filter(distance == "spatial")

data_mc_social     <- data_manipulation_check %>% 
  filter(distance == "social")

data_mc_likelihood <- data_manipulation_check %>% 
  filter(distance == "likelihood")
