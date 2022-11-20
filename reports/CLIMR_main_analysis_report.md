Construal Level International Multilab Replication (CLIMR) Project: Main
Analysis Report
================
CLIMR Team
2022-11-18

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Main Figure

``` r
knitr::include_graphics("./figures/climr_main_figure.png")
```

![](./figures/climr_main_figure.png)<!-- -->

# Meta-Analytic Models

## Liberman & Trope (1998, Study 1)

``` r
meta_temporal
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0035 (SE = 0.0253)
    ## tau (square root of estimated tau^2 value):      0.0591
    ## I^2 (total heterogeneity / total variability):   1.97%
    ## H^2 (total variability / sampling variability):  1.02
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 104.0245, p-val = 0.3195
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3867  0.0424  9.1217  <.0001  0.3036  0.4697  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_temporal
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3621818 0.2843604 0.4400032

## Fujita et al. (2006, Study 1)

``` r
meta_spatial
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0000 (SE = 0.0248)
    ## tau (square root of estimated tau^2 value):      0.0012
    ## I^2 (total heterogeneity / total variability):   0.00%
    ## H^2 (total variability / sampling variability):  1.00
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 101.6272, p-val = 0.3808
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3900  0.0420  9.2902  <.0001  0.3077  0.4723  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3685364 0.2907855 0.4462874

## Social Distance (Paradigmatic Replication)

``` r
meta_social
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0 (SE = 0.0247)
    ## tau (square root of estimated tau^2 value):      0
    ## I^2 (total heterogeneity / total variability):   0.00%
    ## H^2 (total variability / sampling variability):  1.00
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 78.7518, p-val = 0.9234
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.4170  0.0419  9.9593  <.0001  0.3349  0.4991  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_social
```

    ##        diff ci_lower  ci_upper
    ## 1 0.3974787 0.319256 0.4757014

## Likelihood Distance (Paradigmatic Replication)

``` r
meta_likelihood
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0155 (SE = 0.0272)
    ## tau (square root of estimated tau^2 value):      0.1243
    ## I^2 (total heterogeneity / total variability):   8.11%
    ## H^2 (total variability / sampling variability):  1.09
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 110.0849, p-val = 0.1902
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval   ci.lb   ci.ub      
    ##   0.4387  0.0439  10.0004  <.0001  0.3528  0.5247  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_likelihood
```

    ##        diff  ci_lower ci_upper
    ## 1 0.3996217 0.3213004 0.477943

# Arboretum

``` r
knitr::include_graphics("./figures/climr_arboretum.png")
```

![](./figures/climr_arboretum.png)<!-- -->
