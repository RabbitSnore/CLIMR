Construal Level International Multilab Replication (CLIMR) Project:
Interval Estimate Validation Report
================
CLIMR Team
2022-12-06

These validations are documented here: <https://osf.io/kgrs9/>

# Krüger et al. (2014) Study 4, close replication

``` r
effect_fruit_close
```

    ##                        ID           d        var   ci_lower  ci_upper
    ## 1 Quantity Estimation (a) -0.08105716 0.01621013 -0.3318366 0.1697223

## BIF Effect

``` r
effect_fruit_close_bif
```

    ##   ID           d        var   ci_lower  ci_upper
    ## 1  1 -0.03089108 0.01613202 -0.2810606 0.2192784

# Krüger et al. (2014) Study 4, modified replication

``` r
effect_fruit_modified
```

    ##                        ID          d        var   ci_lower  ci_upper
    ## 1 Quantity Estimation (b) 0.09970903 0.01654964 -0.1537092 0.3531273

## BIF Effect

``` r
effect_fruit_modified_bif
```

    ##   ID          d        var   ci_lower   ci_upper
    ## 1  1 -0.1593989 0.01644594 -0.4120113 0.09321362

# Krüger et al. (2014) Study 1, validation

``` r
effect_bridge
```

    ##                  ID          d        var   ci_lower  ci_upper
    ## 1 Length Estimation 0.09718508 0.01675662 -0.1578293 0.3521995

## BIF Effect

``` r
effect_bridge_bif
```

    ##   ID         d        var   ci_lower ci_upper
    ## 1  1 0.1343801 0.01636396 -0.1175967 0.386357

# Summary of Validations Studies

``` r
validation_plot_data
```

    ##                        ID           d         var   ci_lower  ci_upper
    ## 1                     BIF  1.41884331 0.011898202  1.2044363 1.6332504
    ## 2          Categorization  0.08676957 0.003846699 -0.0349298 0.2084690
    ## 3            Segmentation  0.06592508 0.009921950 -0.1298945 0.2617447
    ## 4 Quantity Estimation (a) -0.08105716 0.016210130 -0.3318366 0.1697223
    ## 5 Quantity Estimation (b)  0.09970903 0.016549638 -0.1537092 0.3531273
    ## 6       Length Estimation  0.09718508 0.016756621 -0.1578293 0.3521995
    ## 7  Spillover Effect (BIF) -0.01850364 0.007171503 -0.1844826 0.1474754

``` r
knitr::include_graphics("./figures/climr_validation_plot.png")
```

![](./figures/climr_validation_plot.png)<!-- -->
