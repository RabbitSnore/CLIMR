Construal Level International Multilab Replication (CLIMR) Project:
Robustness Tests Account for Valence Differences in the Response Options
for the Items on the Behavior Identification Form (BIF)
================
CLIMR Team
2022-11-22

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
    ## glmm_temporal_bif_base    5 83029 83074 -41509    83019                     
    ## glmm_temporal_bif_val     6 83030 83084 -41509    83018 0.6152  1     0.4329
    ## glmm_temporal_bif_int     7 83032 83095 -41509    83018 0.2651  1     0.6066

``` r
summary(glmm_temporal_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83028.8  83074.0 -41509.4  83018.8    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5296 -0.8631 -0.6888  1.0676  1.8737 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.004197 0.06479 
    ##  lab     (Intercept) 0.054292 0.23301 
    ##  item    (Intercept) 0.018312 0.13532 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.04817    0.03772  -1.277    0.202    
    ## conditiondistant -0.46421    0.01702 -27.273   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.226

``` r
summary(glmm_temporal_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83030.2  83084.4 -41509.1  83018.2    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5326 -0.8630 -0.6887  1.0673  1.8713 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.004197 0.06479 
    ##  lab     (Intercept) 0.054288 0.23300 
    ##  item    (Intercept) 0.017816 0.13348 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.001893   0.073667   0.026    0.979    
    ## conditiondistant -0.464213   0.017021 -27.273   <2e-16 ***
    ## d                -0.061029   0.077304  -0.789    0.430    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.116       
    ## d           -0.861  0.001

``` r
summary(glmm_temporal_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83031.9  83095.2 -41509.0  83017.9    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5247 -0.8630 -0.6885  1.0675  1.8677 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.004198 0.06479 
    ##  lab     (Intercept) 0.054289 0.23300 
    ##  item    (Intercept) 0.017809 0.13345 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.007761   0.076044  -0.102    0.919    
    ## conditiondistant   -0.444940   0.041113 -10.822   <2e-16 ***
    ## d                  -0.049264   0.080644  -0.611    0.541    
    ## conditiondistant:d -0.023506   0.045647  -0.515    0.607    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.272              
    ## d           -0.870  0.259       
    ## cndtndstnt:  0.247 -0.910 -0.284

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
    ## glmm_spatial_bif_base    5 83456 83501 -41723    83446                     
    ## glmm_spatial_bif_val     6 83458 83512 -41723    83446 0.0482  1     0.8261
    ## glmm_spatial_bif_int     7 83459 83522 -41722    83445 0.9439  1     0.3313

``` r
summary(glmm_spatial_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83455.7  83500.9 -41722.8  83445.7    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5755 -0.8867 -0.6897  1.0372  1.9000 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.01717  0.1310  
    ##  lab     (Intercept) 0.05951  0.2439  
    ##  item    (Intercept) 0.01134  0.1065  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.03674    0.03469   1.059     0.29    
    ## conditiondistant -0.49501    0.01764 -28.062   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.248

``` r
summary(glmm_spatial_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83457.6  83511.8 -41722.8  83445.6    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5758 -0.8867 -0.6897  1.0373  1.8992 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.01717  0.1310  
    ##  lab     (Intercept) 0.05950  0.2439  
    ##  item    (Intercept) 0.01131  0.1064  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.04812    0.06236   0.772    0.440    
    ## conditiondistant -0.49501    0.01764 -28.061   <2e-16 ***
    ## d                -0.01386    0.06316  -0.219    0.826    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.138       
    ## d           -0.831  0.000

``` r
summary(glmm_spatial_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83458.7  83521.9 -41722.4  83444.7    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5707 -0.8866 -0.6893  1.0368  1.8901 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.01717  0.1310  
    ##  lab     (Intercept) 0.05951  0.2439  
    ##  item    (Intercept) 0.01131  0.1063  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         0.030440   0.064932   0.469    0.639    
    ## conditiondistant   -0.458690   0.041332 -11.098   <2e-16 ***
    ## d                   0.007672   0.066907   0.115    0.909    
    ## conditiondistant:d -0.044277   0.045575  -0.972    0.331    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.310              
    ## d           -0.845  0.300       
    ## cndtndstnt:  0.280 -0.904 -0.332

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
    ## glmm_social_bif_base    5 83957 84002 -41974    83947                     
    ## glmm_social_bif_val     6 83959 84013 -41974    83947 0.0131  1     0.9088
    ## glmm_social_bif_int     7 83961 84024 -41974    83947 0.0661  1     0.7971

``` r
summary(glmm_social_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83957.2  84002.4 -41973.6  83947.2    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3976 -0.8944 -0.7242  1.0409  1.7576 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.006024 0.07761 
    ##  lab     (Intercept) 0.039681 0.19920 
    ##  item    (Intercept) 0.006399 0.08000 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.02607    0.02815   0.926    0.354    
    ## conditiondistant -0.46347    0.01698 -27.294   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.289

``` r
summary(glmm_social_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83959.2  84013.4 -41973.6  83947.2    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3977 -0.8944 -0.7241  1.0410  1.7567 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.006024 0.07761 
    ##  lab     (Intercept) 0.039681 0.19920 
    ##  item    (Intercept) 0.006395 0.07997 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.030747   0.049557   0.620    0.535    
    ## conditiondistant -0.463467   0.016980 -27.295   <2e-16 ***
    ## d                -0.005696   0.049723  -0.115    0.909    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.164       
    ## d           -0.823  0.000

``` r
summary(glmm_social_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83961.1  84024.3 -41973.6  83947.1    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.3983 -0.8941 -0.7241  1.0412  1.7614 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.006024 0.07762 
    ##  lab     (Intercept) 0.039680 0.19920 
    ##  item    (Intercept) 0.006396 0.07997 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         0.03533    0.05269   0.670    0.503    
    ## conditiondistant   -0.47306    0.04097 -11.545   <2e-16 ***
    ## d                  -0.01127    0.05428  -0.208    0.835    
    ## conditiondistant:d  0.01169    0.04545   0.257    0.797    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.371              
    ## d           -0.845  0.364       
    ## cndtndstnt:  0.338 -0.910 -0.400

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
    ## glmm_likelihood_bif_base    5 83366 83412 -41678    83356                     
    ## glmm_likelihood_bif_val     6 83368 83423 -41678    83356 0.0917  1     0.7620
    ## glmm_likelihood_bif_int     7 83370 83433 -41678    83356 0.4211  1     0.5164

``` r
summary(glmm_likelihood_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83366.4  83411.6 -41678.2  83356.4    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4089 -0.8709 -0.7072  1.0596  1.9197 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.013931 0.11803 
    ##  lab     (Intercept) 0.055373 0.23532 
    ##  item    (Intercept) 0.006958 0.08341 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.03234    0.03137  -1.031    0.303    
    ## conditiondistant -0.45839    0.01746 -26.260   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.272

``` r
summary(glmm_likelihood_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83368.3  83422.5 -41678.2  83356.3    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4077 -0.8709 -0.7073  1.0597  1.9201 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.013931 0.11803 
    ##  lab     (Intercept) 0.055373 0.23531 
    ##  item    (Intercept) 0.006926 0.08322 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.01956    0.05252  -0.372    0.710    
    ## conditiondistant -0.45839    0.01746 -26.261   <2e-16 ***
    ## d                -0.01558    0.05137  -0.303    0.762    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.163       
    ## d           -0.802  0.000

``` r
summary(glmm_likelihood_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83369.9  83433.1 -41677.9  83355.9    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4019 -0.8708 -0.7074  1.0596  1.9177 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.013933 0.11804 
    ##  lab     (Intercept) 0.055374 0.23532 
    ##  item    (Intercept) 0.006925 0.08321 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.00770    0.05563  -0.138    0.890    
    ## conditiondistant   -0.48266    0.04128 -11.693   <2e-16 ***
    ## d                  -0.03004    0.05602  -0.536    0.592    
    ## conditiondistant:d  0.02958    0.04560   0.649    0.516    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.363              
    ## d           -0.826  0.361       
    ## cndtndstnt:  0.329 -0.906 -0.398
