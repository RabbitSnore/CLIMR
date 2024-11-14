################################################################################

# CLIMR -- Exploration of Data from Past Studies

################################################################################

# Import data ------------------------------------------------------------------

# Download the Sánchez et al data from OSF if it is not already downloaded.

if (!file.exists(".data/validation/BIF Study Data.csv")) {
  
  osf_retrieve_file("5eb0a19469d3e10137de8ec2") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}


sanchez_raw <- read.csv("./data/validation/BIF Study Data.csv")

if (!file.exists("./data/validation/grinfeld/study2C.csv")) {
  
  osf_retrieve_file("6042607a67386c048261f97a") %>% 
    osf_download(path = "./data/validation/grinfeld/",
                 conflicts = "overwrite")
  
}

grinfeld_2c     <- read.csv("./data/validation/grinfeld/study2C.csv")

# Clean and Wrangle ------------------------------------------------------------

# Sánchez et al

sanchez <- sanchez_raw %>% 
  filter(Exclude == 0)

sanchez_long <- sanchez %>% 
  select(-BIF_Total) %>% 
  pivot_longer(
    cols = starts_with("BIF"),
    names_to = "item",
    values_to = "bif"
  )

sanchez_long$item <- str_replace(sanchez_long$item,
                                 "BIF",
                                 "bif_")

sanchez_long$condition <- as.factor(sanchez_long$Distance_condition)

## Join with valence data

sanchez_long <- sanchez_long %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

# Grinfeld et al

grinfeld_2c_bif <- grinfeld_2c %>% 
  pivot_longer(
    cols = c(ends_with("_A"), ends_with("_H")),
    names_pattern = "(.*)_.",
    names_to = "item",
    values_to = "bif_response"
  ) %>% 
  filter(complete.cases(bif_response)) %>% 
  pivot_wider(
    id_cols = "workerId",
    names_from = "item",
    values_from = "bif_response"
  )

grinfeld_2c_test <- grinfeld_2c_bif %>% 
  left_join(select(grinfeld_2c, workerId, condition), by = "workerId")

grinfeld_2c_long <- grinfeld_2c_test %>% 
  pivot_longer(
    cols = colnames(select(grinfeld_2c_test, -workerId, -condition)),
    names_to = "item",
    values_to = "bif"
  )

## Join with valence data

bif_key <- data.frame(
  item        = unique(grinfeld_2c_long$item),
  item_number = paste("bif_", 
                      str_pad(1:25, 
                              width = 2, 
                              side = "left", 
                              pad = "0"),
                      sep = ""))

grinfeld_2c_long <- grinfeld_2c_long %>% 
  left_join(bif_key, by = "item") %>% 
  rename(
    item_name = item,
    item      = item_number
  ) %>% 
  left_join(select(bif_d_rel, item, d), by = "item")


# Analysis ---------------------------------------------------------------------

# Sánchez et al 

glmm_sanchez_bif_base <- glmer(bif 
                               ~ condition 
                               + (1|ID)
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = sanchez_long)

glmm_sanchez_bif_val  <- glmer(bif 
                               ~ condition 
                               + d 
                               + (1|ID)
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = sanchez_long)

glmm_sanchez_bif_int  <- glmer(bif 
                               ~ condition 
                               * d 
                               + (1|ID)
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = sanchez_long)

lrt_val_sanchez       <- anova(glmm_sanchez_bif_base, 
                               glmm_sanchez_bif_val, 
                               glmm_sanchez_bif_int, 
                               test = "LRT")

glmm_sanchez_d_report <- paste(
  round(summary(glmm_sanchez_bif_int)$coefficients[2, 1] * sqrt(3)/pi, 2),
  ", 95% CI [",
  format(
    round(
      (summary(glmm_sanchez_bif_int)$coefficients[2, 1] 
       - qnorm(.975)*summary(glmm_sanchez_bif_int)$coefficients[2, 2]) 
      * sqrt(3)/pi, 2), 
    nsmall = 2),
  ", ",
  format(
    round(
      (summary(glmm_sanchez_bif_int)$coefficients[2, 1] 
       + qnorm(.975)*summary(glmm_sanchez_bif_int)$coefficients[2, 2]) 
      * sqrt(3)/pi, 2), 
    nsmall = 2),
  "]",
  sep = ""
)

# Grinfeld et al

glmm_grinfeld_bif_base <- glmer(bif 
                                ~ condition 
                                + (1|workerId) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = grinfeld_2c_long)

glmm_grinfeld_bif_val  <- glmer(bif 
                                ~ condition 
                                + d 
                                + (1|workerId) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = grinfeld_2c_long)

glmm_grinfeld_bif_int  <- glmer(bif 
                                ~ condition 
                                * d 
                                + (1|workerId) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = grinfeld_2c_long)

lrt_val_grinfeld       <- anova(glmm_grinfeld_bif_base, 
                                glmm_grinfeld_bif_val, 
                                glmm_grinfeld_bif_int, 
                                test = "LRT")
