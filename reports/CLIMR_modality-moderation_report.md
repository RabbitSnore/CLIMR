CLIMR Supplemental Analysis Report: Online vs. In-Lab Modality
================
CLIMR Team
2025-02-03

# Meta-Analytic Models

## Liberman et al (1998, Study 1)

``` r
meta_temporal_mode_Q$QM
```

    ## [1] 0.1744949

``` r
meta_temporal_mode_Q$QMp
```

    ## [1] 0.6761476

``` r
meta_temporal_mode
```

    ## 
    ## Mixed-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0134 (SE = 0.0229)
    ## tau (square root of estimated tau^2 value):             0.1156
    ## I^2 (residual heterogeneity / unaccounted variability): 8.52%
    ## H^2 (unaccounted variability / sampling variability):   1.09
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 77) = 93.7847, p-val = 0.0938
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 3.4847, p-val = 0.1751
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval    ci.lb   ci.ub    
    ## modalitylab       0.0952  0.0549  1.7358  0.0826  -0.0123  0.2028  . 
    ## modalityonline    0.0538  0.0783  0.6869  0.4921  -0.0996  0.2072    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Fujita et al. (2006, Study 1)

``` r
meta_spatial_mode_Q$QM
```

    ## [1] 0.01313943

``` r
meta_spatial_mode_Q$QMp
```

    ## [1] 0.9087405

``` r
meta_spatial_mode
```

    ## 
    ## Mixed-Effects Model (k = 77; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0000 (SE = 0.0153)
    ## tau (square root of estimated tau^2 value):             0.0026
    ## I^2 (residual heterogeneity / unaccounted variability): 0.01%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 75) = 71.5574, p-val = 0.5913
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 1.4192, p-val = 0.4918
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval    ci.lb   ci.ub    
    ## modalitylab       0.0475  0.0462  1.0277  0.3041  -0.0430  0.1380    
    ## modalityonline    0.0384  0.0638  0.6025  0.5469  -0.0866  0.1634    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Social Distance

``` r
meta_social_mode_Q$QM
```

    ## [1] 2.719788

``` r
meta_social_mode_Q$QMp
```

    ## [1] 0.09911117

``` r
meta_social_mode
```

    ## 
    ## Mixed-Effects Model (k = 77; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0095 (SE = 0.0181)
    ## tau (square root of estimated tau^2 value):             0.0975
    ## I^2 (residual heterogeneity / unaccounted variability): 7.80%
    ## H^2 (unaccounted variability / sampling variability):   1.08
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 75) = 82.2849, p-val = 0.2641
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 46.3635, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se     zval    pval    ci.lb    ci.ub      
    ## modalitylab      -0.3114  0.0490  -6.3534  <.0001  -0.4075  -0.2153  *** 
    ## modalityonline   -0.1708  0.0697  -2.4491  0.0143  -0.3075  -0.0341    * 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Likelihood

``` r
meta_likelihood_mode_Q$QM
```

    ## [1] 0.4263143

``` r
meta_likelihood_mode_Q$QMp
```

    ## [1] 0.513803

``` r
meta_likelihood_mode
```

    ## 
    ## Mixed-Effects Model (k = 76; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0113 (SE = 0.0182)
    ## tau (square root of estimated tau^2 value):             0.1064
    ## I^2 (residual heterogeneity / unaccounted variability): 9.37%
    ## H^2 (unaccounted variability / sampling variability):   1.10
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 74) = 87.6706, p-val = 0.1324
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 0.7023, p-val = 0.7039
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval    ci.lb   ci.ub    
    ## modalitylab       0.0026  0.0493  0.0521  0.9585  -0.0941  0.0992    
    ## modalityonline    0.0583  0.0697  0.8364  0.4029  -0.0784  0.1950    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
