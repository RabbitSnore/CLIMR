CLIMR Supplemental Analysis Report: Comprehension Check Failures Removed
================
CLIMR Team
2023-11-24

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Meta-Analytic Models

## Liberman et al (1998, Study 1)

``` r
meta_temporal_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0162 (SE = 0.0288)
    ## tau (square root of estimated tau^2 value):      0.1274
    ## I^2 (total heterogeneity / total variability):   8.02%
    ## H^2 (total variability / sampling variability):  1.09
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 111.7298, p-val = 0.1622
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.4340  0.0452  9.5967  <.0001  0.3453  0.5226  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_temporal_comp
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.4188009 0.3332681 0.5043337

## Fujita et al. (2006, Study 1)

``` r
meta_spatial_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0504 (SE = 0.0335)
    ## tau (square root of estimated tau^2 value):      0.2246
    ## I^2 (total heterogeneity / total variability):   21.47%
    ## H^2 (total variability / sampling variability):  1.27
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 127.6299, p-val = 0.0238
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3865  0.0487  7.9287  <.0001  0.2909  0.4820  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial_comp
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3592849 0.2704697 0.4481002

## Social Distance

``` r
meta_social_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0 (SE = 0.0261)
    ## tau (square root of estimated tau^2 value):      0
    ## I^2 (total heterogeneity / total variability):   0.00%
    ## H^2 (total variability / sampling variability):  1.00
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 76.2680, p-val = 0.9491
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.4119  0.0431  9.5619  <.0001  0.3275  0.4964  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_social_comp
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.4001186 0.3181037 0.4821335

## Likelihood Distance

``` r
meta_likelihood_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0073 (SE = 0.0273)
    ## tau (square root of estimated tau^2 value):      0.0856
    ## I^2 (total heterogeneity / total variability):   3.82%
    ## H^2 (total variability / sampling variability):  1.04
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 106.1728, p-val = 0.2691
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3978  0.0440  9.0330  <.0001  0.3115  0.4841  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_likelihood_comp
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3593435 0.2813736 0.4373133
