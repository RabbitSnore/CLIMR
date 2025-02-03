################################################################################

# CLIMR -- Descriptive statistics for the BIF

################################################################################

# BIF Total Scores -------------------------------------------------------------

bif_mean_temporal <-  data_temporal %>% 
  group_by(condition) %>% 
  summarise(
    Mean   = mean(bif_total, na.rm = TRUE),
    SD     = sd(bif_total, na.rm = TRUE)
  )

bif_mean_spatial <-  data_spatial %>% 
  group_by(condition) %>% 
  summarise(
    Mean   = mean(bif_total, na.rm = TRUE),
    SD     = sd(bif_total, na.rm = TRUE)
  )

bif_mean_social <-  data_social %>% 
  group_by(condition) %>% 
  summarise(
    Mean   = mean(bif_total, na.rm = TRUE),
    SD     = sd(bif_total, na.rm = TRUE)
  )

bif_mean_likelihood <-  data_likelihood %>% 
  group_by(condition) %>% 
  summarise(
    Mean   = mean(bif_total, na.rm = TRUE),
    SD     = sd(bif_total, na.rm = TRUE)
  )

# BIF Item Proportions ---------------------------------------------------------

# Temporal

bif_item_desc_temporal <-  data_bif_temporal %>%
  filter(complete.cases(bif)) %>% 
  group_by(item) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    item, ci
  )
  

colnames(bif_item_desc_temporal) <- c("Item", "Proportion Abstract [95% CI]")

bif_item_desc_temporal$Item <- str_remove(bif_item_desc_temporal$Item, 
                                          "bif_0?")

# Spatial

bif_item_desc_spatial <-  data_bif_spatial %>%
  filter(complete.cases(bif)) %>% 
  group_by(item) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    item, ci
  )
  

colnames(bif_item_desc_spatial) <- c("Item", "Proportion Abstract [95% CI]")

bif_item_desc_spatial$Item <- str_remove(bif_item_desc_spatial$Item, 
                                          "bif_0?")

# Social

bif_item_desc_social <-  data_bif_social %>%
  filter(complete.cases(bif)) %>% 
  group_by(item) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    item, ci
  )
  

colnames(bif_item_desc_social) <- c("Item", "Proportion Abstract [95% CI]")

bif_item_desc_social$Item <- str_remove(bif_item_desc_social$Item, 
                                          "bif_0?")

# Likelihood

bif_item_desc_likelihood <-  data_bif_likelihood %>%
  filter(complete.cases(bif)) %>% 
  group_by(item) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    item, ci
  )
  

colnames(bif_item_desc_likelihood) <- c("Item", "Proportion Abstract [95% CI]")

bif_item_desc_likelihood$Item <- str_remove(bif_item_desc_likelihood$Item, 
                                          "bif_0?")

# Export tables

if (!dir.exists("output")) {
  
  dir.create("output")
  
}

write_csv(bif_item_desc_temporal, 
          "output/CLIMR_bif_descriptives_temporal.csv")

write_csv(bif_item_desc_spatial, 
          "output/CLIMR_bif_descriptives_spatial.csv")

write_csv(bif_item_desc_social, 
          "output/CLIMR_bif_descriptives_social.csv")

write_csv(bif_item_desc_likelihood, 
          "output/CLIMR_bif_descriptives_likelihood.csv")

# BIF Item Proportions by Condition  -------------------------------------------

# Temporal

bif_item_desccond_temporal <-  data_bif_temporal %>%
  filter(complete.cases(bif)) %>% 
  group_by(item, condition) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    condition, item, ci
  ) %>% 
  pivot_wider(
    id_cols     = item,
    names_from  = condition,
    values_from = ci
  )


colnames(bif_item_desccond_temporal) <- c("Item", "Close", "Distant")

bif_item_desccond_temporal$Item <- str_remove(bif_item_desccond_temporal$Item, 
                                          "bif_0?")

# Spatial

bif_item_desccond_spatial <-  data_bif_spatial %>%
  filter(complete.cases(bif)) %>% 
  group_by(item, condition) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    condition, item, ci
  ) %>% 
  pivot_wider(
    id_cols     = item,
    names_from  = condition,
    values_from = ci
  )


colnames(bif_item_desccond_spatial) <- c("Item", "Close", "Distant")

bif_item_desccond_spatial$Item <- str_remove(bif_item_desccond_spatial$Item, 
                                         "bif_0?")

# Social

bif_item_desccond_social <-  data_bif_social %>%
  filter(complete.cases(bif)) %>% 
  group_by(item, condition) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    condition, item, ci
  ) %>% 
  pivot_wider(
    id_cols     = item,
    names_from  = condition,
    values_from = ci
  )


colnames(bif_item_desccond_social) <- c("Item", "Close", "Distant")

bif_item_desccond_social$Item <- str_remove(bif_item_desccond_social$Item, 
                                        "bif_0?")

# Likelihood

bif_item_desccond_likelihood <-  data_bif_likelihood %>%
  filter(complete.cases(bif)) %>% 
  group_by(item, condition) %>% 
  summarise(
    prop  = round(sum(bif)/n(), 3),
    se    = sqrt((prop * (1 - prop))/n()), 
    ci_lb = round(prop - se*qnorm(.975), 3),
    ci_ub = round(prop + se*qnorm(.975), 3),
    ci    = paste(format(prop, nsmall = 3), 
                  " [", format(ci_lb, nsmall = 3), 
                  ", ", format(ci_ub, nsmall = 3), "]", 
                  sep = "")
  ) %>% 
  select(
    condition, item, ci
  ) %>% 
  pivot_wider(
    id_cols     = item,
    names_from  = condition,
    values_from = ci
  )


colnames(bif_item_desccond_likelihood) <- c("Item", "Close", "Distant")

bif_item_desccond_likelihood$Item <- str_remove(bif_item_desccond_likelihood$Item, 
                                            "bif_0?")

# Export tables

if (!dir.exists("output")) {
  
  dir.create("output")
  
}

write_csv(bif_item_desccond_temporal, 
          "output/CLIMR_bif_descriptives-condition_temporal.csv")

write_csv(bif_item_desccond_spatial, 
          "output/CLIMR_bif_descriptives-condition_spatial.csv")

write_csv(bif_item_desccond_social, 
          "output/CLIMR_bif_descriptives-condition_social.csv")

write_csv(bif_item_desccond_likelihood, 
          "output/CLIMR_bif_descriptives-condition_likelihood.csv")

