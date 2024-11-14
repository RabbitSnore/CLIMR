CLIMR Supplemental Analysis Report: Spatial Distance Online Location
Check Failures Removed
================
CLIMR Team
2024-11-08

# Primary Analysis

``` r
meta_spatial_loc
```

    ## 
    ## Random-Effects Model (k = 75; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0000 (SE = 0.0160)
    ## tau (square root of estimated tau^2 value):      0.0021
    ## I^2 (total heterogeneity / total variability):   0.00%
    ## H^2 (total variability / sampling variability):  1.00
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 74) = 74.2484, p-val = 0.4700
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval    ci.lb   ci.ub    
    ##   0.0543  0.0388  1.4009  0.1612  -0.0217  0.1303    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial_loc
```

    ##        diff    ci_lower ci_upper
    ## 1 0.1457853 -0.05818138 0.349752

# Comprehension Check Failures Removed

``` r
meta_spatial_loc_comp
```

    ## 
    ## Random-Effects Model (k = 75; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0008 (SE = 0.0218)
    ## tau (square root of estimated tau^2 value):      0.0283
    ## I^2 (total heterogeneity / total variability):   0.53%
    ## H^2 (total variability / sampling variability):  1.01
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 74) = 79.6390, p-val = 0.3062
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval    ci.lb   ci.ub    
    ##   0.0520  0.0448  1.1608  0.2457  -0.0358  0.1398    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial_loc_comp
```

    ##        diff    ci_lower  ci_upper
    ## 1 0.1409837 -0.09707043 0.3790378

# Modality Moderation

``` r
meta_spatial_loc_mode_Q$QM
```

    ## [1] 0.02221284

``` r
meta_spatial_loc_mode_Q$QMp
```

    ## [1] 0.8815223

``` r
meta_spatial_loc_mode
```

    ## 
    ## Mixed-Effects Model (k = 75; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0000 (SE = 0.0163)
    ## tau (square root of estimated tau^2 value):             0.0015
    ## I^2 (residual heterogeneity / unaccounted variability): 0.00%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 73) = 74.2262, p-val = 0.4380
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 1.9847, p-val = 0.3707
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval    ci.lb   ci.ub    
    ## modalitylab       0.0508  0.0455  1.1156  0.2646  -0.0384  0.1400    
    ## modalityonline    0.0637  0.0741  0.8604  0.3896  -0.0815  0.2089    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Spatial distance manipulation check

``` r
meta_mc_spatial
```

    ## 
    ## Random-Effects Model (k = 76; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.1786 (SE = 0.0544)
    ## tau (square root of estimated tau^2 value):      0.4226
    ## I^2 (total heterogeneity / total variability):   56.18%
    ## H^2 (total variability / sampling variability):  2.28
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 75) = 176.2363, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval   ci.lb   ci.ub      
    ##   1.2120  0.0673  18.0191  <.0001  1.0802  1.3438  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
