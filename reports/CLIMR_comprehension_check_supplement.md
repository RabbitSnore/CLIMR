CLIMR Supplemental Analysis Report: Comprehension Check Failures Removed
================
CLIMR Team
2022-11-17

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Meta-Analytic Models

## Liberman et al (1998, Study 1)

``` r
meta_temporal_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0026 (SE = 0.0267)
    ## tau (square root of estimated tau^2 value):      0.0508
    ## I^2 (total heterogeneity / total variability):   1.38%
    ## H^2 (total variability / sampling variability):  1.01
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 103.8297, p-val = 0.3243
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3942  0.0435  9.0543  <.0001  0.3089  0.4796  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_temporal_comp
```

    ##        diff  ci_lower ci_upper
    ## 1 0.3717451 0.2912741 0.452216

## Fujita et al. (2006, Study 1)

``` r
meta_spatial_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0078 (SE = 0.0273)
    ## tau (square root of estimated tau^2 value):      0.0884
    ## I^2 (total heterogeneity / total variability):   4.07%
    ## H^2 (total variability / sampling variability):  1.04
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 111.3257, p-val = 0.1688
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3970  0.0440  9.0176  <.0001  0.3107  0.4832  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial_comp
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3754186 0.2938218 0.4570155

## Social Distance

``` r
meta_social_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0 (SE = 0.0262)
    ## tau (square root of estimated tau^2 value):      0
    ## I^2 (total heterogeneity / total variability):   0.00%
    ## H^2 (total variability / sampling variability):  1.00
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 84.4963, p-val = 0.8326
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.4113  0.0431  9.5380  <.0001  0.3268  0.4958  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_social_comp
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3941241 0.3131356 0.4751125

## Likelihood Distance

``` r
meta_likelihood_comp
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0126 (SE = 0.0282)
    ## tau (square root of estimated tau^2 value):      0.1123
    ## I^2 (total heterogeneity / total variability):   6.36%
    ## H^2 (total variability / sampling variability):  1.07
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 109.2699, p-val = 0.2052
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.4349  0.0447  9.7204  <.0001  0.3472  0.5225  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_likelihood_comp
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3938351 0.3144247 0.4732454
