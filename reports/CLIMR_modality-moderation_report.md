CLIMR Supplemental Analysis Report: Online vs. In-Lab Modality
================
CLIMR Team
2024-11-28

# Meta-Analytic Models

## Liberman et al (1998, Study 1)

``` r
meta_temporal_mode_Q$QM
```

    ## [1] 0.05405519

``` r
meta_temporal_mode_Q$QMp
```

    ## [1] 0.8161515

``` r
meta_temporal_mode
```

    ## 
    ## Mixed-Effects Model (k = 79; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0134 (SE = 0.0230)
    ## tau (square root of estimated tau^2 value):             0.1157
    ## I^2 (residual heterogeneity / unaccounted variability): 8.53%
    ## H^2 (unaccounted variability / sampling variability):   1.09
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 77) = 93.9483, p-val = 0.0918
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 3.3172, p-val = 0.1904
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval    ci.lb   ci.ub    
    ## modalitylab       0.0860  0.0542  1.5881  0.1123  -0.0201  0.1922    
    ## modalityonline    0.0717  0.0804  0.8917  0.3725  -0.0859  0.2293    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Fujita et al. (2006, Study 1)

``` r
meta_spatial_mode_Q$QM
```

    ## [1] 0.06134941

``` r
meta_spatial_mode_Q$QMp
```

    ## [1] 0.8043757

``` r
meta_spatial_mode
```

    ## 
    ## Mixed-Effects Model (k = 77; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0000 (SE = 0.0154)
    ## tau (square root of estimated tau^2 value):             0.0018
    ## I^2 (residual heterogeneity / unaccounted variability): 0.00%
    ## H^2 (unaccounted variability / sampling variability):   1.00
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 75) = 71.5092, p-val = 0.5929
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 1.4674, p-val = 0.4801
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se    zval    pval    ci.lb   ci.ub    
    ## modalitylab       0.0508  0.0455  1.1156  0.2646  -0.0384  0.1400    
    ## modalityonline    0.0310  0.0656  0.4721  0.6368  -0.0977  0.1596    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Social Distance

``` r
meta_social_mode_Q$QM
```

    ## [1] 4.960906

``` r
meta_social_mode_Q$QMp
```

    ## [1] 0.02592662

``` r
meta_social_mode
```

    ## 
    ## Mixed-Effects Model (k = 77; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0068 (SE = 0.0175)
    ## tau (square root of estimated tau^2 value):             0.0822
    ## I^2 (residual heterogeneity / unaccounted variability): 5.67%
    ## H^2 (unaccounted variability / sampling variability):   1.06
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 75) = 79.9689, p-val = 0.3259
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 50.0969, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se     zval    pval    ci.lb    ci.ub      
    ## modalitylab      -0.3252  0.0477  -6.8110  <.0001  -0.4188  -0.2316  *** 
    ## modalityonline   -0.1356  0.0705  -1.9253  0.0542  -0.2737   0.0024    . 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Likelihood

``` r
meta_likelihood_mode_Q$QM
```

    ## [1] 0.8573304

``` r
meta_likelihood_mode_Q$QMp
```

    ## [1] 0.3544868

``` r
meta_likelihood_mode
```

    ## 
    ## Mixed-Effects Model (k = 76; tau^2 estimator: REML)
    ## 
    ## tau^2 (estimated amount of residual heterogeneity):     0.0105 (SE = 0.0180)
    ## tau (square root of estimated tau^2 value):             0.1024
    ## I^2 (residual heterogeneity / unaccounted variability): 8.74%
    ## H^2 (unaccounted variability / sampling variability):   1.10
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 74) = 87.1923, p-val = 0.1401
    ## 
    ## Test of Moderators (coefficients 1:2):
    ## QM(df = 2) = 1.1374, p-val = 0.5663
    ## 
    ## Model Results:
    ## 
    ##                 estimate      se     zval    pval    ci.lb   ci.ub    
    ## modalitylab      -0.0041  0.0485  -0.0839  0.9332  -0.0991  0.0910    
    ## modalityonline    0.0757  0.0712   1.0632  0.2877  -0.0638  0.2152    
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
