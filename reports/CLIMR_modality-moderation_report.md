CLIMR Supplemental Analysis Report: Online vs. In-Lab Modality
================
CLIMR Team
2022-12-18

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Meta-Analytic Models

## Liberman et al (1998, Study 1)

``` r
meta_temporal_mode_Q$QM
```

    ## [1] 2.728333

``` r
meta_temporal_mode_Q$QMp
```

    ## [1] 0.09858212

``` r
meta_temporal_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0002 (SE = 0.0265)
    ## tau (square root of estimated tau^2 value):             0.0154
    ## I^2 (residual heterogeneity / unaccounted variability): 0.13%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 101.5412, p-val = 0.3561
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 85.2248, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub     ​ 
    ## modalitylab       0.4658  0.0643  7.2497  <.0001  0.3399  0.5918  *** 
    ## modalityonline    0.3345  0.0585  5.7155  <.0001  0.2198  0.4491  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Fujita et al. (2006, Study 1)

``` r
meta_spatial_mode_Q$QM
```

    ## [1] 0.7903453

``` r
meta_spatial_mode_Q$QMp
```

    ## [1] 0.3739957

``` r
meta_spatial_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0000 (SE = 0.0250)
    ## tau (square root of estimated tau^2 value):             0.0018
    ## I^2 (residual heterogeneity / unaccounted variability): 0.00%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 100.8369, p-val = 0.3746
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 87.0965, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub     ​ 
    ## modalitylab       0.4318  0.0630  6.8504  <.0001  0.3083  0.5554  *** 
    ## modalityonline    0.3567  0.0563  6.3378  <.0001  0.2464  0.4670  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Social Distance

``` r
meta_social_mode_Q$QM
```

    ## [1] 0.9317324

``` r
meta_social_mode_Q$QMp
```

    ## [1] 0.3344132

``` r
meta_social_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0 (SE = 0.0249)
    ## tau (square root of estimated tau^2 value):             0
    ## I^2 (residual heterogeneity / unaccounted variability): 0.00%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 77.8200, p-val = 0.9238
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 100.1196, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub     ​ 
    ## modalitylab       0.4622  0.0628  7.3588  <.0001  0.3391  0.5853  *** 
    ## modalityonline    0.3808  0.0562  6.7800  <.0001  0.2707  0.4909  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Likelihood

``` r
meta_likelihood_mode_Q$QM
```

    ## [1] 0.2533964

``` r
meta_likelihood_mode_Q$QMp
```

    ## [1] 0.6146936

``` r
meta_likelihood_mode
```

    ## 
    ## Mixed-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0170 (SE = 0.0275)
    ## tau (square root of estimated tau^2 value):             0.1303
    ## I^2 (residual heterogeneity / unaccounted variability): 8.84%
    ## H^2 (unaccounted variability / sampling variability):   1.10
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 97) = 109.8050, p-val = 0.1764
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 99.5107, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval   ci.lb   ci.ub     ​ 
    ## modalitylab       0.4147  0.0651  6.3723  <.0001  0.2872  0.5423  *** 
    ## modalityonline    0.4592  0.0598  7.6749  <.0001  0.3420  0.5765  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
