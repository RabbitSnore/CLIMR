Construal Level International Multilab Replication (CLIMR) Project:
Robustness Tests Account for Valence Differences in the Response Options
for the Items on the Behavior Identification Form (BIF)
================
CLIMR Team
2023-10-13

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Liberman & Trope (1998, Study 1)

``` r
lrt_val_temporal
```

    ## Data: data_bif_temporal
    ## Models:
    ## glmm_temporal_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                        npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_temporal_bif_base    5 83546 83592 -41768    83536                     
    ## glmm_temporal_bif_val     6 83548 83602 -41768    83536 0.7592  1     0.3836
    ## glmm_temporal_bif_int     7 83549 83612 -41768    83535 0.5661  1     0.4518

``` r
summary(glmm_temporal_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83546.4  83591.5 -41768.2  83536.4    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5842 -0.8840 -0.7034  1.0456  1.7758 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.01160  0.1077  
    ##  lab     (Intercept) 0.05748  0.2398  
    ##  item    (Intercept) 0.01134  0.1065  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.007579   0.034400    0.22    0.826    
    ## conditiondistant -0.447702   0.017321  -25.85   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.254

``` r
summary(glmm_temporal_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83547.6  83601.8 -41767.8  83535.6    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5825 -0.8843 -0.7034  1.0454  1.7769 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.01160  0.1077  
    ##  lab     (Intercept) 0.05748  0.2397  
    ##  item    (Intercept) 0.01095  0.1046  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.05240    0.06143   0.853    0.394    
    ## conditiondistant -0.44770    0.01732 -25.847   <2e-16 ***
    ## d                -0.05463    0.06222  -0.878    0.380    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.143       
    ## d           -0.831  0.001

``` r
summary(glmm_temporal_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83549.0  83612.3 -41767.5  83535.0    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5802 -0.8838 -0.7034  1.0457  1.7725 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.01160  0.1077  
    ##  lab     (Intercept) 0.05748  0.2397  
    ##  item    (Intercept) 0.01095  0.1046  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         0.06654    0.06426   1.035    0.301    
    ## conditiondistant   -0.47574    0.04110 -11.574   <2e-16 ***
    ## d                  -0.07187    0.06634  -1.083    0.279    
    ## conditiondistant:d  0.03421    0.04547   0.752    0.452    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.323              
    ## d           -0.847  0.314       
    ## cndtndstnt:  0.293 -0.907 -0.346

# Fujita et al. (2006, Study 1)

``` r
lrt_val_spatial
```

    ## Data: data_bif_spatial
    ## Models:
    ## glmm_spatial_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                       npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_spatial_bif_base    5 83376 83421 -41683    83366                     
    ## glmm_spatial_bif_val     6 83377 83431 -41682    83365 1.0062  1     0.3158
    ## glmm_spatial_bif_int     7 83379 83442 -41682    83365 0.0066  1     0.9354

``` r
summary(glmm_spatial_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83375.8  83421.0 -41682.9  83365.8    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3805 -0.8712 -0.7020  1.0637  1.8506 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.005091 0.07135 
    ##  lab     (Intercept) 0.048852 0.22103 
    ##  item    (Intercept) 0.009426 0.09709 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.02662    0.03176  -0.838    0.402    
    ## conditiondistant -0.47813    0.01705 -28.038   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.260

``` r
summary(glmm_spatial_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83376.8  83431.0 -41682.4  83364.8    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3791 -0.8712 -0.7017  1.0636  1.8516 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.005091 0.07135 
    ##  lab     (Intercept) 0.048846 0.22101 
    ##  item    (Intercept) 0.008985 0.09479 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.02092    0.05650   0.370    0.711    
    ## conditiondistant -0.47813    0.01705 -28.037   <2e-16 ***
    ## d                -0.05794    0.05719  -1.013    0.311    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.147       
    ## d           -0.830  0.001

``` r
summary(glmm_spatial_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83378.8  83442.0 -41682.4  83364.8    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3789 -0.8711 -0.7019  1.0637  1.8511 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.005091 0.07135 
    ##  lab     (Intercept) 0.048847 0.22101 
    ##  item    (Intercept) 0.008984 0.09479 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         0.022387   0.059306   0.377    0.706    
    ## conditiondistant   -0.481154   0.040996 -11.737   <2e-16 ***
    ## d                  -0.059733   0.061278  -0.975    0.330    
    ## conditiondistant:d  0.003695   0.045511   0.081    0.935    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.336              
    ## d           -0.848  0.328       
    ## cndtndstnt:  0.305 -0.909 -0.360

# Social Distance (Paradigmatic Replication)

``` r
lrt_val_social
```

    ## Data: data_bif_social
    ## Models:
    ## glmm_social_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                      npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)   
    ## glmm_social_bif_base    5 83825 83870 -41907    83815                        
    ## glmm_social_bif_val     6 83820 83874 -41904    83808 6.8104  1   0.009063 **
    ## glmm_social_bif_int     7 83822 83885 -41904    83808 0.1837  1   0.668187   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_social_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83825.0  83870.1 -41907.5  83815.0    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4827 -0.8947 -0.7098  1.0435  1.7262 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.008108 0.09004 
    ##  lab     (Intercept) 0.048817 0.22094 
    ##  item    (Intercept) 0.008165 0.09036 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.005647   0.030942   0.182    0.855    
    ## conditiondistant -0.448615   0.017124 -26.198   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.265

``` r
summary(glmm_social_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83820.1  83874.3 -41904.1  83808.1    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4722 -0.8943 -0.7094  1.0434  1.7257 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.008111 0.09006 
    ##  lab     (Intercept) 0.048774 0.22085 
    ##  item    (Intercept) 0.005791 0.07610 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.10427    0.04903  -2.127  0.03346 *  
    ## conditiondistant -0.44861    0.01712 -26.198  < 2e-16 ***
    ## d                 0.13397    0.04786   2.799  0.00512 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.165       
    ## d           -0.801 -0.002

``` r
summary(glmm_social_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83822.0  83885.2 -41904.0  83808.0    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4728 -0.8949 -0.7091  1.0430  1.7287 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.008111 0.09006 
    ##  lab     (Intercept) 0.048775 0.22085 
    ##  item    (Intercept) 0.005792 0.07610 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.09663    0.05217  -1.852   0.0640 .  
    ## conditiondistant   -0.46463    0.04112 -11.300   <2e-16 ***
    ## d                   0.12466    0.05256   2.372   0.0177 *  
    ## conditiondistant:d  0.01948    0.04544   0.429   0.6682    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.375              
    ## d           -0.827  0.375       
    ## cndtndstnt:  0.342 -0.909 -0.413

# Likelihood Distance (Paradigmatic Replication)

``` r
lrt_val_likelihood
```

    ## Data: data_bif_likelihood
    ## Models:
    ## glmm_likelihood_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                          npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_likelihood_bif_base    5 83142 83187 -41566    83132                     
    ## glmm_likelihood_bif_val     6 83142 83196 -41565    83130 2.2196  1     0.1363
    ## glmm_likelihood_bif_int     7 83144 83207 -41565    83130 0.0870  1     0.7680

``` r
summary(glmm_likelihood_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83141.8  83187.0 -41565.9  83131.8    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5714 -0.8635 -0.6907  1.0576  1.8245 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.013467 0.11605 
    ##  lab     (Intercept) 0.064179 0.25334 
    ##  item    (Intercept) 0.009551 0.09773 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.03239    0.03431  -0.944    0.345    
    ## conditiondistant -0.47930    0.01750 -27.394   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.249

``` r
summary(glmm_likelihood_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83141.6  83195.8 -41564.8  83129.6    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5789 -0.8635 -0.6901  1.0573  1.8193 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.013467 0.11605 
    ##  lab     (Intercept) 0.064163 0.25330 
    ##  item    (Intercept) 0.008582 0.09264 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.03778    0.05708   0.662    0.508    
    ## conditiondistant -0.47930    0.01750 -27.394   <2e-16 ***
    ## d                -0.08553    0.05612  -1.524    0.127    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.151       
    ## d           -0.807  0.001

``` r
summary(glmm_likelihood_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83143.5  83206.7 -41564.8  83129.5    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5835 -0.8632 -0.6905  1.0575  1.8207 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.013468 0.11605 
    ##  lab     (Intercept) 0.064163 0.25330 
    ##  item    (Intercept) 0.008582 0.09264 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         0.04317    0.05995   0.720    0.471    
    ## conditiondistant   -0.49033    0.04129 -11.875   <2e-16 ***
    ## d                  -0.09211    0.06041  -1.525    0.127    
    ## conditiondistant:d  0.01347    0.04566   0.295    0.768    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.337              
    ## d           -0.827  0.335       
    ## cndtndstnt:  0.305 -0.906 -0.369
