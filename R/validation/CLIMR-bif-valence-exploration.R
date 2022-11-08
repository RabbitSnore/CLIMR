################################################################################

# CLIMR -- BIF Valence Exploration, Yan et al (2016), 10.1093/jcr/ucw045

################################################################################

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr", "viridis", "leaflet", "osfr", "psychonetrics", "qgraph", "psych", "readxl")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

# Import and wrangle data ------------------------------------------------------

# The data for Experiment 3 was shared with us by the authors.

yan_exp_3 <- read_xlsx("./data/validation/yan/yan-et-al_experiment-3.xlsx")

yan_exp_3_long <- yan_exp_3 %>%
  select(-bif) %>% 
  pivot_longer(
    cols = starts_with("b"),
    names_to = "item",
    values_to = "bif"
  ) %>% 
  mutate(
    item = case_when(
      item == "b1"  ~ "bif_01",
      item == "b2"  ~ "bif_02",
      item == "b3"  ~ "bif_03",
      item == "b4"  ~ "bif_04",
      item == "b5"  ~ "bif_05",
      item == "b6"  ~ "bif_06",
      item == "b7"  ~ "bif_07",
      item == "b8"  ~ "bif_08",
      item == "b9"  ~ "bif_09",
      item == "b10" ~ "bif_10",
      item == "b11" ~ "bif_11",
      item == "b12" ~ "bif_12",
      item == "b13" ~ "bif_13",
      item == "b14" ~ "bif_14",
      item == "b15" ~ "bif_15",
      item == "b16" ~ "bif_16",
      item == "b17" ~ "bif_17",
      item == "b18" ~ "bif_18",
      item == "b19" ~ "bif_19",
      item == "b20" ~ "bif_20",
      item == "b21" ~ "bif_21",
      item == "b22" ~ "bif_22",
      item == "b23" ~ "bif_23",
      item == "b24" ~ "bif_24",
      item == "b25" ~ "bif_25"
    )
  )

bif_d_sep <- read.csv("./data/validation/climr_bif-valence_separate.csv")
bif_d_rel <- read.csv("./data/validation/climr_bif-valence_relative.csv")

yan_exp_3_long <- yan_exp_3_long %>% 
  left_join(select(bif_d_sep, item, d_sep = d), by = "item") %>% 
  left_join(select(bif_d_rel, item, d_rel = d), by = "item")

yan_exp_3_long$mani_mode <- as.factor(yan_exp_3_long$mani_mode)
yan_exp_3_long$mani_social <- as.factor(yan_exp_3_long$mani_social)

yan_exp_3_long$d_sep_mc <- scale(yan_exp_3_long$d_sep, scale = FALSE)
yan_exp_3_long$d_rel_mc <- scale(yan_exp_3_long$d_rel, scale = FALSE)

# Exploratory analyses ---------------------------------------------------------

# Social distance manipulation, random slopes

model_soc  <- glmer(bif ~ mani_social + (1|id) + (1|item), 
                    data = yan_exp_3_long, family = binomial())
model_rs   <- glmer(bif ~ mani_social + (1|id) + (1 + mani_social|item), 
                    data = yan_exp_3_long, family = binomial())

lrt_rs <- anova(model_soc, model_rs, test = "LRT")

# Valence, separate ratings

model_val_sep      <- glmer(bif ~ mani_social + d_sep_mc + (1|id) + (1|item), 
                            data = yan_exp_3_long, family = binomial())
model_val_sep_int  <- glmer(bif ~ mani_social * d_sep_mc + (1|id) + (1|item), 
                            data = yan_exp_3_long, family = binomial())

lrt_val_sep <- anova(model_soc, model_val_sep, model_val_sep_int, test = "LRT")

# Valence, relative ratings

model_val_rel      <- glmer(bif ~ mani_social + d_rel_mc + (1|id) + (1|item), 
                            data = yan_exp_3_long, family = binomial())
model_val_rel_int  <- glmer(bif ~ mani_social * d_rel_mc + (1|id) + (1|item), 
                            data = yan_exp_3_long, family = binomial())

lrt_val_rel <- anova(model_soc, model_val_rel, model_val_rel_int, test = "LRT")

# Visualization

bif_valence_scatter <- 
bif_d_rel %>% 
  select(everything(), d_rel = d) %>% 
  left_join(select(bif_d_sep, item, d_sep = d), by = "item") %>% 
  ggplot(
    aes(
      x = d_sep,
      y = d_rel
    )
  ) +
  geom_point() +
  scale_x_continuous(
    limits = c(-0.50, 2.50),
    breaks = seq(-0.50, 2.50, 0.50)
  ) +
  scale_y_continuous(
    limits = c(-0.50, 2.50),
    breaks = seq(-0.50, 2.50, 0.50)
  ) +
  labs(
    x = "Response option valence difference (separate ratings)",
    y = "Response option valence difference (relative ratings)"
  ) +
  theme_classic()

cowplot::save_plot("./figures/climr_bif-valence-scatter.png", bif_valence_scatter, base_height = 7, base_width = 7)
cowplot::save_plot("./reports/figures/climr_bif-valence-scatter.png", bif_valence_scatter, base_height = 7, base_width = 7)
