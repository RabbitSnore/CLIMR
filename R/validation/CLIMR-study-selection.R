################################################################################

# CLIMR -- Study Selection Supplemental

################################################################################

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "ggplot2", "cowplot", "osfr")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

# Import data ------------------------------------------------------------------

selection <- read.csv("./data/study-exclusion-data.csv")

# Summary information ----------------------------------------------------------

exclusion_table <- 
selection %>% 
  group_by(distance) %>% 
  summarise(
    N                                              = n(),
    validation                                     = sum(exclusion_fine == 1, na.rm = TRUE),
    perceptual                                     = sum(exclusion_fine == 2, na.rm = TRUE),
    previous_replication                           = sum(exclusion_fine == 3, na.rm = TRUE),
    design                                         = sum(exclusion_fine == 4, na.rm = TRUE),
    logistical                                     = sum(exclusion_fine == 5, na.rm = TRUE),
    unavailable                                    = sum(exclusion_fine == 6, na.rm = TRUE),
    against_theory                                 = sum(exclusion_fine == 7, na.rm = TRUE),
    included                                       = sum(included, na.rm = TRUE),
    "Studies screened for eligibility"             = N,
    "Measure failed validation"                    = N - validation,
    "Perceptual measure"                           = N - validation - perceptual,
    "Previous unsuccessful replication"            = N - validation - perceptual - previous_replication,
    "Design issues or retracted"                   = N - validation - perceptual - previous_replication - design,
    "Logistical issues"                            = N - validation - perceptual - previous_replication - design - logistical,
    "Study unpublished or unavailable"             = N - validation - perceptual - previous_replication - design - logistical - unavailable,
    "Original effect inconsistent with theory"     = N - validation - perceptual - previous_replication - design - logistical - unavailable - against_theory,
    "Potentially suitable"                         = N - validation - perceptual - previous_replication - design - logistical - unavailable - against_theory
  )

exclusion_long <- exclusion_table %>% 
  pivot_longer(
    cols = names(.[, 11:19]),
    names_to = "criterion",
    values_to = "value"
  ) %>% 
  mutate(
    excluded = case_when(                        
      criterion == "Measure failed validation"                    ~ validation, 
      criterion == "Perceptual measure"                           ~ perceptual,                          
      criterion == "Previous unsuccessful replication"            ~ previous_replication,           
      criterion == "Design issues or retracted"                   ~ design,                  
      criterion == "Logistical issues"                            ~ logistical,                           
      criterion == "Study unpublished or unavailable"             ~ unavailable,            
      criterion == "Original effect inconsistent with theory"     ~ against_theory),
    label = paste(excluded, "excluded", sep = " "),
    label = case_when(
      criterion == "Studies screened for eligibility" ~ as.character(N),
      criterion == "Potentially suitable"             ~ as.character(included),
      !is.na(criterion)                               ~ label
    ),
    distance = case_when(
      distance == 0 ~ "Temporal",
      distance == 1 ~ "Spatial",
      distance == 2 ~ "Social",
      distance == 3 ~ "Likelihood"
    )
    ) %>% 
  pivot_longer(
    cols = c("value", "excluded"),
    values_to = "value",
    names_to = "group"
  )

exclusion_long$criterion <- ordered(exclusion_long$criterion, 
                                     levels = rev(c(
                                       "Studies screened for eligibility",                           
                                       "Measure failed validation",                   
                                       "Perceptual measure",                          
                                       "Previous unsuccessful replication",           
                                       "Design issues or retracted",                  
                                       "Logistical issues",                           
                                       "Study unpublished or unavailable",            
                                       "Original effect inconsistent with theory",    
                                       "Potentially suitable"                       
                                     )))

exclusion_long$distance <- ordered(exclusion_long$distance, 
                                   levels = c(
                                     "Temporal",
                                     "Spatial",
                                     "Social",
                                     "Likelihood"
                                   ))

exclusion_long <- exclusion_long %>% 
  filter(!is.na(value))

# Data visualization -----------------------------------------------------------

## Create figure

selection_plot <- 
ggplot(exclusion_long,
       aes(
         x = value,
         y = criterion,
         fill = group
       )) +
  facet_wrap(~ distance, nrow = 1) +
  geom_col(
    width = .40
  ) +
  geom_text(
    inherit.aes = FALSE,
    aes(
      x = 2,
      y = criterion,
      label = label
    ),
    hjust = 0,
    nudge_y = .33,
    size = 3.5
  ) +
  guides(
    fill = "none"
  ) +
  labs(
    x = NULL,
    y = NULL
  ) +
  geom_hline(
    yintercept = 1.5
  ) +
  geom_hline(
    yintercept = 9.5
  ) +
  scale_fill_manual(
    values = c(
      "#D5D5D5",
      "#909090"
    )
  ) +
  theme_classic()

## Export figure

if (!dir.exists("./plots/")) {
  
  dir.create("./plots/")
  
}

save_plot("./figures/climr_study-selection.png",  selection_plot, base_height = 6, base_width = 10)
save_plot("./figures/climr_study-selection.tiff", selection_plot, base_height = 6, base_width = 10)
save_plot("./figures/climr_study-selection.jpg",  selection_plot, base_height = 6, base_width = 10)



