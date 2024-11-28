Construal Level International Multilab Replication (CLIMR) Project:
Robustness Tests Accounting for Valence Differences in the Response
Options for the Items on the Behavior Identification Form (BIF) – (1)
random slopes for labs and BIF items, (2) for the Full BIF Scale, and
(3) Item Removal for the Interaction Observed for the Temporal Distance
Experiment
================
CLIMR Team
2024-11-28

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
    ##          conditiondistant 0.001371 0.03703  0.78 
    ##  item    (Intercept)      0.496078 0.70433       
    ##          conditiondistant 0.060922 0.24682  -0.38
    ## Number of obs: 55825, groups:  lab:sub, 2939; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)      -0.14434    0.16741  -0.862    0.389
    ## conditiondistant  0.09815    0.06886   1.425    0.154
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.358

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
    ##  lab:sub (Intercept)      0.769580 0.87726       
    ##  lab     (Intercept)      0.081977 0.28632       
    ##          conditiondistant 0.001401 0.03743  0.80 
    ##  item    (Intercept)      0.194451 0.44097       
    ##          conditiondistant 0.060546 0.24606  -0.25
    ## Number of obs: 55825, groups:  lab:sub, 2939; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.27183    0.24833  -5.122 3.03e-07 ***
    ## conditiondistant  0.09772    0.06868   1.423    0.155    
    ## d                 1.32221    0.26151   5.056 4.28e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.121       
    ## d           -0.897  0.000

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
    ## -3.6806 -0.7805 -0.2896  0.7856  5.5901 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.769540 0.87723       
    ##  lab     (Intercept)      0.082171 0.28665       
    ##          conditiondistant 0.001347 0.03671  0.79 
    ##  item    (Intercept)      0.193834 0.44027       
    ##          conditiondistant 0.055410 0.23539  -0.24
    ## Number of obs: 55825, groups:  lab:sub, 2939; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         -1.3463     0.2481  -5.427 5.72e-08 ***
    ## conditiondistant     0.2611     0.1429   1.827   0.0677 .  
    ## d                    1.4091     0.2609   5.400 6.65e-08 ***
    ## conditiondistant:d  -0.1909     0.1477  -1.293   0.1960    
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
    ## glmm_spatial_bif_int_rs    11 45209 45303 -22593    45187 0.5817  1    0.44563   
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
    ##  lab:sub (Intercept)      0.7762257 0.88104       
    ##  lab     (Intercept)      0.0735728 0.27124       
    ##          conditiondistant 0.0010429 0.03229  -1.00
    ##  item    (Intercept)      0.4750784 0.68926       
    ##          conditiondistant 0.0005267 0.02295  -1.00
    ## Number of obs: 38624, groups:  lab:sub, 2972; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.70047    0.19609   3.572 0.000354 ***
    ## conditiondistant  0.04305    0.04113   1.047 0.295236    
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
    ##  lab:sub (Intercept)      0.7762058 0.88103       
    ##  lab     (Intercept)      0.0731598 0.27048       
    ##          conditiondistant 0.0009661 0.03108  -1.00
    ##  item    (Intercept)      0.2321543 0.48182       
    ##          conditiondistant 0.0002005 0.01416  -1.00
    ## Number of obs: 38624, groups:  lab:sub, 2972; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.56971    0.39182  -1.454 0.145948    
    ## conditiondistant  0.04500    0.04075   1.104 0.269559    
    ## d                 1.37056    0.39424   3.476 0.000508 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.112       
    ## d           -0.934  0.022
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
    ## -3.9020 -0.8235  0.4216  0.6496  2.9297 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance  Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.7762389 0.88104       
    ##  lab     (Intercept)      0.0735087 0.27112       
    ##          conditiondistant 0.0010412 0.03227  -1.00
    ##  item    (Intercept)      0.2316237 0.48127       
    ##          conditiondistant 0.0001885 0.01373  -1.00
    ## Number of obs: 38624, groups:  lab:sub, 2972; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.63766    0.39120  -1.630 0.103100    
    ## conditiondistant    0.09364    0.07514   1.246 0.212678    
    ## d                   1.44495    0.39476   3.660 0.000252 ***
    ## conditiondistant:d -0.05466    0.07077  -0.772 0.439897    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.242              
    ## d           -0.934  0.210       
    ## cndtndstnt:  0.225 -0.840 -0.244
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

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
    ##  item    (Intercept)      0.28161  0.5307        
    ##          conditiondistant 0.07653  0.2766   -0.62
    ## Number of obs: 73050, groups:  lab:sub, 2923; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.38968    0.11409  -3.416 0.000636 ***
    ## conditiondistant -0.25499    0.06837  -3.729 0.000192 ***
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
    ## (Intercept)      -1.06198    0.18797  -5.650 1.61e-08 ***
    ## conditiondistant -0.25569    0.06827  -3.746  0.00018 ***
    ## d                 0.81983    0.20362   4.026 5.67e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.246       
    ## d           -0.888 -0.004
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
    ## conditiondistant    0.03675    0.13448   0.273   0.7846    
    ## d                   1.05803    0.20635   5.127 2.94e-07 ***
    ## conditiondistant:d -0.35545    0.14402  -2.468   0.0136 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.478              
    ## d           -0.894  0.411       
    ## cndtndstnt:  0.418 -0.882 -0.466
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.018297 (tol = 0.002, component 1)

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
    ## glmm_likelihood_bif_val_rs    10 32806 32888 -16393    32786 14.4456  1  0.0001443 ***
    ## glmm_likelihood_bif_int_rs    11 32806 32896 -16392    32784  2.6049  1  0.1065332    
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
    ##  lab:sub (Intercept)      0.672710 0.82019       
    ##  lab     (Intercept)      0.055123 0.23478       
    ##          conditiondistant 0.008001 0.08945  -0.78
    ##  item    (Intercept)      0.647261 0.80453       
    ##          conditiondistant 0.001141 0.03377  -1.00
    ## Number of obs: 26414, groups:  lab:sub, 2935; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)      0.001966   0.270814   0.007    0.994
    ## conditiondistant 0.048238   0.044068   1.095    0.274
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
    ## -3.1975 -0.8009  0.3379  0.7626  3.0381 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.672890 0.82030       
    ##  lab     (Intercept)      0.053683 0.23170       
    ##          conditiondistant 0.007958 0.08921  -0.74
    ##  item    (Intercept)      0.118201 0.34380       
    ##          conditiondistant 0.001389 0.03727  1.00 
    ## Number of obs: 26414, groups:  lab:sub, 2935; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.35327    0.24657  -5.488 4.06e-08 ***
    ## conditiondistant  0.04922    0.04441   1.108    0.268    
    ## d                 1.79524    0.28388   6.324 2.55e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt  0.020       
    ## d           -0.870  0.015
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.0176257 (tol = 0.002, component 1)

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
    ## -3.1492 -0.7995  0.3369  0.7658  3.1088 
    ## 
    ## Random effects:
    ##  Groups  Name             Variance Std.Dev. Corr 
    ##  lab:sub (Intercept)      0.673054 0.82040       
    ##  lab     (Intercept)      0.055014 0.23455       
    ##          conditiondistant 0.008086 0.08992  -0.78
    ##  item    (Intercept)      0.116957 0.34199       
    ##          conditiondistant 0.000661 0.02571  1.00 
    ## Number of obs: 26414, groups:  lab:sub, 2935; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -1.27039    0.23517  -5.402 6.59e-08 ***
    ## conditiondistant    0.13889    0.06933   2.003   0.0451 *  
    ## d                   1.68419    0.26719   6.303 2.91e-10 ***
    ## conditiondistant:d -0.11781    0.07056  -1.670   0.0950 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt  0.090              
    ## d           -0.858 -0.115       
    ## cndtndstnt: -0.128 -0.779  0.152
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.0473205 (tol = 0.002, component 1)

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
    ## (Intercept)      -0.16976    0.12794  -1.327    0.185  
    ## conditiondistant  0.06068    0.03601   1.685    0.092 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.141

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
    ## (Intercept)      -1.15170    0.21097  -5.459 4.79e-08 ***
    ## conditiondistant  0.06068    0.03601   1.685   0.0919 .  
    ## d                 1.19688    0.23047   5.193 2.07e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.085       
    ## d           -0.895  0.000

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
    ## (Intercept)        -1.18871    0.21333  -5.572 2.51e-08 ***
    ## conditiondistant    0.13443    0.05338   2.518   0.0118 *  
    ## d                   1.24114    0.23311   5.324 1.01e-07 ***
    ## conditiondistant:d -0.08834    0.04722  -1.871   0.0614 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.127              
    ## d           -0.897  0.076       
    ## cndtndstnt:  0.094 -0.738 -0.102

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
    ## (Intercept)       0.50055    0.14864   3.367 0.000759 ***
    ## conditiondistant  0.02784    0.03697   0.753 0.451400    
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
    ## (Intercept)      -0.52072    0.27832  -1.871   0.0614 .  
    ## conditiondistant  0.02785    0.03696   0.753   0.4512    
    ## d                 1.24484    0.30727   4.051 5.09e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.067       
    ## d           -0.905  0.000

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
    ##                      Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.5066177  0.2819245  -1.797   0.0723 .  
    ## conditiondistant   -0.0003983  0.0530629  -0.008   0.9940    
    ## d                   1.2271437  0.3115759   3.939  8.2e-05 ***
    ## conditiondistant:d  0.0354799  0.0477459   0.743   0.4574    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.095              
    ## d           -0.908  0.056       
    ## cndtndstnt:  0.068 -0.717 -0.077

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
    ##  lab:sub (Intercept) 0.65822  0.8113  
    ##  lab     (Intercept) 0.05339  0.2311  
    ##  item    (Intercept) 0.48970  0.6998  
    ## Number of obs: 73373, groups:  lab:sub, 2935; lab, 77; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)       0.14213    0.14460   0.983    0.326
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
    ## (Intercept)      -1.06899    0.22910  -4.666 3.07e-06 ***
    ## conditiondistant  0.01308    0.03425   0.382    0.702    
    ## d                 1.47620    0.25257   5.845 5.07e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.074       
    ## d           -0.905  0.000

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
    ##  item    (Intercept) 0.20521  0.4530  
    ## Number of obs: 73373, groups:  lab:sub, 2935; lab, 77; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -1.11346    0.23074  -4.825 1.40e-06 ***
    ## conditiondistant    0.10165    0.05180   1.962   0.0497 *  
    ## d                   1.53089    0.25465   6.012 1.84e-09 ***
    ## conditiondistant:d -0.10904    0.04781  -2.281   0.0226 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.113              
    ## d           -0.906  0.072       
    ## cndtndstnt:  0.086 -0.750 -0.095

# Temporal Distance: Removing Item with Smallest Valence Difference

``` r
lrt_val_temporal_rem
```

    ## Data: data_bif_temporal %>% filter(d != min(d))
    ## Models:
    ## glmm_temporal_bif_base_rem: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_val_rem: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_int_rem: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                            npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)   
    ## glmm_temporal_bif_base_rem    5 66360 66404 -33175    66350                         
    ## glmm_temporal_bif_val_rem     6 66352 66405 -33170    66340 10.3273  1   0.001311 **
    ## glmm_temporal_bif_int_rem     7 66354 66416 -33170    66340  0.0008  1   0.977763   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_temporal_bif_base_rem)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(d != min(d))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  66359.9  66404.3 -33175.0  66349.9    52882 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2181 -0.8061  0.3033  0.7937  4.0505 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.75617  0.8696  
    ##  lab     (Intercept) 0.08872  0.2979  
    ##  item    (Intercept) 0.30922  0.5561  
    ## Number of obs: 52887, groups:  lab:sub, 2939; lab, 78; item, 18
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)  
    ## (Intercept)      -0.03554    0.13808  -0.257   0.7969  
    ## conditiondistant  0.06721    0.03755   1.790   0.0735 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.136

``` r
summary(glmm_temporal_bif_val_rem)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(d != min(d))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  66351.6  66404.8 -33169.8  66339.6    52881 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2153 -0.8067  0.3031  0.7936  4.0444 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.75617  0.8696  
    ##  lab     (Intercept) 0.08863  0.2977  
    ##  item    (Intercept) 0.17341  0.4164  
    ## Number of obs: 52887, groups:  lab:sub, 2939; lab, 78; item, 18
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.02348    0.28729  -3.563 0.000367 ***
    ## conditiondistant  0.06721    0.03755   1.790 0.073467 .  
    ## d                 1.09424    0.29468   3.713 0.000205 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.066       
    ## d           -0.927  0.001

``` r
summary(glmm_temporal_bif_int_rem)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(d != min(d))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  66353.6  66415.7 -33169.8  66339.6    52880 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2155 -0.8067  0.3030  0.7936  4.0441 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.75617  0.8696  
    ##  lab     (Intercept) 0.08863  0.2977  
    ##  item    (Intercept) 0.17341  0.4164  
    ## Number of obs: 52887, groups:  lab:sub, 2939; lab, 78; item, 18
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -1.022760   0.286211  -3.573 0.000352 ***
    ## conditiondistant    0.065737   0.064439   1.020 0.307663    
    ## d                   1.093456   0.293839   3.721 0.000198 ***
    ## conditiondistant:d  0.001625   0.057756   0.028 0.977553    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.112              
    ## d           -0.927  0.079       
    ## cndtndstnt:  0.091 -0.813 -0.097
