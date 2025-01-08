CLIMR Supplemental Analysis Report: Spatial Distance Online Location
Check Failures Removed
================
CLIMR Team
2025-01-07

# Primary Analysis

``` r
meta_spatial_loc
```

    ## 
    ## Random-Effects Model (k = 75; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0000 (SE = 0.0161)
    ## tau (square root of estimated tau^2 value):      0.0013
    ## I^2 (total heterogeneity / total variability):   0.00%
    ## H^2 (total variability / sampling variability):  1.00
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 74) = 75.7637, p-val = 0.4213
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval    ci.lb   ci.ub    
    ##   0.0588  0.0388  1.5153  0.1297  -0.0173  0.1349    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial_loc
```

    ##        diff    ci_lower  ci_upper
    ## 1 0.1577395 -0.04629101 0.3617701

# Comprehension Check Failures Removed

``` r
meta_spatial_loc_comp
```

    ## 
    ## Random-Effects Model (k = 75; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0028 (SE = 0.0223)
    ## tau (square root of estimated tau^2 value):      0.0530
    ## I^2 (total heterogeneity / total variability):   1.83%
    ## H^2 (total variability / sampling variability):  1.02
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 74) = 80.2545, p-val = 0.2895
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval    ci.lb   ci.ub    
    ##   0.0552  0.0452  1.2208  0.2222  -0.0334  0.1438    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial_loc_comp
```

    ##        diff    ci_lower  ci_upper
    ## 1 0.1495619 -0.09055671 0.3896806

# Modality Moderation

``` r
meta_spatial_loc_mode_Q$QM
```

    ## [1] 0.2075604

``` r
meta_spatial_loc_mode_Q$QMp
```

    ## [1] 0.6486863

``` r
meta_spatial_loc_mode
```

    ## 
    ## Mixed-Effects Model (k = 75; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0000 (SE = 0.0163)
    ## tau (square root of estimated tau^2 value):             0.0009
    ## I^2 (residual heterogeneity / unaccounted variability): 0.00%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 73) = 75.5561, p-val = 0.3958
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 2.5036, p-val = 0.2860
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval    ci.lb   ci.ub    
    ## modalitylab       0.0475  0.0462  1.0277  0.3041  -0.0430  0.1379    
    ## modalityonline    0.0863  0.0718  1.2031  0.2289  -0.0543  0.2270    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Spatial distance manipulation check

``` r
meta_mc_spatial
```

    ## 
    ## Random-Effects Model (k = 78; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.1588 (SE = 0.0490)
    ## tau (square root of estimated tau^2 value):      0.3985
    ## I^2 (total heterogeneity / total variability):   54.57%
    ## H^2 (total variability / sampling variability):  2.20
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 77) = 175.8486, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval   ci.lb   ci.ub      
    ##   1.2228  0.0634  19.2901  <.0001  1.0986  1.3471  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
