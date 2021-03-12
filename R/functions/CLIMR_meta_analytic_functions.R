#######################################################################

# CLIMR -- Meta-Analytic Functions

#######################################################################

# MULIVARIATE I-SQUARED -----------------------------------------------

I2_mv <- function(meta, data) {
  
  # This code is adapted from Viechtbauer (2010)
  # http://www.metafor-project.org/doku.php/tips:i2_multilevel_multivariate#dokuwiki__top
  
  W <- diag(1/data$var)
  
  X <- model.matrix(meta)
  
  P <- W - W %*% X %*% solve(t(X) %*% W %*% X) %*% t(X) %*% W
  
  I2 <- 100 * sum(meta$sigma2) / (sum(meta$sigma2) + (meta$k - meta$p)/sum(diag(P)))
  
  # I2_split <- 100 * meta$sigma2 / (sum(meta$sigma2) + (meta$k - meta$p)/sum(diag(P)))
  
  return(I2)
  
}

