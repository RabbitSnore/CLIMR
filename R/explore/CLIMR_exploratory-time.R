################################################################################

# CLIMR -- Exploratory analyses, temporal effect across time

################################################################################

# Data wrangling ---------------------------------------------------------------

data_bif_temporal <- data_bif_temporal %>% 
  left_join(
    select(raw, sub, start_date),
    by = "sub"
  )

data_temporal <- data_temporal %>% 
  left_join(
    select(raw, sub, start_date),
    by = "sub"
  )

data_bif_temporal$time       <- round_date(data_bif_temporal$start_date,
                                           unit = "day")

data_bif_temporal$time_week  <- round_date(data_bif_temporal$start_date,
                                           unit = "week")

data_bif_temporal$time_month <- round_date(data_bif_temporal$start_date,
                                           unit = "month")

data_temporal$time       <- round_date(data_temporal$start_date,
                                           unit = "day")

data_temporal$time_week  <- round_date(data_temporal$start_date,
                                           unit = "week")

data_temporal$time_month <- round_date(data_temporal$start_date,
                                           unit = "month")

# For crude visualization

bif_mean_monthly_temporal <- data_temporal %>% 
  group_by(time_month, condition) %>% 
  filter(complete.cases(bif_total)) %>% 
  summarise(
    mean  = mean(bif_total, na.rm = TRUE),
    se    = sd(bif_total, na.rm = TRUE)/sqrt(n()),
    ci_lb = mean - se*qnorm(.975),
    ci_ub = mean + se*qnorm(.975)
  )

bif_item_monthly_temporal <- data_bif_temporal %>% 
  group_by(time_month, item, condition) %>% 
  filter(complete.cases(bif)) %>% 
  summarise(
    mean  = mean(bif, na.rm = TRUE),
    se    = sd(bif, na.rm = TRUE)/sqrt(n()),
    ci_lb = mean - se*qnorm(.975),
    ci_ub = mean + se*qnorm(.975)
  )

# Visualization ----------------------------------------------------------------

# Figures

plot_time_bif_sum <- 
ggplot(bif_mean_monthly_temporal,
       aes(
         x     = time_month,
         y     = mean,
         ymin  = ci_lb,
         ymax  = ci_ub,
         group = condition,
         color = condition
       )) +
  geom_point() +
  geom_line() +
  geom_errorbar(
    width = .30
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  scale_y_continuous(
    limits = c(0, 19),
    breaks = 0:19
  ) +
  labs(
    y = "BIF Sum Score",
    x = "Month",
    color = "Condition"
  ) +
  theme_classic()

plot_time_bif_item <- 
ggplot(bif_item_monthly_temporal,
       aes(
         x     = time_month,
         y     = mean,
         ymin  = ci_lb,
         ymax  = ci_ub,
         group = condition,
         color = condition
       )) +
  facet_wrap(~ item,
             nrow = 5) +
  geom_point() +
  geom_line() +
  geom_errorbar(
    width = .30
  ) +
  scale_color_manual(
    values = c(
      "#88527F",
      "#7EB09B"
    )
  ) +
  labs(
    y = "Proportion abstract choices",
    x = "Month",
    color = "Condition"
  ) +
  theme_classic()

# Export figures

save_plot("figures/climr_temporal-actual-time-bif-sum.png",
          plot_time_bif_sum,
          base_height = 5, base_width = 6)

save_plot("reports/figures/climr_temporal-actual-time-bif-sum.png",
          plot_time_bif_sum,
          base_height = 5, base_width = 6)

save_plot("figures/climr_temporal-actual-time-bif-item.png",
          plot_time_bif_item,
          base_height = 6, base_width = 8)

save_plot("reports/figures/climr_temporal-actual-time-bif-item.png",
          plot_time_bif_item,
          base_height = 6, base_width = 8)
