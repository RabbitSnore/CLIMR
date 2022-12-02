################################################################################

# CLIMR -- Power Functions

################################################################################

# Return required sample size --------------------------------------------------

power_sample <- function(id, d, power = c(.80, .95)) {
  
  N_df <- data.frame(
    id    = id,
    power = power,
    N     = rep(NA, length(power))
  )
  
  for (i in 1:length(power)) {
    
    N_df$N[i] <- power.t.test(delta = d, power = power[i])$n * 2
    
  }
  
  return(N_df)
  
}

# Return detectable effect -----------------------------------------------------

power_effect <- function(id, N, k, power = .80) {
  
  d_df <- data.frame(
    id    = id,
    n     = N/k,
    power = power,
    d     = rep(NA, length(power)),
    N     = N,
    k     = k
  )
  
  for (i in 1:length(power)) {
    
    d_df$d[i] <- power.t.test(d_df$n[i], power = power[i])$delta
    
  }
  
  return(d_df)
  
}

# Return achieved power --------------------------------------------------------

power_achieved <- function(id, N, k, d) {
  
  power_df <- data.frame(
    id    = id,
    n     = N/k,
    d     = d,
    power = NA,
    N     = N,
    k     = k
  )
  
  for (i in 1:length(power)) {
    
    power_df$power[i] <- power.t.test(delta = d, n = power_df$n)$power
    
  }
  
  return(power_df)
  
}
