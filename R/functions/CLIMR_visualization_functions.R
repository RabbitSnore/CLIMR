#######################################################################

# CLIMR -- Data Visualization Functions

#######################################################################

# FOREST PLOT ---------------------------------------------------------

## Internal function for creating forest plot data

forest_data <- function(replication_data, meta_analysis, org_d, org_ci_lower, org_ci_upper) {
  
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
  
  return(forest_estimates)
  
}

## Forest plot for standardized mean difference

forest_plot <- function(replication_data, meta_analysis, org_d, org_ci_lower, org_ci_upper, title, study_color = "black", boundary_pad = 0.20, breaks = 0.50) {
  
  forest_estimates <- forest_data(replication_data, meta_analysis, org_d, org_ci_lower, org_ci_upper)
  
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
      breaks = sort(c(0, seq(effect_min, effect_max, breaks))),
      labels = format(sort(paste(c(0, seq(effect_min, effect_max, breaks)))), nsmall = 2)
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

## Forest plot for log odds ratio

forest_plot_lor <- function(replication_data, meta_analysis, org_lor, org_ci_lower, org_ci_upper, title, study_color = "black", boundary_pad = 0.20, breaks = 0.50) {
  
  # Set up original and meta-analytic estimates
  
  forest_estimates <- data.frame(
    ID       = c("Replication", "Original"),
    log_odds = c(meta_analysis$beta[[1]], org_lor),
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
                                  as.character(arrange(replication_data, log_odds)$ID)
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
             x = log_odds,
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
      breaks = sort(c(0, seq(effect_min, effect_max, breaks))),
      labels = sort(paste(c(0, seq(effect_min, effect_max, breaks))))
    ) +
    coord_cartesian(
      xlim = c(effect_min, effect_max)
    ) +
    labs(
      title = title,
      x     = expression(paste("Effect size (", italic("log odds ratio"), ")", sep = "")),
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

# MAIN FIGURE: BEESWARM -----------------------------------------------

## Main figure

climr_swarm <- function(meta_temporal, meta_spatial, meta_likelihood, meta_temporal_2, complete, original, study_colors, titles, boundary_pad = .05, breaks = .50) {
  
  ## Internal function to set up estimate data frame
  
  estimate_data <- function(meta_analysis, org_d, org_ci_lower, org_ci_upper) {
    
    # Set up original and meta-analytic estimates
    
    estimates <- data.frame(
      ID       = c("Replication", "Original"),
      d        = c(meta_analysis$beta[[1]], org_d),
      var      = c(NA, NA),
      ci_lower = c(meta_analysis$ci.lb, org_ci_lower),
      ci_upper = c(meta_analysis$ci.ub, org_ci_upper)
    )
    
    return(estimates)
    
  }
  
  # Set up data for plotting
  
  estimates_temporal <- estimate_data(
    meta_analysis    = meta_temporal,
    org_d            = original$d[original$study == "temporal"],
    org_ci_lower     = original$ci_lower[original$study == "temporal"], 
    org_ci_upper     = original$ci_upper[original$study == "temporal"])
  
  estimates_spatial <- estimate_data(
    meta_analysis    = meta_spatial,
    org_d            = original$d[original$study == "spatial"],
    org_ci_lower     = original$ci_lower[original$study == "spatial"], 
    org_ci_upper     = original$ci_upper[original$study == "spatial"])
  
  estimates_likelihood <- estimate_data(
    meta_analysis    = meta_likelihood,
    org_d            = original$d[original$study == "likelihood"],
    org_ci_lower     = original$ci_lower[original$study == "likelihood"], 
    org_ci_upper     = original$ci_upper[original$study == "likelihood"])
  
  estimates_temporal_2 <- estimate_data(
    meta_analysis    = meta_temporal_2,
    org_d            = original$d[original$study == "temporal_2"],
    org_ci_lower     = original$ci_lower[original$study == "temporal_2"], 
    org_ci_upper     = original$ci_upper[original$study == "temporal_2"])
  
  
  estimates_climr <- rbind(estimates_temporal, estimates_spatial, estimates_likelihood, estimates_temporal_2)
  
  estimates_climr$ID <- factor(estimates_climr$ID, levels = c("Replication", "Original"))
  
  estimates_climr$distance <- c(rep("temporal", 2), rep("spatial", 2), rep("likelihood", 2), rep("temporal_2", 2))
  
  estimates_climr$distance <- factor(estimates_climr$distance, 
                                   levels = rev(c("temporal", "spatial", "likelihood", "temporal_2")))
  
  complete$distance <- factor(complete$distance, 
                                 levels = rev(c("temporal", "spatial", "likelihood", "temporal_2")))

  # Set up plot boundaries
  
  effect_max <- round(max(c(complete$d, estimates_climr$ci_upper), na.rm = TRUE), 1) + boundary_pad
  effect_min <- round(min(c(complete$d, estimates_climr$ci_lower), na.rm = TRUE), 1) - boundary_pad
  
  # Draw figure
  
  climr_fig <- 
    ggplot(complete,
           aes(
             x = d,
             y = distance,
             color = distance
             )
           ) +
    geom_vline(
      xintercept = 0,
      linetype = "longdash"
    ) +
    geom_quasirandom(
      width = .30,
      groupOnX = FALSE,
      alpha = .20,
      aes(
        # size = 1/var
      )
    ) +
    scale_size_continuous(
      range = c(.25, 2)
    ) +
    geom_errorbarh(
      data = estimates_climr,
      inherit.aes = FALSE,
      aes(
        y = distance,
        xmax = ci_upper,
        xmin = ci_lower,
        group = ID,
        color = distance,
        alpha = ID
      ),
      height = .25,
      size = 1,
      position = position_dodgev(height = .25)
    ) +
    geom_point(
      data = estimates_climr,
      inherit.aes = FALSE,
      aes(
        y = distance,
        x = d,
        group = ID,
        shape = ID,
        color = distance,
        alpha = ID),
      size = 3,
      position = position_dodgev(height = .25)
    ) +
    scale_alpha_manual(
      values = c(1, .66)
    ) +
    scale_color_manual(
      values = rev(study_colors)
    ) +
    scale_y_discrete(
      labels = rev(titles)
    ) +
    scale_shape_manual(
      values = c(16, 15)
    ) +
    scale_x_continuous(
      breaks = sort(c(0, seq(effect_min, effect_max, breaks))),
      labels = format(sort(c(0, seq(effect_min, effect_max, breaks))), nsmall = 2)
    ) +
    coord_cartesian(
      xlim = c(effect_min, effect_max)
    ) +
    labs(
      shape = "",
      y = "",
      x = expression(paste("Effect size (", italic("d"), ")", sep = ""))
    ) +
    guides(
      group = FALSE,
      size = FALSE,
      color = FALSE,
      alpha = FALSE
    ) +
    theme_classic() +
    theme(
      axis.text = element_text(color = "black"),
      legend.position = "bottom",
      legend.background = element_rect( 
        size = 0.5,
        linetype = "solid",
        color= "black")
    )
  
}

