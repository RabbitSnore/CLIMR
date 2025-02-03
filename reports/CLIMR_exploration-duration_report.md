Construal Level International Multilab Replication (CLIMR) Project:
Analysis of Study Duration as a Moderator
================
CLIMR Team
2025-02-03

# Study Duration

Note that these analyses only include data from participants whose
recorded duration was one hour or less.

## Liberman & Trope (1998, Study 1)

``` r
lrt_dur_temporal
```

    ## Data: data_bif_temporal %>% filter(total_duration <= 60)
    ## Models:
    ## glmm_temporal_dur_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_dur_add: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_dur_int: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                        npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_temporal_dur_base    5 68404 68449 -34197    68394                     
    ## glmm_temporal_dur_add     6 68406 68459 -34197    68394 0.6392  1     0.4240
    ## glmm_temporal_dur_int     7 68407 68470 -34197    68393 0.2037  1     0.6518

``` r
summary(glmm_temporal_dur_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  68404.3  68448.9 -34197.1  68394.3    55402 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4447 -0.7826 -0.2952  0.7885  4.7936 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.76639  0.8754  
    ##  lab     (Intercept) 0.09019  0.3003  
    ##  item    (Intercept) 0.43765  0.6615  
    ## Number of obs: 55407, groups:  lab:sub, 2917; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)      -0.14260    0.15798  -0.903  0.36672   
    ## conditiondistant  0.09735    0.03771   2.582  0.00983 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.119

``` r
summary(glmm_temporal_dur_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_temporal %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  68405.6  68459.2 -34196.8  68393.6    55401 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4459 -0.7825 -0.2953  0.7882  4.7898 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.76608  0.8753  
    ##  lab     (Intercept) 0.09078  0.3013  
    ##  item    (Intercept) 0.43765  0.6615  
    ## Number of obs: 55407, groups:  lab:sub, 2917; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)      -0.111382   0.162739  -0.684  0.49371   
    ## conditiondistant  0.097686   0.037706   2.591  0.00958 **
    ## total_duration   -0.003612   0.004511  -0.801  0.42327   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.113       
    ## total_durtn -0.239 -0.011

``` r
summary(glmm_temporal_dur_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_temporal %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  68407.4  68469.9 -34196.7  68393.4    55400 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4426 -0.7826 -0.2952  0.7883  4.7878 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.76608  0.8753  
    ##  lab     (Intercept) 0.09071  0.3012  
    ##  item    (Intercept) 0.43765  0.6616  
    ## Number of obs: 55407, groups:  lab:sub, 2917; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                                  Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)                     -0.092714   0.167895  -0.552    0.581
    ## conditiondistant                 0.063966   0.083574   0.765    0.444
    ## total_duration                  -0.005774   0.006576  -0.878    0.380
    ## conditiondistant:total_duration  0.003893   0.008613   0.452    0.651
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd ttl_dr
    ## condtndstnt -0.269              
    ## total_durtn -0.338  0.646       
    ## cndtndstn:_  0.246 -0.892 -0.728

## Fujita et al. (2006, Study 1)

``` r
lrt_dur_spatial
```

    ## Data: data_bif_spatial %>% filter(total_duration <= 60)
    ## Models:
    ## glmm_spatial_dur_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_dur_add: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_dur_int: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                       npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_spatial_dur_base    5 44983 45026 -22487    44973                     
    ## glmm_spatial_dur_add     6 44985 45036 -22486    44973 0.6133  1     0.4335
    ## glmm_spatial_dur_int     7 44986 45046 -22486    44972 0.4487  1     0.5030

``` r
summary(glmm_spatial_dur_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44983.4  45026.2 -22486.7  44973.4    38422 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9235 -0.8242  0.4214  0.6503  2.9706 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.77147  0.8783  
    ##  lab     (Intercept) 0.06621  0.2573  
    ##  item    (Intercept) 0.46136  0.6792  
    ## Number of obs: 38427, groups:  lab:sub, 2956; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.69987    0.19301   3.626 0.000288 ***
    ## conditiondistant  0.04157    0.04028   1.032 0.302082    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.104

``` r
summary(glmm_spatial_dur_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_spatial %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44984.8  45036.2 -22486.4  44972.8    38421 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9137 -0.8237  0.4212  0.6504  2.9803 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.77110  0.8781  
    ##  lab     (Intercept) 0.06639  0.2577  
    ##  item    (Intercept) 0.46136  0.6792  
    ## Number of obs: 38427, groups:  lab:sub, 2956; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.730332   0.196659   3.714 0.000204 ***
    ## conditiondistant  0.040607   0.040291   1.008 0.313539    
    ## total_duration   -0.003606   0.004588  -0.786 0.431842    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.108       
    ## total_durtn -0.197  0.030

``` r
summary(glmm_spatial_dur_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_spatial %>% filter(total_duration <= 60)
    ## Control: glmerControl(optimizer = "bobyqa")
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44986.4  45046.3 -22486.2  44972.4    38420 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9262 -0.8243  0.4212  0.6503  2.9720 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.77101  0.8781  
    ##  lab     (Intercept) 0.06625  0.2574  
    ##  item    (Intercept) 0.46137  0.6792  
    ## Number of obs: 38427, groups:  lab:sub, 2956; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                      0.754082   0.199902   3.772 0.000162 ***
    ## conditiondistant                -0.008450   0.083368  -0.101 0.919268    
    ## total_duration                  -0.006416   0.006208  -1.033 0.301389    
    ## conditiondistant:total_duration  0.005918   0.008805   0.672 0.501533    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd ttl_dr
    ## condtndstnt -0.206              
    ## total_durtn -0.262  0.601       
    ## cndtndstn:_  0.176 -0.875 -0.674

## Social Distance (Paradigmatic Replication)

``` r
lrt_dur_social
```

    ## Data: data_bif_social %>% filter(total_duration <= 60)
    ## Models:
    ## glmm_social_dur_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_dur_add: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_dur_int: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                      npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_social_dur_base    5 88236 88282 -44113    88226                     
    ## glmm_social_dur_add     6 88238 88294 -44113    88226 0.0000  1     0.9966
    ## glmm_social_dur_int     7 88240 88304 -44113    88226 0.3105  1     0.5774

``` r
summary(glmm_social_dur_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  88236.4  88282.4 -44113.2  88226.4    72470 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1557 -0.7261 -0.4336  0.8751  5.2875 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.84858  0.9212  
    ##  lab     (Intercept) 0.04993  0.2235  
    ##  item    (Intercept) 0.20905  0.4572  
    ## Number of obs: 72475, groups:  lab:sub, 2900; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.37240    0.09901  -3.761 0.000169 ***
    ## conditiondistant -0.28121    0.03829  -7.345 2.06e-13 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.194

``` r
summary(glmm_social_dur_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_social %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  88238.4  88293.5 -44113.2  88226.4    72469 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1557 -0.7261 -0.4336  0.8751  5.2874 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.84858  0.9212  
    ##  lab     (Intercept) 0.04993  0.2235  
    ##  item    (Intercept) 0.20906  0.4572  
    ## Number of obs: 72475, groups:  lab:sub, 2900; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -3.722e-01  1.068e-01  -3.484 0.000493 ***
    ## conditiondistant -2.812e-01  3.831e-02  -7.341 2.12e-13 ***
    ## total_duration   -1.928e-05  4.594e-03  -0.004 0.996651    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.168       
    ## total_durtn -0.375 -0.030

``` r
summary(glmm_social_dur_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_social %>% filter(total_duration <= 60)
    ## Control: glmerControl(optimizer = "bobyqa")
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  88240.1  88304.4 -44113.0  88226.1    72468 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1534 -0.7263 -0.4336  0.8752  5.2837 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.84845  0.9211  
    ##  lab     (Intercept) 0.04994  0.2235  
    ##  item    (Intercept) 0.20903  0.4572  
    ## Number of obs: 72475, groups:  lab:sub, 2900; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                     -0.395404   0.114483  -3.454 0.000553 ***
    ## conditiondistant                -0.237477   0.087185  -2.724 0.006453 ** 
    ## total_duration                   0.002643   0.006621   0.399 0.689787    
    ## conditiondistant:total_duration -0.004973   0.008909  -0.558 0.576730    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd ttl_dr
    ## condtndstnt -0.394              
    ## total_durtn -0.503  0.638       
    ## cndtndstn:_  0.363 -0.898 -0.720

## Likelihood Distance (Paradigmatic Replication)

``` r
lrt_dur_likelihood
```

    ## Data: data_bif_likelihood %>% filter(total_duration <= 60)
    ## Models:
    ## glmm_likelihood_dur_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_dur_add: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_dur_int: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                          npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_likelihood_dur_base    5 32562 32603 -16276    32552                     
    ## glmm_likelihood_dur_add     6 32563 32612 -16276    32551 1.3675  1     0.2422
    ## glmm_likelihood_dur_int     7 32565 32622 -16276    32551 0.0003  1     0.9860

``` r
summary(glmm_likelihood_dur_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32562.3  32603.2 -16276.2  32552.3    26211 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2067 -0.7980  0.3328  0.7638  3.0309 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.67388  0.8209  
    ##  lab     (Intercept) 0.04377  0.2092  
    ##  item    (Intercept) 0.62042  0.7877  
    ## Number of obs: 26216, groups:  lab:sub, 2913; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)      0.0005303  0.2655498   0.002    0.998
    ## conditiondistant 0.0450270  0.0412375   1.092    0.275
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.077

``` r
summary(glmm_likelihood_dur_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_likelihood %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32562.9  32612.0 -16275.5  32550.9    26210 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1828 -0.7978  0.3331  0.7636  3.0540 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.67342  0.8206  
    ##  lab     (Intercept) 0.04357  0.2087  
    ##  item    (Intercept) 0.62044  0.7877  
    ## Number of obs: 26216, groups:  lab:sub, 2913; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)      -0.049077   0.268570  -0.183    0.855
    ## conditiondistant  0.044304   0.041234   1.074    0.283
    ## total_duration    0.006122   0.005219   1.173    0.241
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.074       
    ## total_durtn -0.157 -0.015

``` r
summary(glmm_likelihood_dur_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * total_duration + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_likelihood %>% filter(total_duration <= 60)
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32564.9  32622.2 -16275.5  32550.9    26209 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1830 -0.7978  0.3331  0.7636  3.0543 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.67342  0.8206  
    ##  lab     (Intercept) 0.04357  0.2087  
    ##  item    (Intercept) 0.62045  0.7877  
    ## Number of obs: 26216, groups:  lab:sub, 2913; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                                   Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)                     -0.0498067  0.2721885  -0.183    0.855
    ## conditiondistant                 0.0457669  0.0929789   0.492    0.623
    ## total_duration                   0.0062133  0.0073776   0.842    0.400
    ## conditiondistant:total_duration -0.0001785  0.0101656  -0.018    0.986
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd ttl_dr
    ## condtndstnt -0.172              
    ## total_durtn -0.221  0.629       
    ## cndtndstn:_  0.156 -0.896 -0.707
