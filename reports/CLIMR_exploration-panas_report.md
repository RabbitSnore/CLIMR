Construal Level International Multilab Replication (CLIMR) Project:
Analysis of Positive and Negative Affect (PANAS)
================
CLIMR Team
2024-11-28

# Positive and Negative Affect (PANAS)

## Liberman & Trope (1998, Study 1)

``` r
lrt_panas_temporal
```

    ## Data: data_bif_temporal %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_temporal_panas_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_panas_add: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_panas_int: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                          npar   AIC   BIC logLik deviance    Chisq Df Pr(>Chisq)    
    ## glmm_temporal_panas_base    5 67863 67907 -33926    67853                           
    ## glmm_temporal_panas_add     7 67765 67828 -33876    67751 101.4456  2     <2e-16 ***
    ## glmm_temporal_panas_int     9 67769 67849 -33875    67751   0.2364  2     0.8885    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_temporal_panas_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  67862.6  67907.2 -33926.3  67852.6    54981 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4433 -0.7808 -0.2978  0.7886  4.8177 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.7671   0.8758  
    ##  lab     (Intercept) 0.0865   0.2941  
    ##  item    (Intercept) 0.4438   0.6662  
    ## Number of obs: 54986, groups:  lab:sub, 2894; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)  
    ## (Intercept)      -0.14177    0.15906  -0.891   0.3728  
    ## conditiondistant  0.08888    0.03786   2.347   0.0189 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.119

``` r
summary(glmm_temporal_panas_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 |      lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  67765.2  67827.6 -33875.6  67751.2    54979 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5913 -0.7812 -0.2985  0.7891  4.7598 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.73449  0.857   
    ##  lab     (Intercept) 0.06866  0.262   
    ##  item    (Intercept) 0.44357  0.666   
    ## Number of obs: 54986, groups:  lab:sub, 2894; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.13812    0.15796  -0.874   0.3819    
    ## conditiondistant  0.08369    0.03726   2.246   0.0247 *  
    ## panas_pos         0.25727    0.02582   9.963   <2e-16 ***
    ## panas_neg         0.01345    0.02636   0.510   0.6097    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd pns_ps
    ## condtndstnt -0.118              
    ## panas_pos    0.002 -0.012       
    ## panas_neg    0.002 -0.005 -0.141

``` r
summary(glmm_temporal_panas_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) +      (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  67768.9  67849.2 -33875.5  67750.9    54977 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5965 -0.7813 -0.2986  0.7891  4.7663 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.73444  0.8570  
    ##  lab     (Intercept) 0.06862  0.2619  
    ##  item    (Intercept) 0.44356  0.6660  
    ## Number of obs: 54986, groups:  lab:sub, 2894; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                            Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                -0.13823    0.15822  -0.874   0.3823    
    ## conditiondistant            0.08370    0.03726   2.246   0.0247 *  
    ## panas_pos                   0.24802    0.03620   6.852 7.28e-12 ***
    ## panas_neg                   0.02367    0.03736   0.634   0.5263    
    ## conditiondistant:panas_pos  0.01794    0.05030   0.357   0.7214    
    ## conditiondistant:panas_neg -0.01962    0.05166  -0.380   0.7041    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##                  (Intr) cndtnd pns_ps pns_ng cndtndstnt:pns_p
    ## condtndstnt      -0.118                                      
    ## panas_pos         0.002 -0.009                               
    ## panas_neg         0.001 -0.003 -0.166                        
    ## cndtndstnt:pns_p -0.001  0.000 -0.701  0.118                 
    ## cndtndstnt:pns_n  0.001  0.000  0.119 -0.708 -0.146

``` r
lrt_panas_val_temporal
```

    ## Data: data_bif_temporal %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_temporal_panas_add: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_panas_val: bif ~ condition + panas_pos * d + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                         npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)    
    ## glmm_temporal_panas_add    7 67765 67828 -33876    67751                         
    ## glmm_temporal_panas_val    9 67752 67833 -33867    67734 16.813  2  0.0002234 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_temporal_panas_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + panas_pos * d + panas_neg + (1 | lab:sub) +      (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  67752.4  67832.6 -33867.2  67734.4    54977 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.5910 -0.7815 -0.2984  0.7889  4.7683 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.73452  0.8570  
    ##  lab     (Intercept) 0.06858  0.2619  
    ##  item    (Intercept) 0.18226  0.4269  
    ## Number of obs: 54986, groups:  lab:sub, 2894; lab, 78; item, 19
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.25561    0.24006  -5.230 1.69e-07 ***
    ## conditiondistant  0.08369    0.03726   2.246   0.0247 *  
    ## panas_pos         0.25274    0.03947   6.403 1.52e-10 ***
    ## d                 1.31020    0.25249   5.189 2.11e-07 ***
    ## panas_neg         0.01345    0.02636   0.510   0.6098    
    ## panas_pos:d       0.00520    0.03424   0.152   0.8793    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd pns_ps d      pns_ng
    ## condtndstnt -0.078                            
    ## panas_pos   -0.003 -0.008                     
    ## d           -0.897  0.000  0.003              
    ## panas_neg    0.001 -0.005 -0.090  0.000       
    ## panas_pos:d  0.004  0.001 -0.756 -0.003 -0.002

## Fujita et al. (2006, Study 1)

``` r
lrt_panas_spatial
```

    ## Data: data_bif_spatial %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_spatial_panas_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_panas_add: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_panas_int: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                         npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_spatial_panas_base    5 44807 44849 -22398    44797                          
    ## glmm_spatial_panas_add     7 44739 44799 -22363    44725 71.6834  2  2.717e-16 ***
    ## glmm_spatial_panas_int     9 44743 44820 -22362    44725  0.4081  2     0.8154    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_spatial_panas_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44806.7  44849.4 -22398.3  44796.7    38305 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9592 -0.8228  0.4204  0.6501  2.9781 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.7709   0.8780  
    ##  lab     (Intercept) 0.0683   0.2613  
    ##  item    (Intercept) 0.4641   0.6813  
    ## Number of obs: 38310, groups:  lab:sub, 2947; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.70167    0.19372   3.622 0.000292 ***
    ## conditiondistant  0.04563    0.04033   1.131 0.257916    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.104

``` r
summary(glmm_spatial_panas_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 |      lab) + (1 | item)
    ##    Data: data_bif_spatial %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44739.0  44798.9 -22362.5  44725.0    38303 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.0274 -0.8185  0.4210  0.6502  2.9922 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.7436   0.8623  
    ##  lab     (Intercept) 0.0642   0.2534  
    ##  item    (Intercept) 0.4641   0.6813  
    ## Number of obs: 38310, groups:  lab:sub, 2947; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.69496    0.19324   3.596 0.000323 ***
    ## conditiondistant  0.05545    0.03989   1.390 0.164490    
    ## panas_pos         0.23032    0.02709   8.502  < 2e-16 ***
    ## panas_neg        -0.02647    0.02991  -0.885 0.376198    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd pns_ps
    ## condtndstnt -0.103              
    ## panas_pos   -0.002  0.030       
    ## panas_neg    0.004 -0.016 -0.177

``` r
summary(glmm_spatial_panas_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) +      (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44742.6  44819.6 -22362.3  44724.6    38301 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.0312 -0.8187  0.4207  0.6505  3.0012 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.74343  0.8622  
    ##  lab     (Intercept) 0.06412  0.2532  
    ##  item    (Intercept) 0.46413  0.6813  
    ## Number of obs: 38310, groups:  lab:sub, 2947; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                            Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                 0.69490    0.19330   3.595 0.000324 ***
    ## conditiondistant            0.05568    0.03990   1.396 0.162808    
    ## panas_pos                   0.22336    0.03719   6.006  1.9e-09 ***
    ## panas_neg                  -0.04115    0.04144  -0.993 0.320784    
    ## conditiondistant:panas_pos  0.01516    0.05327   0.285 0.775957    
    ## conditiondistant:panas_neg  0.03012    0.05863   0.514 0.607386    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##                  (Intr) cndtnd pns_ps pns_ng cndtndstnt:pns_p
    ## condtndstnt      -0.103                                      
    ## panas_pos        -0.002  0.011                               
    ## panas_neg         0.003 -0.010 -0.191                        
    ## cndtndstnt:pns_p  0.000  0.017 -0.685  0.129                 
    ## cndtndstnt:pns_n -0.001 -0.002  0.137 -0.692 -0.180

``` r
lrt_panas_val_spatial
```

    ## Data: data_bif_spatial %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_spatial_panas_add: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_panas_val: bif ~ condition + panas_pos * d + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                        npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)    
    ## glmm_spatial_panas_add    7 44739 44799 -22363    44725                         
    ## glmm_spatial_panas_val    9 44726 44802 -22354    44708 17.477  2  0.0001603 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_spatial_panas_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + panas_pos * d + panas_neg + (1 | lab:sub) +      (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44725.5  44802.5 -22353.8  44707.5    38301 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.0433 -0.8196  0.4198  0.6517  2.9699 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.74418  0.8627  
    ##  lab     (Intercept) 0.06424  0.2535  
    ##  item    (Intercept) 0.22812  0.4776  
    ## Number of obs: 38310, groups:  lab:sub, 2947; lab, 78; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.62612    0.38587  -1.623 0.104669    
    ## conditiondistant  0.05537    0.03991   1.387 0.165318    
    ## panas_pos         0.11187    0.04898   2.284 0.022368 *  
    ## d                 1.42811    0.38902   3.671 0.000242 ***
    ## panas_neg        -0.02661    0.02993  -0.889 0.373893    
    ## panas_pos:d       0.13405    0.04605   2.911 0.003601 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd pns_ps d      pns_ng
    ## condtndstnt -0.052                            
    ## panas_pos    0.001  0.017                     
    ## d           -0.933  0.000 -0.003              
    ## panas_neg    0.002 -0.016 -0.097  0.000       
    ## panas_pos:d -0.004 -0.001 -0.833  0.005 -0.002

## Social Distance (Paradigmatic Replication)

``` r
lrt_panas_social
```

    ## Data: data_bif_social %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_social_panas_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_panas_add: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_panas_int: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                        npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_social_panas_base    5 88050 88096 -44020    88040                          
    ## glmm_social_panas_add     7 87991 88055 -43988    87977 63.2773  2  1.818e-14 ***
    ## glmm_social_panas_int     9 87987 88069 -43984    87969  8.1441  2    0.01704 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_social_panas_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  88050.1  88096.1 -44020.1  88040.1    72395 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1800 -0.7248 -0.4335  0.8742  5.3226 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.85462  0.9245  
    ##  lab     (Intercept) 0.04701  0.2168  
    ##  item    (Intercept) 0.21246  0.4609  
    ## Number of obs: 72400, groups:  lab:sub, 2897; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.38043    0.09950  -3.824 0.000132 ***
    ## conditiondistant -0.27694    0.03842  -7.209 5.64e-13 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.192

``` r
summary(glmm_social_panas_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 |      lab) + (1 | item)
    ##    Data: data_bif_social %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  87990.9  88055.2 -43988.4  87976.9    72393 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2211 -0.7243 -0.4329  0.8731  5.0535 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.83164  0.9119  
    ##  lab     (Intercept) 0.04197  0.2049  
    ##  item    (Intercept) 0.21240  0.4609  
    ## Number of obs: 72400, groups:  lab:sub, 2897; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.38574    0.09903  -3.895 9.81e-05 ***
    ## conditiondistant -0.26693    0.03805  -7.016 2.28e-12 ***
    ## panas_pos         0.18300    0.02509   7.294 3.01e-13 ***
    ## panas_neg         0.06879    0.02822   2.438   0.0148 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd pns_ps
    ## condtndstnt -0.192              
    ## panas_pos   -0.012  0.045       
    ## panas_neg    0.009 -0.029 -0.115

``` r
summary(glmm_social_panas_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) +      (1 | lab) + (1 | item)
    ##    Data: data_bif_social %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  87986.7  88069.4 -43984.4  87968.7    72391 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2599 -0.7239 -0.4333  0.8730  5.1169 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.82843  0.9102  
    ##  lab     (Intercept) 0.04224  0.2055  
    ##  item    (Intercept) 0.21240  0.4609  
    ## Number of obs: 72400, groups:  lab:sub, 2897; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                            Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                -0.38837    0.09904  -3.921 8.81e-05 ***
    ## conditiondistant           -0.26638    0.03799  -7.013 2.34e-12 ***
    ## panas_pos                   0.25310    0.03518   7.195 6.24e-13 ***
    ## panas_neg                   0.04882    0.03972   1.229  0.21900    
    ## conditiondistant:panas_pos -0.13987    0.04930  -2.837  0.00455 ** 
    ## conditiondistant:panas_neg  0.03763    0.05528   0.681  0.49607    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##                  (Intr) cndtnd pns_ps pns_ng cndtndstnt:pns_p
    ## condtndstnt      -0.191                                      
    ## panas_pos        -0.015  0.035                               
    ## panas_neg         0.011 -0.018 -0.126                        
    ## cndtndstnt:pns_p  0.009 -0.005 -0.702  0.087                 
    ## cndtndstnt:pns_n -0.008 -0.003  0.088 -0.705 -0.113

``` r
lrt_panas_val_social
```

    ## Data: data_bif_social %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_social_panas_int: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_panas_val_int: bif ~ condition * panas_pos + condition * panas_neg + condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_panas_val_int_3: bif ~ condition * panas_pos + condition * panas_neg + condition * d * panas_pos + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                             npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_social_panas_int          9 87987 88069 -43984    87969                          
    ## glmm_social_panas_val_int     11 87925 88026 -43951    87903 66.0158  2  4.622e-15 ***
    ## glmm_social_panas_val_int_3   13 87921 88041 -43948    87895  7.3117  2    0.02584 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_social_panas_val_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * panas_pos + condition * panas_neg + condition *      d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  87924.7  88025.8 -43951.4  87902.7    72389 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.3111 -0.7221 -0.4334  0.8706  4.7345 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.83092  0.9115  
    ##  lab     (Intercept) 0.04228  0.2056  
    ##  item    (Intercept) 0.11023  0.3320  
    ## Number of obs: 72400, groups:  lab:sub, 2897; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                            Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                -1.25710    0.17113  -7.346 2.05e-13 ***
    ## conditiondistant            0.02259    0.05563   0.406  0.68468    
    ## panas_pos                   0.25492    0.03524   7.234 4.70e-13 ***
    ## panas_neg                   0.04918    0.03980   1.236  0.21652    
    ## d                           1.05417    0.18686   5.642 1.68e-08 ***
    ## conditiondistant:panas_pos -0.14242    0.04936  -2.885  0.00391 ** 
    ## conditiondistant:panas_neg  0.03686    0.05536   0.666  0.50560    
    ## conditiondistant:d         -0.34196    0.04815  -7.103 1.22e-12 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##                  (Intr) cndtnd pns_ps pns_ng d      cndtndstnt:pns_p cndtndstnt:pns_n
    ## condtndstnt      -0.163                                                              
    ## panas_pos        -0.010  0.030                                                       
    ## panas_neg         0.006 -0.011 -0.126                                                
    ## d                -0.897  0.094  0.002  0.000                                         
    ## cndtndstnt:pns_p  0.007 -0.008 -0.702  0.087 -0.002                                  
    ## cndtndstnt:pns_n -0.004 -0.003  0.088 -0.705  0.000 -0.113                           
    ## cndtndstnt:       0.119 -0.730 -0.008 -0.002 -0.129  0.007            0.002

``` r
summary(glmm_social_panas_val_int_3)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * panas_pos + condition * panas_neg + condition *      d * panas_pos + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social %>% filter(complete.cases(panas_pos, panas_neg))
    ## Control: glmerControl(optimizer = "bobyqa")
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  87921.4  88040.9 -43947.7  87895.4    72387 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.3100 -0.7219 -0.4328  0.8706  4.5760 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.83089  0.9115  
    ##  lab     (Intercept) 0.04229  0.2057  
    ##  item    (Intercept) 0.11033  0.3322  
    ## Number of obs: 72400, groups:  lab:sub, 2897; lab, 78; item, 25
    ## 
    ## Fixed effects:
    ##                               Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                  -1.257503   0.170897  -7.358 1.86e-13 ***
    ## conditiondistant              0.023446   0.055690   0.421   0.6738    
    ## panas_pos                     0.257270   0.051013   5.043 4.58e-07 ***
    ## panas_neg                     0.049225   0.039793   1.237   0.2161    
    ## d                             1.054619   0.186628   5.651 1.60e-08 ***
    ## conditiondistant:panas_pos   -0.044559   0.071742  -0.621   0.5345    
    ## conditiondistant:panas_neg    0.036913   0.055353   0.667   0.5049    
    ## conditiondistant:d           -0.343441   0.048216  -7.123 1.06e-12 ***
    ## panas_pos:d                  -0.002818   0.043906  -0.064   0.9488    
    ## conditiondistant:panas_pos:d -0.115754   0.061825  -1.872   0.0612 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##                  (Intr) cndtnd pns_ps pns_ng d      cndtndstnt:pns_p cndtndstnt:pns_n cndtn: pns_p:
    ## condtndstnt      -0.163                                                                            
    ## panas_pos        -0.018  0.051                                                                     
    ## panas_neg         0.006 -0.011 -0.086                                                              
    ## d                -0.897  0.094  0.012  0.001                                                       
    ## cndtndstnt:pns_p  0.012 -0.028 -0.705  0.060 -0.008                                                
    ## cndtndstnt:pns_n -0.004 -0.003  0.061 -0.705 -0.001 -0.077                                         
    ## cndtndstnt:       0.119 -0.730 -0.042 -0.002 -0.129  0.029            0.002                        
    ## panas_pos:d       0.015 -0.042 -0.723 -0.001 -0.014  0.514            0.001            0.050       
    ## cndtndst:_:      -0.010  0.029  0.513  0.001  0.010 -0.726           -0.001           -0.031 -0.710

## Likelihood Distance (Paradigmatic Replication)

``` r
lrt_panas_likelihood
```

    ## Data: data_bif_likelihood %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_likelihood_panas_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_panas_add: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_panas_int: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                            npar   AIC   BIC logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_likelihood_panas_base    5 32343 32384 -16167    32333                          
    ## glmm_likelihood_panas_add     7 32303 32361 -16145    32289 44.0495  2  2.721e-10 ***
    ## glmm_likelihood_panas_int     9 32304 32377 -16143    32286  3.4577  2     0.1775    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_likelihood_panas_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32343.4  32384.3 -16166.7  32333.4    26023 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8194 -0.8001  0.3319  0.7643  3.0335 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.66774  0.8172  
    ##  lab     (Intercept) 0.03879  0.1969  
    ##  item    (Intercept) 0.62158  0.7884  
    ## Number of obs: 26028, groups:  lab:sub, 2892; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)      -0.008133   0.265371  -0.031    0.976
    ## conditiondistant  0.055500   0.041273   1.345    0.179
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.077

``` r
summary(glmm_likelihood_panas_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 |      lab) + (1 | item)
    ##    Data: data_bif_likelihood %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32303.4  32360.5 -16144.7  32289.4    26021 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9011 -0.7951  0.3337  0.7658  3.1545 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.6521   0.8075  
    ##  lab     (Intercept) 0.0313   0.1769  
    ##  item    (Intercept) 0.6215   0.7883  
    ## Number of obs: 26028, groups:  lab:sub, 2892; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.006954   0.265247  -0.026    0.979    
    ## conditiondistant  0.053376   0.041010   1.302    0.193    
    ## panas_pos         0.171062   0.027054   6.323 2.56e-10 ***
    ## panas_neg         0.038228   0.031082   1.230    0.219    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd pns_ps
    ## condtndstnt -0.077              
    ## panas_pos    0.000 -0.004       
    ## panas_neg    0.003 -0.008 -0.141

``` r
summary(glmm_likelihood_panas_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * panas_pos + condition * panas_neg + (1 | lab:sub) +      (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32303.9  32377.4 -16143.0  32285.9    26019 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.9156 -0.7940  0.3336  0.7660  3.1728 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.6507   0.8066  
    ##  lab     (Intercept) 0.0314   0.1772  
    ##  item    (Intercept) 0.6214   0.7883  
    ## Number of obs: 26028, groups:  lab:sub, 2892; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                -0.006263   0.265060  -0.024   0.9811    
    ## conditiondistant            0.053199   0.040987   1.298   0.1943    
    ## panas_pos                   0.167955   0.037615   4.465    8e-06 ***
    ## panas_neg                   0.094843   0.043461   2.182   0.0291 *  
    ## conditiondistant:panas_pos  0.007421   0.052930   0.140   0.8885    
    ## conditiondistant:panas_neg -0.113647   0.061042  -1.862   0.0626 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##                  (Intr) cndtnd pns_ps pns_ng cndtndstnt:pns_p
    ## condtndstnt      -0.077                                      
    ## panas_pos         0.000 -0.004                               
    ## panas_neg         0.003 -0.007 -0.125                        
    ## cndtndstnt:pns_p  0.000  0.001 -0.695  0.085                 
    ## cndtndstnt:pns_n -0.001  0.002  0.088 -0.699 -0.139

``` r
lrt_panas_val_likelihood
```

    ## Data: data_bif_likelihood %>% filter(complete.cases(panas_pos, panas_neg))
    ## Models:
    ## glmm_likelihood_panas_add: bif ~ condition + panas_pos + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_panas_val: bif ~ condition + panas_pos * d + panas_neg + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                           npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)    
    ## glmm_likelihood_panas_add    7 32303 32361 -16145    32289                         
    ## glmm_likelihood_panas_val    9 32292 32366 -16137    32274 15.099  2  0.0005263 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_likelihood_panas_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + panas_pos * d + panas_neg + (1 | lab:sub) +      (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood %>% filter(complete.cases(panas_pos, panas_neg))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  32292.3  32365.8 -16137.1  32274.3    26019 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8686 -0.7964  0.3357  0.7645  3.2166 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.65236  0.8077  
    ##  lab     (Intercept) 0.03122  0.1767  
    ##  item    (Intercept) 0.12606  0.3550  
    ## Number of obs: 26028, groups:  lab:sub, 2892; lab, 77; item, 9
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -1.23633    0.24207  -5.107 3.27e-07 ***
    ## conditiondistant  0.05341    0.04102   1.302    0.193    
    ## panas_pos         0.20194    0.04286   4.712 2.46e-06 ***
    ## d                 1.62752    0.27556   5.906 3.50e-09 ***
    ## panas_neg         0.03828    0.03108   1.231    0.218    
    ## panas_pos:d      -0.04018    0.04329  -0.928    0.353    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd pns_ps d      pns_ng
    ## condtndstnt -0.085                            
    ## panas_pos   -0.006 -0.002                     
    ## d           -0.860  0.001  0.004              
    ## panas_neg    0.003 -0.008 -0.088  0.001       
    ## panas_pos:d  0.005 -0.001 -0.776 -0.003 -0.002