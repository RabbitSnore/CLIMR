CLIMR Supplemental Analysis Report: Online vs. In-Lab Modality
================
CLIMR Team
2023-11-24

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Meta-Analytic Models

## Liberman et al (1998, Study 1)

``` r
meta_temporal_mode_Q$QM
```

    ## [1] 5.047981

``` r
meta_temporal_mode_Q$QMp
```

    ## [1] 0.02465464

``` r
meta_temporal_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0091 (SE = 0.0279)
    ## tau (square root of estimated tau^2 value):             0.0955
    ## I^2 (residual heterogeneity / unaccounted variability): 4.67%
    ## H^2 (unaccounted variability / sampling variability):   1.05
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 107.6472, p-val = 0.2161
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 98.9066, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub      
    ## modalitylab       0.3379  0.0656  5.1509  <.0001  0.2093  0.4665  *** 
    ## modalityonline    0.5133  0.0603  8.5073  <.0001  0.3951  0.6316  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Fujita et al. (2006, Study 1)

``` r
meta_spatial_mode_Q$QM
```

    ## [1] 0.8600948

``` r
meta_spatial_mode_Q$QMp
```

    ## [1] 0.3537122

``` r
meta_spatial_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0437 (SE = 0.0314)
    ## tau (square root of estimated tau^2 value):             0.2090
    ## I^2 (residual heterogeneity / unaccounted variability): 19.93%
    ## H^2 (unaccounted variability / sampling variability):   1.25
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 124.7195, p-val = 0.0305
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 70.1517, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub      
    ## modalitylab       0.3434  0.0703  4.8819  <.0001  0.2055  0.4812  *** 
    ## modalityonline    0.4311  0.0634  6.8058  <.0001  0.3070  0.5553  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Social Distance

``` r
meta_social_mode_Q$QM
```

    ## [1] 1.16207

``` r
meta_social_mode_Q$QMp
```

    ## [1] 0.2810366

``` r
meta_social_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0 (SE = 0.0248)
    ## tau (square root of estimated tau^2 value):             0
    ## I^2 (residual heterogeneity / unaccounted variability): 0.00%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 75.2318, p-val = 0.9504
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 96.9227, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub      
    ## modalitylab       0.3594  0.0625  5.7471  <.0001  0.2368  0.4820  *** 
    ## modalityonline    0.4501  0.0563  7.9934  <.0001  0.3398  0.5605  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Likelihood

``` r
meta_likelihood_mode_Q$QM
```

    ## [1] 0.6099501

``` r
meta_likelihood_mode_Q$QMp
```

    ## [1] 0.4348066

``` r
meta_likelihood_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0187 (SE = 0.0277)
    ## tau (square root of estimated tau^2 value):             0.1367
    ## I^2 (residual heterogeneity / unaccounted variability): 9.68%
    ## H^2 (unaccounted variability / sampling variability):   1.11
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 110.1089, p-val = 0.1713
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 81.6846, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub      
    ## modalitylab       0.4353  0.0654  6.6533  <.0001  0.3071  0.5636  *** 
    ## modalityonline    0.3661  0.0598  6.1170  <.0001  0.2488  0.4834  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
