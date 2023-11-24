Construal Level International Multilab Replication (CLIMR) Project: Main
Analysis Report
================
CLIMR Team
2023-11-24

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Main Figure

``` r
knitr::include_graphics("./figures/climr_main_figure.png")
```

<img src="./figures/climr_main_figure.png" width="2400" />

# Meta-Analytic Models

## Liberman & Trope (1998, Study 1)

``` r
meta_temporal
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0137 (SE = 0.0270)
    ## tau (square root of estimated tau^2 value):      0.1171
    ## I^2 (total heterogeneity / total variability):   7.25%
    ## H^2 (total variability / sampling variability):  1.08
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 109.8505, p-val = 0.1944
    ## 
    ## Model Results:
    ## 
    ## estimate      se     zval    pval   ci.lb   ci.ub      
    ##   0.4424  0.0437  10.1161  <.0001  0.3567  0.5281  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_temporal
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.4240129 0.3418614 0.5061643

## Fujita et al. (2006, Study 1)

``` r
meta_spatial
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0438 (SE = 0.0313)
    ## tau (square root of estimated tau^2 value):      0.2093
    ## I^2 (total heterogeneity / total variability):   19.99%
    ## H^2 (total variability / sampling variability):  1.25
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 125.8551, p-val = 0.0305
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3918  0.0471  8.3216  <.0001  0.2995  0.4841  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_spatial
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3644014 0.2785753 0.4502275

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
    ## Q(df = 98) = 76.3939, p-val = 0.9480
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.4095  0.0418  9.7857  <.0001  0.3275  0.4915  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_social
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3965593 0.3171334 0.4759853

## Likelihood Distance (Paradigmatic Replication)

``` r
meta_likelihood
```

    ## 
    ## Random-Effects Model (k = 99; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of total heterogeneity): 0.0178 (SE = 0.0274)
    ## tau (square root of estimated tau^2 value):      0.1334
    ## I^2 (total heterogeneity / total variability):   9.26%
    ## H^2 (total variability / sampling variability):  1.10
    ## 
    ## Test for Heterogeneity:
    ## Q(df = 98) = 110.7803, p-val = 0.1780
    ## 
    ## Model Results:
    ## 
    ## estimate      se    zval    pval   ci.lb   ci.ub      
    ##   0.3975  0.0441  9.0232  <.0001  0.3112  0.4839  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
bt_likelihood
```

    ##        diff  ci_lower  ci_upper
    ## 1 0.3608352 0.2824564 0.4392139

# Arboretum

``` r
knitr::include_graphics("./figures/climr_arboretum.png")
```

<img src="./figures/climr_arboretum.png" width="5400" />
