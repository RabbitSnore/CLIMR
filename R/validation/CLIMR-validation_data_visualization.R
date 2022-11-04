################################################################################

# CLIMR -- Data Visualization, Validation Pretest

################################################################################

# Histograms -------------------------------------------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance, Categorization ----------

temporal_hist <- 
  ggplot(data_temporal,
         aes(
           x = y
         )) +
  facet_wrap(~ condition) +
  geom_histogram(
    binwidth = 1
  ) +
  theme_classic()

## Henderson et al. (2006, Study 1): Spatial Distance, Segmentation ------------

spatial_hist <- 
ggplot(data_spatial,
       aes(
         x = y
       )) +
  facet_wrap(~ condition) +
  geom_histogram(
    binwidth = 3
  ) +
  theme_classic()

## Liberman & Trope (1998, Study 1): Temporal Distance, BIF --------------------


temporal_2_hist <- 
  ggplot(data_temporal_2,
         aes(
           x = y
         )) +
  facet_wrap(~ condition) +
  geom_histogram(
    binwidth = 3
  ) +
  theme_classic()

## Save plots

cowplot::save_plot("./figures/climr_validation-temporal-hist.png", temporal_hist, base_height = 5, base_width = 10)
cowplot::save_plot("./figures/climr_validation-spatial-hist.png", temporal_hist, base_height = 5, base_width = 10)
cowplot::save_plot("./figures/climr_validation-temporal-2-hist.png", temporal_2_hist, base_height = 5, base_width = 10)

cowplot::save_plot("./reports/figures/climr_validation-temporal-hist.png", temporal_hist, base_height = 5, base_width = 10)
cowplot::save_plot("./reports/figures/climr_validation-spatial-hist.png", temporal_hist, base_height = 5, base_width = 10)
cowplot::save_plot("./reports/figures/climr_validation-temporal-2-hist.png", temporal_2_hist, base_height = 5, base_width = 10)
