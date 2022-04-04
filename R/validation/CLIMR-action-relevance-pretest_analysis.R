################################################################################

# CLIMR -- Effect Size Calculation and Analysis, Action Relevance Pretest

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect_size_functions.R")

# Main analyses ----------------------------------------------------------------

t_01 <- t.test(act_rel$relevance_1,  mu = 0, alternative = "greater")
t_02 <- t.test(act_rel$relevance_2,  mu = 0, alternative = "greater")
t_03 <- t.test(act_rel$relevance_3,  mu = 0, alternative = "greater")
t_04 <- t.test(act_rel$relevance_4,  mu = 0, alternative = "greater")
t_05 <- t.test(act_rel$relevance_5,  mu = 0, alternative = "greater")
t_06 <- t.test(act_rel$relevance_6,  mu = 0, alternative = "greater")
t_07 <- t.test(act_rel$relevance_7,  mu = 0, alternative = "greater")
t_08 <- t.test(act_rel$relevance_8,  mu = 0, alternative = "greater")
t_09 <- t.test(act_rel$relevance_9,  mu = 0, alternative = "greater")
t_10 <- t.test(act_rel$relevance_10, mu = 0, alternative = "greater")
t_11 <- t.test(act_rel$relevance_11, mu = 0, alternative = "greater")
t_12 <- t.test(act_rel$relevance_12, mu = 0, alternative = "greater")
t_13 <- t.test(act_rel$relevance_13, mu = 0, alternative = "greater")
t_14 <- t.test(act_rel$relevance_14, mu = 0, alternative = "greater")
t_15 <- t.test(act_rel$relevance_15, mu = 0, alternative = "greater")
t_16 <- t.test(act_rel$relevance_16, mu = 0, alternative = "greater")
t_17 <- t.test(act_rel$relevance_17, mu = 0, alternative = "greater")
t_18 <- t.test(act_rel$relevance_18, mu = 0, alternative = "greater")
t_19 <- t.test(act_rel$relevance_19, mu = 0, alternative = "greater")
t_20 <- t.test(act_rel$relevance_20, mu = 0, alternative = "greater")
t_21 <- t.test(act_rel$relevance_21, mu = 0, alternative = "greater")
t_22 <- t.test(act_rel$relevance_22, mu = 0, alternative = "greater")
t_23 <- t.test(act_rel$relevance_23, mu = 0, alternative = "greater")
t_24 <- t.test(act_rel$relevance_24, mu = 0, alternative = "greater")
t_25 <- t.test(act_rel$relevance_25, mu = 0, alternative = "greater")

