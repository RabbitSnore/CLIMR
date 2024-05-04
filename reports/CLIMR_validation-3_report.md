Construal Level International Multilab Replication (CLIMR) Project:
Linguistic Concreteness Validation
================
CLIMR Team
2024-05-04

These validations are documented here: <https://osf.io/kgrs9/>

Previous relevant analyses by the Puddle-Ducks can be found here:
<https://www.rabbitsnore.com/2019/02/there-might-be-problems-with-automated.html>

# Linguistic Measures of Concreteness/Abstraction

## Standarized mean differences

``` r
d_folk
```

    ##                  ID        d         var  ci_lower ci_upper
    ## 1 Folk Concreteness 1.001557 0.001493545 0.9257806 1.077333

``` r
d_lcm
```

    ##    ID           d         var   ci_lower    ci_upper
    ## 1 LCM -0.06532858 0.001328546 -0.1367964 0.006139257

``` r
d_lcm_pd
```

    ##               ID         d         var  ci_lower  ci_upper
    ## 1 LCM (Modified) 0.2374944 0.001337186 0.1657946 0.3091943

``` r
knitr::include_graphics("./figures/climr_linguistic-measure-swarm_figure.png")
```

<img src="./figures/climr_linguistic-measure-swarm_figure.png" width="3000" />

## Linear mixed effects models

``` r
summary(lmer_folk)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
    ## Formula: concreteness ~ 1 + distance + (1 | ResponseId) + (1 + distance |      item)
    ##    Data: linguistic_long
    ## Control: lmerControl(optimizer = "nlminbwrap")
    ## 
    ## REML criterion at convergence: 282.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.1952 -0.5772 -0.0648  0.5064  8.6797 
    ## 
    ## Random effects:
    ##  Groups     Name        Variance Std.Dev. Corr 
    ##  ResponseId (Intercept) 0.021201 0.14560       
    ##  item       (Intercept) 0.009187 0.09585       
    ##             distancec   0.009017 0.09496  -0.71
    ##  Residual               0.053616 0.23155       
    ## Number of obs: 3020, groups:  ResponseId, 302; item, 10
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  2.60347    0.03297 11.70295  78.972  < 2e-16 ***
    ## distancec    0.28551    0.03542 14.90050   8.061  8.2e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr)
    ## distancec -0.700

``` r
summary(lmer_lcm)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
    ## Formula: lcm ~ 1 + distance + (1 | ResponseId) + (1 + distance | item)
    ##    Data: linguistic_long
    ## Control: lmerControl(optimizer = "bobyqa")
    ## 
    ## REML criterion at convergence: 4893.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.2393 -0.5763  0.0099  0.5781  3.8898 
    ## 
    ## Random effects:
    ##  Groups     Name        Variance Std.Dev. Corr
    ##  ResponseId (Intercept) 0.03149  0.1775       
    ##  item       (Intercept) 0.02015  0.1419       
    ##             distancec   0.07940  0.2818   0.02
    ##  Residual               0.26793  0.5176       
    ## Number of obs: 3019, groups:  ResponseId, 302; item, 10
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  3.20939    0.04882 10.70782  65.733 2.63e-15 ***
    ## distancec    0.03896    0.09335  9.92756   0.417    0.685    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr)
    ## distancec -0.062

``` r
summary(lmer_lcm_pd)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
    ## Formula: lcm_pd ~ 1 + distance + (1 | ResponseId) + (1 + distance | item)
    ##    Data: linguistic_long
    ## Control: lmerControl(optimizer = "nlminbwrap")
    ## 
    ## REML criterion at convergence: 3842.3
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.7776 -0.5974 -0.0246  0.5806  5.8059 
    ## 
    ## Random effects:
    ##  Groups     Name        Variance Std.Dev. Corr 
    ##  ResponseId (Intercept) 0.02212  0.1487        
    ##  item       (Intercept) 0.01339  0.1157        
    ##             distancec   0.04321  0.2079   -0.37
    ##  Residual               0.18945  0.4353        
    ## Number of obs: 3019, groups:  ResponseId, 302; item, 10
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  1.41625    0.03999 10.79991  35.418 1.61e-12 ***
    ## distancec   -0.11499    0.06976 10.18888  -1.648     0.13    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr)
    ## distancec -0.410

# Additional LCM Analyses

## Effect for Activities Only

``` r
d_lcm_ac
```

    ##   ID         d         var  ci_lower  ci_upper
    ## 1  1 0.3306758 0.002692923 0.2288849 0.4324667

``` r
summary(lmer_lcm_ac)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
    ## Formula: lcm ~ 1 + distance + (1 | ResponseId) + (1 + distance | item)
    ##    Data: linguistic_long %>% filter(type == "ac")
    ## Control: lmerControl(optimizer = "bobyqa")
    ## 
    ## REML criterion at convergence: 2390.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9210 -0.5842  0.0135  0.5878  3.9114 
    ## 
    ## Random effects:
    ##  Groups     Name        Variance Std.Dev. Corr 
    ##  ResponseId (Intercept) 0.027623 0.16620       
    ##  item       (Intercept) 0.004477 0.06691       
    ##             distancec   0.045080 0.21232  -0.96
    ##  Residual               0.258197 0.50813       
    ## Number of obs: 1509, groups:  ResponseId, 302; item, 5
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  3.17796    0.03738  5.21296  85.021 2.15e-09 ***
    ## distancec   -0.17931    0.10034  4.30745  -1.787    0.143    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr)
    ## distancec -0.863

## Effect for Activities Only (Modified Puddle-Ducks Version)

``` r
d_lcm_pd_ac
```

    ##   ID         d         var  ci_lower ci_upper
    ## 1  1 0.5442957 0.002754937 0.4413394 0.647252

``` r
summary(lmer_lcm_pd_ac)
```

    ## Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
    ## Formula: lcm_pd ~ 1 + distance + (1 | ResponseId) + (1 + distance | item)
    ##    Data: linguistic_long %>% filter(type == "ac")
    ## Control: lmerControl(optimizer = "nlminbwrap")
    ## 
    ## REML criterion at convergence: 1677.1
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2517 -0.5752 -0.0427  0.5876  5.8140 
    ## 
    ## Random effects:
    ##  Groups     Name        Variance Std.Dev. Corr 
    ##  ResponseId (Intercept) 0.027877 0.16696       
    ##  item       (Intercept) 0.022905 0.15134       
    ##             distancec   0.004615 0.06794  -0.41
    ##  Residual               0.153302 0.39154       
    ## Number of obs: 1509, groups:  ResponseId, 302; item, 5
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error       df t value Pr(>|t|)    
    ## (Intercept)  1.46616    0.07037  4.30069   20.84 1.75e-05 ***
    ## distancec   -0.24164    0.04124  6.50514   -5.86 0.000816 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##           (Intr)
    ## distancec -0.416

# Summary of Validations Studies

``` r
validation_plot_data
```

    ##                         ID           d         var   ci_lower    ci_upper
    ## 1                      BIF  1.41884331 0.011898202  1.2044363 1.633250369
    ## 2           Categorization  0.08676957 0.003846699 -0.0349298 0.208468953
    ## 3             Segmentation  0.06592508 0.009921950 -0.1298945 0.261744651
    ## 4  Quantity Estimation (a) -0.08105716 0.016210130 -0.3318366 0.169722320
    ## 5  Quantity Estimation (b)  0.09970903 0.016549638 -0.1537092 0.353127287
    ## 6        Length Estimation  0.09718508 0.016756621 -0.1578293 0.352199495
    ## 7   Spillover Effect (BIF) -0.01850364 0.007171503 -0.1844826 0.147475375
    ## 8        Folk Concreteness  1.00155660 0.001493545  0.9257806 1.077332551
    ## 9                      LCM -0.06532858 0.001328546 -0.1367964 0.006139257
    ## 10          LCM (Modified)  0.23749445 0.001337186  0.1657946 0.309194301

``` r
knitr::include_graphics("./figures/climr_validation_plot.png")
```

<img src="./figures/climr_validation_plot.png" width="2700" />
