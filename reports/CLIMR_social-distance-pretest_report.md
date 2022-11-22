Construal Level International Multilab Replication (CLIMR) Project:
Pretest of Social distance Manipulation
================
CLIMR Team
2022-11-22

# Overview

The documentation for this pretest is provided here:
<https://osf.io/ahyvj/>

# Effect of Social Distance Manipulation on Ratings of Closeness

``` r
distance_d
```

    ##                ID        d        var ci_lower ci_upper
    ## 1 Social Distance 3.147686 0.02995737 2.807068 3.488304

``` r
knitr::include_graphics("./figures/climr_social-distance-pretest-histogram.png")
```

![](./figures/climr_social-distance-pretest-histogram.png)<!-- -->

``` r
close_cor_mat
```

    ##              close_rating   similar  familiar      warm competent  likeable   skilled conventional   eccentric     immune
    ## close_rating    1.0000000 0.8742448 0.8061887 0.6307766 0.4781747 0.7028595 0.3223844   0.22927058  0.16790741 0.25290007
    ## similar         0.8742448 1.0000000 0.8486266 0.6517199 0.4925678 0.6752398 0.3507983   0.26478371  0.20988228 0.23938674
    ## familiar        0.8061887 0.8486266 1.0000000 0.7103198 0.5478546 0.6908378 0.4393868   0.34080710  0.28193229 0.24812021
    ## warm            0.6307766 0.6517199 0.7103198 1.0000000 0.5933399 0.7497020 0.4822025   0.39189926  0.16100365 0.23058045
    ## competent       0.4781747 0.4925678 0.5478546 0.5933399 1.0000000 0.6168244 0.7300458   0.40278238  0.12882262 0.26513568
    ## likeable        0.7028595 0.6752398 0.6908378 0.7497020 0.6168244 1.0000000 0.4956516   0.32211748  0.19664847 0.25067026
    ## skilled         0.3223844 0.3507983 0.4393868 0.4822025 0.7300458 0.4956516 1.0000000   0.45680131  0.17655240 0.27846678
    ## conventional    0.2292706 0.2647837 0.3408071 0.3918993 0.4027824 0.3221175 0.4568013   1.00000000 -0.02091811 0.22027025
    ## eccentric       0.1679074 0.2098823 0.2819323 0.1610037 0.1288226 0.1966485 0.1765524  -0.02091811  1.00000000 0.01956791
    ## immune          0.2529001 0.2393867 0.2481202 0.2305804 0.2651357 0.2506703 0.2784668   0.22027025  0.01956791 1.00000000

# Effects of Social Distance on Other Variables

``` r
supplement_d
```

    ##             ID         d        var   ci_lower  ci_upper
    ## 1      Similar 4.0932996 0.04144592 3.69265772 4.4939416
    ## 2     Familiar 2.4663752 0.02353972 2.16443834 2.7683121
    ## 3         Warm 1.3567499 0.01642187 1.10456049 1.6089393
    ## 4    Competent 1.0198904 0.01507860 0.77823532 1.2615455
    ## 5     Likeable 1.5882872 0.01756598 1.32746069 1.8491136
    ## 6      Skilled 0.6327340 0.01400507 0.39984011 0.8656279
    ## 7 Conventional 0.3849556 0.01358198 0.15560658 0.6143047
    ## 8    Eccentric 0.3154763 0.01350032 0.08681773 0.5441349

# Effects of Social Distance on Process Variables

``` r
process_cor
```

    ##              close_rating q_difficult    q_clear q_detailed    q_vague     q_real
    ## close_rating    1.0000000  -0.2969455  0.3367946  0.3825411 -0.3699263  0.2291956
    ## q_difficult    -0.2969455   1.0000000 -0.6669431 -0.6122062  0.6838678 -0.5953060
    ## q_clear         0.3367946  -0.6669431  1.0000000  0.7673690 -0.6878542  0.6582154
    ## q_detailed      0.3825411  -0.6122062  0.7673690  1.0000000 -0.7442712  0.5658119
    ## q_vague        -0.3699263   0.6838678 -0.6878542 -0.7442712  1.0000000 -0.4367884
    ## q_real          0.2291956  -0.5953060  0.6582154  0.5658119 -0.4367884  1.0000000

``` r
process_d
```

    ##          ID          d        var   ci_lower   ci_upper
    ## 1 Difficult -0.5363727 0.01381604 -0.7676896 -0.3050559
    ## 2     Clear  0.5696060 0.01387771  0.3377734  0.8014386
    ## 3  Detailed  0.6650961 0.01407554  0.4316170  0.8985752
    ## 4     Vague -0.7414190 0.01425565 -0.9763871 -0.5064508
    ## 5      Real  0.3507433 0.01353974  0.1217511  0.5797356
