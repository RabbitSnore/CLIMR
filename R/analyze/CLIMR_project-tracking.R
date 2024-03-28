################################################################################

# CLIMR -- Project tracking 

################################################################################

# This script assumes the importation and wrangling scripts have already been
# run.

# Note that this script requires the wesanderson package, which is currently not
# included in the list of required packages for the project.

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
           gender, country, language,
           age),
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

lab_final <- lab_collection %>% 
  group_by(lab) %>%
  mutate(
    start = min(end_date)
  ) %>% 
  filter(end_date == max(end_date)) %>% 
  unique() %>% 
  arrange(desc(start)) %>% 
  ungroup() %>% 
  mutate(
    final_n = cumsum(cumulative_n)
  )

# Age data

age_data <- included %>%
  mutate(
    age_cat = cut_number(age, 3)
  ) %>% 
  group_by(age_cat) %>% 
  summarise(
    n = n()
  ) %>% 
  ungroup() %>% 
  filter(complete.cases(.))

# Data for radial plots

## Country

radial_country_data <- included %>% 
  group_by(country) %>% 
  summarise(
    n = n()
  ) %>% 
  ungroup() %>% 
  mutate(
    country_angle = head(seq(0, 360, len = nrow(.) + 2), -2)
  )

## Language

radial_language_data <- included %>% 
  group_by(language) %>% 
  summarise(
    n = n()
  ) %>% 
  ungroup() %>% 
  mutate(
    country_angle = head(seq(0, 360, len = nrow(.) + 2), -2)
  )

# Join region data

region_data <- iso_countries %>% 
  select(alpha_2, region)

radial_country_data <- radial_country_data %>% 
  left_join(region_data, by = c("country" = "alpha_2"))

# Set factors

radial_country_data$country <- factor(
  radial_country_data$country,
  levels = arrange(radial_country_data, region)[, "country"][[1]])

included$gender <- factor(
  included$gender,
  levels = rev(c(2, 1, 3, 4))
)

# Visualizations ---------------------------------------------------------------

# Rainbow plot: Cumulative sample size over time

rainbow_plot <- 
  ggplot(lab_collection,
         aes(
           x     = end_date,
           y     = cumulative_n,
           group = lab,
           fill  = lab
         )) +
  geom_area(
    color     = "white",
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
  geom_text(
    data = lab_final,
    aes(
      x     = end_date - days(4),
      y     = final_n - 50,
      label = lab
    ),
    size = 2.5
  ) +
  scale_color_manual(
    values = rainbow(length(unique(lab_collection$lab)), s = .5)
  ) +
  scale_x_datetime(
    date_breaks = "week", 
    limits      = c(min(lab_collection$end_date),
                    max(lab_collection$end_date))
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)
  )

# Radial display of sample size by country and region

radial_country_plot <- 
ggplot(radial_country_data,
       aes(
         y     = n,
         yend  = n,
         x     = country,
         fill  = region
       )) +
  geom_col(
    color = "#171717",
    width = .60
  ) +
  scale_y_continuous(
    limits = c(-max(pretty(radial_country_data$n))/2, 
                max(pretty(radial_country_data$n))),
    breaks = seq(0, 
                 max(pretty(radial_country_data$n)),
                 max(pretty(radial_country_data$n))/5)
  ) +
  scale_fill_manual(
    values = wesanderson::wes_palette(n = length(unique(radial_country_data$region)), 
                                      "GrandBudapest1")
  ) +
  # scale_fill_manual(
  #   values = c("#331832", "#D81E5B", "#F0544F", "#C6D8D3")
  # ) +
  labs(
    x    = "",
    y    = "",
    fill = ""
  ) +
  geom_text(
    x = 0,
    y = -max(pretty(radial_country_data$n))/2,
    label = paste(length(unique(included$lab)), " labs\nN = ", nrow(included), sep = "")
  ) +
  coord_polar() +
  theme(
    legend.position  = "top", 
    axis.text.x      = element_text(size = 12),
    panel.grid       = element_line(color = "#E8E8E8"), 
    panel.background = element_rect(fill = "white")
    )

# Radial plot of sample size by language

radial_language_plot <- 
ggplot(radial_language_data,
       aes(
         y     = n,
         yend  = n,
         x     = language
       )) +
  geom_col(
    color = "#171717",
    fill  = "lightblue",
    width = .60
  ) +
  scale_y_continuous(
    limits = c(-max(pretty(radial_language_data$n))/2, 
                max(pretty(radial_language_data$n))),
    breaks = seq(0, 
                 max(pretty(radial_language_data$n)),
                 max(pretty(radial_language_data$n))/5)
  ) +
  labs(
    x    = "",
    y    = ""
  ) +
  geom_text(
    x     = 0,
    y     = -max(pretty(radial_language_data$n))/2,
    label = paste(length(unique(included$language)), "\nlanguages", sep = ""),
    size  = 4
  ) +
  coord_polar() +
  theme(
    legend.position  = "top", 
    axis.text.x      = element_text(size = 12),
    panel.grid       = element_line(color = "#E8E8E8"), 
    panel.background = element_rect(fill = "white")
    )

# Bar chart of sample size by gender

gender_bar_plot <- 
ggplot(included,
       aes(
         y    = gender,
         fill = gender
       )) +
  geom_bar(
    color = "#171717"
  ) +
  scale_fill_manual(
    values = wesanderson::wes_palette(n = length(unique(radial_country_data$region)), 
                                      "FantasticFox1"),
    labels = rev(c("Female", "Male", "Nonbinary", "Other"))
  ) +
  labs(
    y    = "Gender",
    x    = "",
    fill = ""
  ) +
  theme_classic() +
  theme(
    axis.text.y     = element_blank(),
    axis.ticks.y    = element_blank(),
    axis.line.y     = element_blank(),
    legend.position = "top"
  )

# Bar chart of sample size by age category

age_bar_plot <-
ggplot(age_data,
       aes(
         y = age_cat,
         x = n
       )) +
  geom_col(
    color = "#171717",
    fill  = "#E8E8E8"
  ) +
  labs(
    y = "Age",
    x = ""
  ) +
  theme_classic() +
  theme(
    axis.text.y     = element_text(size = 8, angle = 90, hjust = .50),
    axis.ticks.y    = element_blank(),
    axis.line.y     = element_blank(),
    legend.position = "top"
  )

# Create components of full project tracker

project_tracker_side <- 
plot_grid(gender_bar_plot, age_bar_plot,
          nrow = 2,
          rel_heights = c(1, .8),
          rel_widths  = c(1, 1))

project_tracker_top <- 
plot_grid(radial_country_plot, radial_language_plot, project_tracker_side,
          nrow = 1,
          rel_widths = c(1, 1, 1), rel_heights = c(1, .7, 1),
          align = "h", axis = "t")

# Assemble full project tracker

project_tracker <- 
plot_grid(project_tracker_top,
          rainbow_plot,
          nrow = 2, 
          rel_heights = c(1, 1.25),
          rel_widths  = c(1, 1)) +
  theme(plot.background = element_rect(fill = "white"))

# Export project tracker

save_plot("figures/climr_project-tracker.png", project_tracker,
          base_height = 10, base_width = 12)
