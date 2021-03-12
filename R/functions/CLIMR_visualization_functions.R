#######################################################################

# CLIMR -- Data Visualization Functions

#######################################################################

# FOREST PLOT ---------------------------------------------------------

forest_plot <- function(replication_data, meta_analysis, org_d, org_ci_lower, org_ci_upper, title, study_color = "black", boundary_pad = 0.20, breaks = 0.50) {
  
  # Set up original and meta-analytic estimates
  
  forest_estimates <- data.frame(
    ID       = c("Replication", "Original"),
    d        = c(meta_analysis$beta[[1]], org_d),
    var      = c(NA, NA),
    ci_lower = c(meta_analysis$ci.lb, org_ci_lower),
    ci_upper = c(meta_analysis$ci.ub, org_ci_upper)
  )
  
  # Bind the original and meta-analytic estimates to the calculated effects from each lab
  
  replication_data$ID <- as.character(replication_data$ID)
  
  forest_estimates <- bind_rows(forest_estimates, replication_data)
  
  # Set up the effect IDs with the proper order for the forest plot
  
  forest_estimates$ID <- factor(forest_estimates$ID, 
                                levels = c(
                                  "Original",  
                                  "Replication", 
                                  as.character(arrange(replication_data, d)$ID)
                                )
  )
  
  # Set up an indicator for whether the estimate is from the meta-analysis, the original, or a replication
  
  forest_estimates <- forest_estimates %>% 
    mutate(
      estim = as.factor(
        case_when(
          ID == "Replication" ~ "meta",
          ID == "Original" ~ "original",
          !is.na(ID) ~ "study"
        ))
    )
  
  # Set up plot boundaries
  
  effect_max <- round(max(forest_estimates$ci_upper, na.rm = TRUE), 1) + boundary_pad
  effect_min <- round(min(forest_estimates$ci_lower, na.rm = TRUE), 1) - boundary_pad
  
  # Draw forest plot
  
  forest <- 
  ggplot(forest_estimates,
         aes(
           x = d,
           y = ID,
           xmin = ci_lower,
           xmax = ci_upper
         )) +
    geom_point(
      aes(
        shape = estim,
        size  = estim
      ),
      color = study_color
    ) +
    scale_size_manual(
      values = c(4, 4, 1.2)
    ) +
    scale_shape_manual(
      values = c(18, 18, 15)
    ) +
    geom_errorbarh(
      height = .50,
      color  = study_color
    ) +
    geom_vline(
      xintercept = meta_analysis$beta[[1]],
      linetype   = "dashed",
      color      = "black",
      size       = 1
    ) +
    geom_vline(
      xintercept = 0,
      linetype   = "dotted"
    ) +
    geom_hline(
      yintercept = 2.5
    ) +
    scale_x_continuous(
      breaks = sort(c(0, seq(effect_min, effect_max + 0.20, breaks)))
    ) +
    coord_cartesian(
      xlim = c(effect_min, effect_max)
    ) +
    labs(
      title = title,
      x     = expression(paste("Effect size (", italic("d"), ")", sep = "")),
      y     = ""
    ) +
    guides(
      shape = FALSE,
      group = FALSE,
      size  = FALSE
    ) +
    theme_classic() +
    theme(
      axis.text         = element_text(color = "black"),
      legend.position   = c(.8, .2),
      legend.background = element_rect( 
        size     = 0.5,
        linetype = "solid",
        color    = "black"),
      plot.title        = element_text(hjust = 0.5)
    )
  
}

# ARBORETUM -----------------------------------------------------------

# BEESWARM ------------------------------------------------------------