################################################################################

# CLIMR -- Data Wrangling and Transformation

################################################################################

# Wrangling - Liberman & Trope (1998, Study 1) ---------------------------------

## Calculate BIF scores

temporal_bif <- temporal %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("t_c_bif"), starts_with("t_d_bif")) %>% 
  select( # Remove unused items
    -t_c_bif_03, -t_d_bif_03,
    -t_c_bif_05, -t_d_bif_05,
    -t_c_bif_06, -t_d_bif_06,
    -t_c_bif_13, -t_d_bif_13,
    -t_c_bif_14, -t_d_bif_14,
    -t_c_bif_21, -t_d_bif_21
  ) %>% 
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

## Long form BIF data (selected items)

bif_names_temporal <- 
  colnames(data_temporal)[str_detect(colnames(data_temporal), "bif_\\d\\d")]

data_bif_temporal <- data_temporal %>% 
  pivot_longer(
    cols           = all_of(bif_names_temporal),
    names_to       = "item",
    names_pattern  = "._._(bif_..)",
    values_to      = "bif", 
    values_drop_na = TRUE
  )

## Long form BIF data (all items)

temporal_bif_full <- temporal %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("t_c_bif"), starts_with("t_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("t_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("t_d_bif")))
    )
  )

data_temporal_full <- temporal_raw %>% 
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
  left_join(temporal_bif_full, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

bif_names_temporal_full <- 
  colnames(data_temporal_full)[str_detect(colnames(data_temporal_full), "bif_\\d\\d")]

data_bif_temporal_full <- data_temporal_full %>% 
  pivot_longer(
    cols           = all_of(bif_names_temporal_full),
    names_to       = "item",
    names_pattern  = "._._(bif_..)",
    values_to      = "bif", 
    values_drop_na = TRUE
  )

# Wrangling - Fujita et al (2006, Study 1) -------------------------------------

## Calculate BIF scores

spatial_bif <- spatial %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("sp_c_bif"), starts_with("sp_d_bif")) %>% 
  select( # Remove unused items
    -sp_c_bif_01, -sp_d_bif_01,
    -sp_c_bif_03, -sp_d_bif_03,
    -sp_c_bif_06, -sp_d_bif_06,
    -sp_c_bif_08, -sp_d_bif_08,
    -sp_c_bif_11, -sp_d_bif_11,
    -sp_c_bif_13, -sp_d_bif_13,
    -sp_c_bif_15, -sp_d_bif_15,
    -sp_c_bif_17, -sp_d_bif_17,
    -sp_c_bif_18, -sp_d_bif_18,
    -sp_c_bif_21, -sp_d_bif_21,
    -sp_c_bif_24, -sp_d_bif_24,
    -sp_c_bif_25, -sp_d_bif_25
  ) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("sp_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("sp_d_bif")))
    )
  )

## Adding comprehension checks

data_spatial <- spatial_raw %>% 
  select(sub, condition, sp_compcheck_c, sp_compcheck_d, location) %>% 
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
  select(sub, comp_check, location) %>% 
  left_join(spatial_bif, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

## Long form BIF data (selected items)

bif_names_spatial <- 
  colnames(data_spatial)[str_detect(colnames(data_spatial), "bif_\\d\\d")]

data_bif_spatial <- data_spatial %>% 
  pivot_longer(
    cols           = all_of(bif_names_spatial),
    names_to       = "item",
    names_pattern  = "._._(bif_..)",
    values_to      = "bif", 
    values_drop_na = TRUE
  )

## Long form BIF data (all items)

spatial_bif_full <- spatial %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("sp_c_bif"), starts_with("sp_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("sp_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("sp_d_bif")))
    )
  )

data_spatial_full <- spatial_raw %>% 
  select(sub, condition, sp_compcheck_c, sp_compcheck_d, location) %>% 
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
  select(sub, comp_check, location) %>% 
  left_join(spatial_bif_full, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

bif_names_spatial_full <- 
  colnames(data_spatial_full)[str_detect(colnames(data_spatial_full), "bif_\\d\\d")]

data_bif_spatial_full <- data_spatial_full %>% 
  pivot_longer(
    cols           = all_of(bif_names_spatial_full),
    names_to       = "item",
    names_pattern  = "._._(bif_..)",
    values_to      = "bif", 
    values_drop_na = TRUE
  )

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

## Long form BIF data

bif_names_social <- 
  colnames(data_social)[str_detect(colnames(data_social), "bif_\\d\\d")]

data_bif_social <- data_social %>% 
  pivot_longer(
    cols           = all_of(bif_names_social),
    names_to       = "item",
    names_pattern  = ".._(bif_..)",
    values_to      = "bif", 
    values_drop_na = TRUE
  )

# Wrangling - Likelihood Distance ----------------------------------------------

## Calculate BIF scores

likelihood_bif <- likelihood %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("l_c_bif"), starts_with("l_d_bif")) %>% 
  rowwise() %>% 
  select( # Remove unused items
    -l_c_bif_02, -l_d_bif_02,
    -l_c_bif_03, -l_d_bif_03,
    -l_c_bif_04, -l_d_bif_04,
    -l_c_bif_05, -l_d_bif_05,
    -l_c_bif_06, -l_d_bif_06,
    -l_c_bif_10, -l_d_bif_10,
    -l_c_bif_13, -l_d_bif_13,
    -l_c_bif_14, -l_d_bif_14,
    -l_c_bif_15, -l_d_bif_15,
    -l_c_bif_16, -l_d_bif_16,
    -l_c_bif_17, -l_d_bif_17,
    -l_c_bif_19, -l_d_bif_19,
    -l_c_bif_20, -l_d_bif_20,
    -l_c_bif_21, -l_d_bif_21,
    -l_c_bif_23, -l_d_bif_23,
    -l_c_bif_24, -l_d_bif_24
  ) %>% 
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

## Long form BIF data (selected items)

bif_names_likelihood <- 
  colnames(data_likelihood)[str_detect(colnames(data_likelihood), "bif_\\d\\d")]

data_bif_likelihood <- data_likelihood %>% 
  pivot_longer(
    cols           = all_of(bif_names_likelihood),
    names_to       = "item",
    names_pattern  = "._._(bif_..)",
    values_to      = "bif", 
    values_drop_na = TRUE
  )

## Long form BIF data (all items)

likelihood_bif_full <- likelihood %>% 
  select(lab, modality, lab_modality, sub, condition, 
         starts_with("l_c_bif"), starts_with("l_d_bif")) %>% 
  rowwise() %>% 
  mutate(
    bif_total = case_when(
      condition == "close"   ~ sum(c_across(starts_with("l_c_bif"))),
      condition == "distant" ~ sum(c_across(starts_with("l_d_bif")))
    )
  )

data_likelihood_full <- likelihood_raw %>% 
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
  left_join(likelihood_bif_full, by = "sub") %>% 
  relocate(comp_check, .after = bif_total)

bif_names_likelihood_full <- 
  colnames(data_likelihood_full)[str_detect(colnames(data_likelihood_full), "bif_\\d\\d")]

data_bif_likelihood_full <- data_likelihood_full %>% 
  pivot_longer(
    cols           = all_of(bif_names_likelihood_full),
    names_to       = "item",
    names_pattern  = "._._(bif_..)",
    values_to      = "bif", 
    values_drop_na = TRUE
  )

# Wrangling - Manipulation Checks ----------------------------------------------

data_manipulation_check <- raw %>% 
  select(lab, modality, lab_modality, sub, id_subject, id_internal,
         contains("mancheck"), location) %>% 
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
