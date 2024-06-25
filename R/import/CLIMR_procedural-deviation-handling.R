################################################################################

# CLIMR - Handling deviations from expected procedure in CN_01

################################################################################

# CN_01 reported the following to the CLIMR team:
# "[U]pon receiving the online link you sent, I mistakenly thought it was
# intended for participants to complete the questionnaire online. As a result, I
# distributed the link during my psychology elective course and instructed the
# students to respond to the survey using their mobile devices according to the
# provided guidelines."
# Given that this approach deviates from the expectation that the survey link
# would not be distrbuted outside of a controlled laboratory setting, it is
# useful to investigate whether this approach has resulted in cases that should
# be removed prior to analysis.

# CN_01 reported that data were collected at the following times:
# First session: June 3rd, from 11:00 AM to 11:15 AM.
# Second session: June 5th, from 2:40 PM to 3:00 PM.
# Third session: June 12th, from 11:50 AM to 12:05 PM.
# Fourth session: June 14th, from 11:48 AM to 12:00 PM.
# These times are expressed in China standard Time (UTC+8)

# Select cases -----------------------------------------------------------------

# Select only CN_01 from the raw data

cn_01 <- raw %>% 
  filter(
    lab == "CN_01"
  )

# Assess situation -------------------------------------------------------------

# Timing of start and completion of main experiments

# Note: This assessment was first performed without having examined any of the
# data that bears on the substantive research questions of the project.

## Start datetimes

plot_starttimes_main_cn_01 <- 
  ggplot(cn_01,
         aes(
           x = as_datetime(start_date)
         )) +
  geom_histogram(
    bins = 100
  ) +
  scale_x_continuous(
    breaks = seq(min(cn_01$start_date, na.rm = TRUE), 
                 max(cn_01$start_date, na.rm = TRUE), 
                 length.out = 8)
  ) +
  theme_classic()

# This histogram suggests five concentrations of start times, but the fifth
# and last concentration is much smaller in the main data than the others. This
# fifth concentration of data does not appear to correspond to any of the
# designated collection periods indicated by CN_01.

## End datetimes

plot_endtimes_main_cn_01 <- 
  ggplot(cn_01,
         aes(
           x = as_datetime(end_date)
         )) +
  geom_histogram(
    bins = 100
  ) +
  scale_x_continuous(
    breaks = seq(min(cn_01$end_date, na.rm = TRUE), 
                 max(cn_01$end_date, na.rm = TRUE), 
                 length.out = 8)
  ) +
  theme_classic()

# This histogram suggests the same approximate concentrations of submissions
# times as the start times, with few cases in the "off times." This pattern is
# consistent with the notion that participants were using the designated class
# time to complete the experiment. However. the cases in the off times ought to
# be removed.

# Removal of "off time" cases --------------------------------------------------

# Remove cases

cn_01 <- cn_01 %>% 
  filter(as_date(start_date) == as_date("2024-06-03") |
         as_date(start_date) == as_date("2024-06-05") |
         as_date(start_date) == as_date("2024-06-12") |
         as_date(start_date) == as_date("2024-06-14"))

# Reassemble data

raw <- raw %>% 
  filter(lab != "CN_01")

raw <- bind_rows(raw, cn_01)
