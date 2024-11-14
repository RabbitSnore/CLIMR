CLIMR Supplemental Analysis Report: Manipulation Checks
================
CLIMR Team
2024-11-08

# Meta-Analytic Models

## Liberman & Trope (1998, Study 1)

``` r
meta_mc_temporal
```

    ## 
    ## Random-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0450 (SE = 0.0269)
    ## tau (square root of estimated tau^2 value):      0.2120
    ## I^2 (total heterogeneity / total variability):   26.51%
    ## H^2 (total variability / sampling variability):  1.36
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 78) = 109.8425, p-val = 0.0102
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval   ci.lb   ci.ub      
    ##   0.9780  0.0478  20.4746  <.0001  0.8844  1.0716  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Fujita et al. (2006, Study 1)

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

## Social Distance (Paradigmatic Replication)

``` r
meta_mc_social
```

    ## 
    ## Random-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.1550 (SE = 0.0506)
    ## tau (square root of estimated tau^2 value):      0.3936
    ## I^2 (total heterogeneity / total variability):   51.15%
    ## H^2 (total variability / sampling variability):  2.05
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 78) = 160.3945, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval   ci.lb   ci.ub      
    ##   1.5804  0.0643  24.5714  <.0001  1.4543  1.7065  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Likelihood Distance (Paradigmatic Replication)

``` r
meta_mc_likelihood
```

    ## 
    ## Random-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.3726 (SE = 0.0912)
    ## tau (square root of estimated tau^2 value):      0.6104
    ## I^2 (total heterogeneity / total variability):   69.38%
    ## H^2 (total variability / sampling variability):  3.27
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 78) = 241.2668, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval   ci.lb   ci.ub      
    ##   1.9762  0.0858  23.0226  <.0001  1.8080  2.1445  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
