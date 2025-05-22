CLIMR Supplemental Analysis Report: Comprehension Check Failures Removed
================
CLIMR Team
2025-05-22

# Meta-Analytic Models

## Liberman et al (1998, Study 1)

``` r
meta_temporal_comp
```

    ## 
    ## Random-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0105 (SE = 0.0220)
    ## tau (square root of estimated tau^2 value):      0.1023
    ## I^2 (total heterogeneity / total variability):   6.85%
    ## H^2 (total variability / sampling variability):  1.07
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 78) = 93.9604, p-val = 0.1052
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval    ci.lb   ci.ub    
    ##   0.0828  0.0444  1.8643  0.0623  -0.0042  0.1698  . 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_temporal_comp
```

    ##        diff   ci_lower  ci_upper
    ## 1 0.3292014 -0.0168845 0.6752874

## Fujita et al. (2006, Study 1)

``` r
meta_spatial_comp
```

    ## 
    ## Random-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0081 (SE = 0.0219)
    ## tau (square root of estimated tau^2 value):      0.0899
    ## I^2 (total heterogeneity / total variability):   5.33%
    ## H^2 (total variability / sampling variability):  1.06
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 78) = 77.6686, p-val = 0.4893
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval    ci.lb   ci.ub    
    ##   0.0404  0.0441  0.9165  0.3594  -0.0460  0.1268    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial_comp
```

    ##        diff   ci_lower  ci_upper
    ## 1 0.1101206 -0.1253803 0.3456215

## Social Distance

``` r
meta_social_comp
```

    ## 
    ## Random-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0182 (SE = 0.0205)
    ## tau (square root of estimated tau^2 value):      0.1349
    ## I^2 (total heterogeneity / total variability):   13.29%
    ## H^2 (total variability / sampling variability):  1.15
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 78) = 93.3626, p-val = 0.1131
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval    ci.lb    ci.ub      
    ##  -0.2545  0.0423  -6.0098  <.0001  -0.3375  -0.1715  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_social_comp
```

    ##        diff  ci_lower   ci_upper
    ## 1 -1.308209 -1.734853 -0.8815642

## Likelihood Distance

``` r
meta_likelihood_comp
```

    ## 
    ## Random-Effects Model (k = 78; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0168 (SE = 0.0227)
    ## tau (square root of estimated tau^2 value):      0.1298
    ## I^2 (total heterogeneity / total variability):   11.00%
    ## H^2 (total variability / sampling variability):  1.12
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 77) = 92.4393, p-val = 0.1108
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval    ci.lb   ci.ub    
    ##   0.0432  0.0450  0.9603  0.3369  -0.0449  0.1313    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_likelihood_comp
```

    ##         diff    ci_lower  ci_upper
    ## 1 0.08809769 -0.09170486 0.2679003
