################################################################################

# CLIMR -- Project tracking 

################################################################################

# This script assumes the importation and wrangling scripts have already been
# run.

# Load data --------------------------------------------------------------------

# Retrieve ISO country information

iso_countries <- read_csv("https://raw.githubusercontent.com/lukes/ISO-3166-Countries-with-Regional-Codes/master/all/all.csv")

colnames(iso_countries) <- str_replace_all(colnames(iso_countries), "-", "_")

# Wrangle data -----------------------------------------------------------------

# Combine and join data

included <- bind_rows(data_temporal, data_spatial, data_social, data_likelihood)

included <- included %>% 
  left_join(
    select(raw, sub, end_date,
           gender, country, age),
    by = "sub"
  )

included <- included %>% 
  group_by(lab) %>% 
  mutate(
    finish_date = max(end_date)
  ) %>% 
  ungroup() %>% 
  arrange(finish_date)

# Cumulative sample size over time

## Across all labs

end_date     <- as_datetime(sort(unique(included$end_date)))
cumulative_n <- cumsum(table(included$end_date))

collection <- data.frame(end_date, cumulative_n)

## Totals for each lab

lab_collection <- data.frame()

for (i in 1:length(unique(included$lab))) {
  
  lab_data <- included[included$lab == unique(included$lab)[i], ]
  
  ends     <- as_datetime(sort(unique(lab_data$end_date)))
  cume_ns  <- cumsum(table(lab_data$end_date))
  
  lab_dates <- data.frame(lab = rep(unique(included$lab)[i], length(ends)), 
                          end_date     = ends, 
                          cumulative_n = cume_ns,
                          finish_date  = unique(lab_data$finish_date))
  
  lab_dates <- bind_rows(lab_dates, 
                         list(
                           lab          = unique(included$lab)[i], 
                           end_date     = max(collection$end_date),
                           cumulative_n = max(lab_dates$cumulative_n),
                           finish_date  = unique(lab_data$finish_date)))
  
  lab_collection <- bind_rows(lab_collection, lab_dates)
  
  # Look, I know I should have preallocated the memory. We all know I should
  # have. But I can't be bothered. Why don't you mind your own business? This
  # analysis isn't all that important, and it won't really be that
  # computationally intensive anyway. Use the extra 12 seconds to take a few
  # deep breaths or look out a window or something.
  
}

# Lab data collection start dates and end dates

lab_starts <- included %>% 
  group_by(lab) %>% 
  summarise(
    start = min(end_date)
  ) %>% 
  left_join(collection, by = c("start" = "end_date")) %>% 
  arrange(start)

lab_ends <- lab_collection %>% 
  group_by(lab) %>% 
  summarise(
    finish_date = unique(finish_date)
  ) %>% 
  arrange(finish_date)

lab_collection$lab <- factor(lab_collection$lab,
                             levels = lab_starts$lab)

# Demographic for alluvial plot

demo_alluvia <- included %>%
  mutate(
    age_cat = cut_number(age, 2)
  ) %>% 
  group_by(country, gender, age_cat) %>% 
  summarise(
    n = n()
  ) %>% 
  ungroup() %>% 
  filter(complete.cases(.))

# Join region data

region_data <- iso_countries %>% 
  select(alpha_2, region)

demo_alluvia <- demo_alluvia %>% 
  left_join(region_data, by = c("country" = "alpha_2"))

# Visualizations ---------------------------------------------------------------

rainbow_plot <- 
  ggplot(lab_collection,
         aes(
           x = end_date,
           y = cumulative_n,
           group = lab,
           fill = lab
         )) +
  geom_area(
    color = "white",
    linewidth = .60,
    alpha     = .80
  ) +
  labs(
    y = "Cumulative total sample size",
    x = "Date"
  ) +
  guides(
    fill = "none"
  ) +
  scale_color_manual(
    values = rainbow(length(unique(lab_collection$lab)), s = .5)
  ) +
  scale_x_datetime(
    date_breaks = "week"
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)
  )

# CURRENTLY NOT WORKING
ggplot(demo_alluvia,
       aes(
         y     = n,
         fill  = as.factor(gender),
         axis1 = region,
         axis2 = country,
         axis3 = age_cat
       )) +
  geom_alluvium() +
  geom_stratum(
    width = .10,
    fill  = "black",
    color = "darkgrey",
    alpha = .30
  ) +
  geom_label(
    stat = "stratum", 
    aes(
      label = after_stat(stratum)
      ),
    fill = "grey"
    ) +
  scale_fill_brewer(
    type = "qual",
    labels = c("Man", "Woman", "Nonbinary", "Other genders")
  ) +
  scale_x_discrete(
    limits = c("Region", "Country", "Age"), 
    expand = c(.05, .05)
  ) +
  labs(
    fill = "Gender"
  ) +
  theme_classic()
