Construal Level International Multilab Replication (CLIMR) Project:
Robustness Tests Accounting for Valence Differences in the Response
Options for the Items on the Behavior Identification Form (BIF), with
random slopes for labs and BIF items
================
CLIMR Team
2024-11-14

# Random Slopes Models

## Liberman & Trope (1998, Study 1)

``` r
lrt_val_temporal_rs
```

    ## Data: data_bif_temporal
    ## Models:
    ## glmm_temporal_bif_base_rs: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_temporal_bif_val_rs: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_temporal_bif_int_rs: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ##                           npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_temporal_bif_base_rs    9 68813 68893 -34398    68795                          
    ## glmm_temporal_bif_val_rs    10 68799 68888 -34389    68779 16.0486  1  6.174e-05 ***
    ## glmm_temporal_bif_int_rs    11 68799 68898 -34389    68777  1.6049  1     0.2052    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_temporal_bif_base_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 +      condition | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  68813.0  68893.4 -34397.5  68795.0    55816 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.6807 -0.7802 -0.2895  0.7859  5.5791 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.769530 0.87723       
    ##  lab     (Intercept)      0.082331 0.28693       
    ##          conditiondistant 0.001371 0.03702  0.78 
    ##  item    (Intercept)      0.496077 0.70433       
    ##          conditiondistant 0.060923 0.24683  -0.38
    ## Number of obs: 55825, groups:  lab:sub, 2939; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)      -0.14434    0.16692  -0.865    0.387
    ## conditiondistant  0.09815    0.06880   1.427    0.154
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.357

``` r
summary(glmm_temporal_bif_val_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  68799.0  68888.3 -34389.5  68779.0    55815 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.6889 -0.7802 -0.2894  0.7856  5.5553 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.769579 0.87726       
    ##  lab     (Intercept)      0.081976 0.28631       
    ##          conditiondistant 0.001398 0.03739  0.80 
    ##  item    (Intercept)      0.194453 0.44097       
    ##          conditiondistant 0.060546 0.24606  -0.25
    ## Number of obs: 55825, groups:  lab:sub, 2939; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.27183    0.24942  -5.099 3.41e-07 ***
    ## conditiondistant  0.09772    0.06869   1.423    0.155    
    ## d                 1.32220    0.26267   5.034 4.81e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.120       
    ## d           -0.898  0.000

``` r
summary(glmm_temporal_bif_int_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  68799.4  68897.6 -34388.7  68777.4    55814 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.6806 -0.7805 -0.2896  0.7856  5.5900 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.76953  0.87723       
    ##  lab     (Intercept)      0.08217  0.28664       
    ##          conditiondistant 0.00135  0.03674  0.79 
    ##  item    (Intercept)      0.19383  0.44026       
    ##          conditiondistant 0.05541  0.23539  -0.24
    ## Number of obs: 55825, groups:  lab:sub, 2939; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         -1.3463     0.2487  -5.412 6.22e-08 ***
    ## conditiondistant     0.2611     0.1430   1.826   0.0678 .  
    ## d                    1.4091     0.2616   5.386 7.19e-08 ***
    ## conditiondistant:d  -0.1909     0.1477  -1.292   0.1963    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.263              
    ## d           -0.897  0.231       
    ## cndtndstnt:  0.235 -0.884 -0.260

## Fujita et al. (2006, Study 1)

``` r
lrt_val_spatial_rs
```

    ## Data: data_bif_spatial
    ## Models:
    ## glmm_spatial_bif_base_rs: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_spatial_bif_val_rs: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_spatial_bif_int_rs: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ##                          npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)   
    ## glmm_spatial_bif_base_rs    9 45214 45291 -22598    45196                        
    ## glmm_spatial_bif_val_rs    10 45207 45293 -22594    45187 8.6558  1    0.00326 **
    ## glmm_spatial_bif_int_rs    11 45209 45303 -22593    45187 0.5817  1    0.44564   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_spatial_bif_base_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 +      condition | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  45213.8  45290.8 -22597.9  45195.8    38615 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9137 -0.8235  0.4214  0.6495  2.9304 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance  Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.7762243 0.88104       
    ##  lab     (Intercept)      0.0735710 0.27124       
    ##          conditiondistant 0.0010427 0.03229  -1.00
    ##  item    (Intercept)      0.4750703 0.68925       
    ##          conditiondistant 0.0005267 0.02295  -1.00
    ## Number of obs: 38624, groups:  lab:sub, 2972; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.70047    0.19595   3.575 0.000351 ***
    ## conditiondistant  0.04306    0.04113   1.047 0.295144    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.268
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
summary(glmm_spatial_bif_val_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  45207.1  45292.7 -22593.5  45187.1    38614 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.8966 -0.8239  0.4212  0.6492  2.9374 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance  Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.7761986 0.88102       
    ##  lab     (Intercept)      0.0731655 0.27049       
    ##          conditiondistant 0.0009670 0.03110  -1.00
    ##  item    (Intercept)      0.2321096 0.48178       
    ##          conditiondistant 0.0002005 0.01416  -1.00
    ## Number of obs: 38624, groups:  lab:sub, 2972; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.56970    0.38882  -1.465 0.142864    
    ## conditiondistant  0.04499    0.04075   1.104 0.269534    
    ## d                 1.37056    0.39113   3.504 0.000458 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.112       
    ## d           -0.933  0.021
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
summary(glmm_spatial_bif_int_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  45208.5  45302.7 -22593.3  45186.5    38613 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9020 -0.8235  0.4216  0.6496  2.9298 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance  Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.7762855 0.8811        
    ##  lab     (Intercept)      0.0735121 0.2711        
    ##          conditiondistant 0.0010432 0.0323   -1.00
    ##  item    (Intercept)      0.2314472 0.4811        
    ##          conditiondistant 0.0001876 0.0137   -1.00
    ## Number of obs: 38624, groups:  lab:sub, 2972; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.63766    0.39212  -1.626  0.10390    
    ## conditiondistant    0.09368    0.07518   1.246  0.21277    
    ## d                   1.44504    0.39564   3.652  0.00026 ***
    ## conditiondistant:d -0.05465    0.07082  -0.772  0.44029    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.244              
    ## d           -0.934  0.211       
    ## cndtndstnt:  0.226 -0.840 -0.245
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.00495539 (tol = 0.002, component 1)

## Social Distance (Paradigmatic Replication)

``` r
lrt_val_social_rs
```

    ## Data: data_bif_social
    ## Models:
    ## glmm_social_bif_base_rs: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_social_bif_val_rs: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_social_bif_int_rs: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ##                         npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_social_bif_base_rs    9 88735 88818 -44359    88717                          
    ## glmm_social_bif_val_rs    10 88725 88817 -44352    88705 12.4525  1  0.0004174 ***
    ## glmm_social_bif_int_rs    11 88721 88822 -44350    88699  5.4734  1  0.0193080 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_social_bif_base_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 +      condition | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  88735.2  88818.0 -44358.6  88717.2    73041 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2842 -0.7224 -0.4305  0.8717  4.8113 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.85635  0.9254        
    ##  lab     (Intercept)      0.07382  0.2717        
    ##          conditiondistant 0.01022  0.1011   -1.00
    ##  item    (Intercept)      0.28163  0.5307        
    ##          conditiondistant 0.07654  0.2767   -0.62
    ## Number of obs: 73050, groups:  lab:sub, 2923; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.38968    0.11406  -3.417 0.000634 ***
    ## conditiondistant -0.25499    0.06836  -3.730 0.000192 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.607
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
summary(glmm_social_bif_val_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_social
    ## Control: glmerControl(optimizer = "Nelder_Mead", optCtrl = list(maxfun = 1e+05))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  88724.8  88816.8 -44352.4  88704.8    73040 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2706 -0.7224 -0.4301  0.8714  4.8533 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.85627  0.9253        
    ##  lab     (Intercept)      0.07352  0.2711        
    ##          conditiondistant 0.01010  0.1005   -1.00
    ##  item    (Intercept)      0.14274  0.3778        
    ##          conditiondistant 0.07616  0.2760   -0.50
    ## Number of obs: 73050, groups:  lab:sub, 2923; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.06198    0.18823  -5.642 1.68e-08 ***
    ## conditiondistant -0.25569    0.06826  -3.746  0.00018 ***
    ## d                 0.81983    0.20389   4.021 5.79e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.246       
    ## d           -0.888 -0.003
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
summary(glmm_social_bif_int_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_social
    ## Control: glmerControl(optimizer = "Nelder_Mead", optCtrl = list(maxfun = 1e+05))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  88721.3  88822.5 -44349.6  88699.3    73039 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2752 -0.7226 -0.4303  0.8720  4.8114 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.85642  0.9254        
    ##  lab     (Intercept)      0.07358  0.2713        
    ##          conditiondistant 0.01014  0.1007   -1.00
    ##  item    (Intercept)      0.13587  0.3686        
    ##          conditiondistant 0.06008  0.2451   -0.46
    ## Number of obs: 73050, groups:  lab:sub, 2923; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -1.25760    0.18957  -6.634 3.27e-11 ***
    ## conditiondistant    0.03675    0.13447   0.273   0.7846    
    ## d                   1.05803    0.20636   5.127 2.94e-07 ***
    ## conditiondistant:d -0.35545    0.14401  -2.468   0.0136 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.477              
    ## d           -0.894  0.411       
    ## cndtndstnt:  0.418 -0.882 -0.466
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.0182976 (tol = 0.002, component 1)

## Likelihood Distance (Paradigmatic Replication)

``` r
lrt_val_likelihood_rs
```

    ## Data: data_bif_likelihood
    ## Models:
    ## glmm_likelihood_bif_base_rs: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_likelihood_bif_val_rs: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ## glmm_likelihood_bif_int_rs: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) + (1 + condition | item)
    ##                             npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_likelihood_bif_base_rs    9 32819 32892 -16400    32801                          
    ## glmm_likelihood_bif_val_rs    10 32806 32888 -16393    32786 14.4459  1  0.0001442 ***
    ## glmm_likelihood_bif_int_rs    11 32806 32896 -16392    32784  2.6046  1  0.1065553    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_likelihood_bif_base_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 + condition | lab) + (1 +      condition | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32818.8  32892.4 -16400.4  32800.8    26405 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1157 -0.7955  0.3358  0.7633  3.0817 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.672712 0.82019       
    ##  lab     (Intercept)      0.055122 0.23478       
    ##          conditiondistant 0.008000 0.08944  -0.78
    ##  item    (Intercept)      0.647273 0.80453       
    ##          conditiondistant 0.001141 0.03377  -1.00
    ## Number of obs: 26414, groups:  lab:sub, 2935; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)      0.001965   0.271366   0.007    0.994
    ## conditiondistant 0.048238   0.044079   1.094    0.274
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.343
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

``` r
summary(glmm_likelihood_bif_val_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32806.3  32888.1 -16393.2  32786.3    26404 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1978 -0.8009  0.3380  0.7626  3.0378 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.672617 0.82013       
    ##  lab     (Intercept)      0.053958 0.23229       
    ##          conditiondistant 0.008134 0.09019  -0.73
    ##  item    (Intercept)      0.118024 0.34355       
    ##          conditiondistant 0.001392 0.03730  1.00 
    ## Number of obs: 26414, groups:  lab:sub, 2935; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.35229    0.24695  -5.476 4.35e-08 ***
    ## conditiondistant  0.04896    0.04445   1.102    0.271    
    ## d                 1.79347    0.28414   6.312 2.76e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt  0.020       
    ## d           -0.871  0.014
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.00337197 (tol = 0.002, component 1)

``` r
summary(glmm_likelihood_bif_int_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 + condition | lab) +      (1 + condition | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32805.7  32895.7 -16391.9  32783.7    26403 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1493 -0.7995  0.3369  0.7658  3.1088 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance  Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.6730430 0.82039       
    ##  lab     (Intercept)      0.0550175 0.23456       
    ##          conditiondistant 0.0080827 0.08990  -0.78
    ##  item    (Intercept)      0.1169628 0.34200       
    ##          conditiondistant 0.0006612 0.02571  1.00 
    ## Number of obs: 26414, groups:  lab:sub, 2935; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -1.27033    0.23601  -5.383 7.35e-08 ***
    ## conditiondistant    0.13887    0.06935   2.003   0.0452 *  
    ## d                   1.68413    0.26810   6.282 3.35e-10 ***
    ## conditiondistant:d -0.11780    0.07058  -1.669   0.0951 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt  0.091              
    ## d           -0.859 -0.115       
    ## cndtndstnt: -0.129 -0.779  0.152
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.0474102 (tol = 0.002, component 1)

# Analysis of Full BIF (All Items)

## Liberman & Trope (1998, Study 1)

``` r
lrt_val_temporal_full
```

    ## Data: data_bif_temporal_full
    ## Models:
    ## glmm_temporal_bif_base_full: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_val_full: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_int_full: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                             npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_temporal_bif_base_full    5 90894 90940 -45442    90884                          
    ## glmm_temporal_bif_val_full     6 90878 90933 -45433    90866 18.1871  1  2.002e-05 ***
    ## glmm_temporal_bif_int_full     7 90876 90941 -45431    90862  3.4599  1    0.06288 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_temporal_bif_base_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##    90894    90940   -45442    90884    73453 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.7961 -0.7854 -0.3450  0.8140  5.2767 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.74865  0.8652  
    ##  lab     (Intercept) 0.09558  0.3092  
    ##  item    (Intercept) 0.36020  0.6002  
    ## Number of obs: 73458, groups:  lab:sub, 2939; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)  
    ## (Intercept)      -0.16976    0.12778  -1.328    0.184  
    ## conditiondistant  0.06068    0.03601   1.685    0.092 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.140

``` r
summary(glmm_temporal_bif_val_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  90877.8  90933.1 -45432.9  90865.8    73452 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.7946 -0.7855 -0.3447  0.8138  5.2860 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.74865  0.8652  
    ##  lab     (Intercept) 0.09544  0.3089  
    ##  item    (Intercept) 0.17309  0.4160  
    ## Number of obs: 73458, groups:  lab:sub, 2939; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.15169    0.21212  -5.429 5.65e-08 ***
    ## conditiondistant  0.06068    0.03601   1.685    0.092 .  
    ## d                 1.19687    0.23159   5.168 2.37e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.085       
    ## d           -0.896  0.000

``` r
summary(glmm_temporal_bif_int_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  90876.4  90940.8 -45431.2  90862.4    73451 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.8249 -0.7852 -0.3443  0.8137  5.3987 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.74862  0.8652  
    ##  lab     (Intercept) 0.09545  0.3089  
    ##  item    (Intercept) 0.17314  0.4161  
    ## Number of obs: 73458, groups:  lab:sub, 2939; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -1.18872    0.21421  -5.549 2.87e-08 ***
    ## conditiondistant    0.13443    0.05339   2.518   0.0118 *  
    ## d                   1.24116    0.23417   5.300 1.16e-07 ***
    ## conditiondistant:d -0.08834    0.04722  -1.871   0.0614 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.126              
    ## d           -0.898  0.076       
    ## cndtndstnt:  0.094 -0.738 -0.103

## Fujita et al. (2006, Study 1)

``` r
lrt_val_spatial_full
```

    ## Data: data_bif_spatial_full
    ## Models:
    ## glmm_spatial_bif_base_full: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_bif_val_full: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_bif_int_full: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                            npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_spatial_bif_base_full    5 87876 87922 -43933    87866                          
    ## glmm_spatial_bif_val_full     6 87865 87920 -43927    87853 12.4917  1  0.0004088 ***
    ## glmm_spatial_bif_int_full     7 87867 87931 -43926    87853  0.5442  1  0.4607047    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_spatial_bif_base_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  87875.5  87921.6 -43932.8  87865.5    74281 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.7120 -0.8153  0.3987  0.6991  3.5799 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.79747  0.8930  
    ##  lab     (Intercept) 0.06455  0.2541  
    ##  item    (Intercept) 0.51271  0.7160  
    ## Number of obs: 74286, groups:  lab:sub, 2973; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.50056    0.14850   3.371  0.00075 ***
    ## conditiondistant  0.02784    0.03697   0.753  0.45134    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.124

``` r
summary(glmm_spatial_bif_val_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  87865.0  87920.3 -43926.5  87853.0    74280 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.7101 -0.8151  0.3991  0.6993  3.5808 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.79748  0.8930  
    ##  lab     (Intercept) 0.06451  0.2540  
    ##  item    (Intercept) 0.31037  0.5571  
    ## Number of obs: 74286, groups:  lab:sub, 2973; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.52073    0.27873  -1.868   0.0617 .  
    ## conditiondistant  0.02785    0.03697   0.753   0.4513    
    ## d                 1.24485    0.30830   4.038  5.4e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.065       
    ## d           -0.906 -0.001

``` r
summary(glmm_spatial_bif_int_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  87866.5  87931.0 -43926.3  87852.5    74279 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.6999 -0.8152  0.3990  0.6991  3.5693 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.7975   0.8930  
    ##  lab     (Intercept) 0.0645   0.2540  
    ##  item    (Intercept) 0.3104   0.5571  
    ## Number of obs: 74286, groups:  lab:sub, 2973; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.506617   0.283180  -1.789   0.0736 .  
    ## conditiondistant   -0.000396   0.053061  -0.007   0.9940    
    ## d                   1.227125   0.313125   3.919 8.89e-05 ***
    ## conditiondistant:d  0.035478   0.047747   0.743   0.4575    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.096              
    ## d           -0.908  0.057       
    ## cndtndstnt:  0.069 -0.717 -0.078

## Likelihood Distance (Paradigmatic Replication)

``` r
lrt_val_likelihood_full
```

    ## Data: data_bif_likelihood_full
    ## Models:
    ## glmm_likelihood_bif_base_full: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_bif_val_full: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_bif_int_full: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                               npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_likelihood_bif_base_full    5 90277 90323 -45134    90267                          
    ## glmm_likelihood_bif_val_full     6 90258 90313 -45123    90246 21.6277  1   3.31e-06 ***
    ## glmm_likelihood_bif_int_full     7 90255 90319 -45120    90241  5.1333  1    0.02347 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_likelihood_bif_base_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  90277.3  90323.3 -45133.6  90267.3    73368 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.7043 -0.8194  0.3730  0.7714  3.7827 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.65821  0.8113  
    ##  lab     (Intercept) 0.05339  0.2311  
    ##  item    (Intercept) 0.48970  0.6998  
    ## Number of obs: 73373, groups:  lab:sub, 2935; lab, 77; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)       0.14212    0.14434   0.985    0.325
    ## conditiondistant  0.01308    0.03425   0.382    0.703
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.117

``` r
summary(glmm_likelihood_bif_val_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  90257.7  90312.9 -45122.8  90245.7    73367 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.6951 -0.8194  0.3730  0.7709  3.7895 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.65822  0.8113  
    ##  lab     (Intercept) 0.05331  0.2309  
    ##  item    (Intercept) 0.20517  0.4530  
    ## Number of obs: 73373, groups:  lab:sub, 2935; lab, 77; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.06899    0.22892  -4.670 3.02e-06 ***
    ## conditiondistant  0.01308    0.03425   0.382    0.702    
    ## d                 1.47619    0.25234   5.850 4.92e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.075       
    ## d           -0.904  0.000

``` r
summary(glmm_likelihood_bif_int_full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood_full
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  90254.5  90319.0 -45120.3  90240.5    73366 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.7274 -0.8197  0.3733  0.7716  3.8640 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.65834  0.8114  
    ##  lab     (Intercept) 0.05333  0.2309  
    ##  item    (Intercept) 0.20522  0.4530  
    ## Number of obs: 73373, groups:  lab:sub, 2935; lab, 77; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -1.11345    0.22980  -4.845 1.26e-06 ***
    ## conditiondistant    0.10165    0.05180   1.962   0.0497 *  
    ## d                   1.53088    0.25364   6.036 1.58e-09 ***
    ## conditiondistant:d -0.10904    0.04781  -2.281   0.0226 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.113              
    ## d           -0.905  0.071       
    ## cndtndstnt:  0.085 -0.750 -0.095
