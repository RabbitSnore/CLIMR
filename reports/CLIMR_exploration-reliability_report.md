Construal Level International Multilab Replication (CLIMR) Project:
Reliability analysis for the Behavior Identification Form (BIF)
================
CLIMR Team
2025-05-22

# Liberman & Trope (1998, Study 1)

``` r
bif_alpha_temporal
```

    ## 
    ## Reliability analysis   
    ## Call: psych::alpha(x = bif_rel_temporal)
    ## 
    ##   raw_alpha std.alpha G6(smc) average_r S/N    ase mean   sd median_r
    ##       0.76      0.76    0.76      0.14 3.2 0.0063 0.49 0.21     0.14
    ## 
    ##     95% confidence boundaries 
    ##          lower alpha upper
    ## Feldt     0.75  0.76  0.77
    ## Duhachek  0.75  0.76  0.77
    ## 
    ##  Reliability if an item is dropped:
    ##        raw_alpha std.alpha G6(smc) average_r S/N alpha se  var.r med.r
    ## bif_01      0.76      0.76    0.76      0.15 3.1   0.0065 0.0057  0.14
    ## bif_02      0.75      0.75    0.75      0.14 3.0   0.0067 0.0056  0.14
    ## bif_04      0.75      0.75    0.75      0.14 3.1   0.0066 0.0056  0.14
    ## bif_07      0.75      0.75    0.75      0.14 3.0   0.0066 0.0053  0.14
    ## bif_08      0.75      0.75    0.76      0.15 3.1   0.0066 0.0057  0.14
    ## bif_09      0.74      0.74    0.74      0.14 2.9   0.0068 0.0051  0.14
    ## bif_10      0.75      0.75    0.75      0.14 3.0   0.0066 0.0056  0.14
    ## bif_11      0.75      0.75    0.76      0.15 3.1   0.0065 0.0059  0.14
    ## bif_12      0.74      0.74    0.74      0.14 2.9   0.0069 0.0050  0.14
    ## bif_15      0.75      0.75    0.75      0.14 3.0   0.0067 0.0058  0.14
    ## bif_16      0.74      0.74    0.74      0.14 2.8   0.0070 0.0045  0.14
    ## bif_17      0.75      0.75    0.75      0.14 3.0   0.0066 0.0059  0.14
    ## bif_18      0.75      0.75    0.75      0.14 3.0   0.0066 0.0059  0.14
    ## bif_19      0.76      0.76    0.76      0.15 3.2   0.0063 0.0055  0.14
    ## bif_20      0.75      0.75    0.75      0.14 3.0   0.0066 0.0056  0.14
    ## bif_22      0.77      0.77    0.77      0.16 3.4   0.0061 0.0040  0.15
    ## bif_23      0.75      0.75    0.75      0.14 3.0   0.0066 0.0058  0.14
    ## bif_24      0.76      0.76    0.76      0.15 3.2   0.0064 0.0057  0.15
    ## bif_25      0.75      0.75    0.75      0.14 3.0   0.0067 0.0052  0.14
    ## 
    ##  Item statistics 
    ##           n raw.r std.r r.cor r.drop mean   sd
    ## bif_01 2939  0.39  0.39 0.318  0.277 0.55 0.50
    ## bif_02 2939  0.48  0.48 0.435  0.380 0.63 0.48
    ## bif_04 2939  0.42  0.42 0.365  0.316 0.30 0.46
    ## bif_07 2939  0.45  0.44 0.392  0.339 0.53 0.50
    ## bif_08 2938  0.41  0.42 0.356  0.309 0.35 0.48
    ## bif_09 2938  0.54  0.54 0.507  0.440 0.51 0.50
    ## bif_10 2938  0.45  0.44 0.390  0.339 0.58 0.49
    ## bif_11 2938  0.39  0.41 0.349  0.304 0.19 0.39
    ## bif_12 2937  0.56  0.55 0.529  0.462 0.55 0.50
    ## bif_15 2938  0.48  0.48 0.432  0.377 0.45 0.50
    ## bif_16 2938  0.59  0.59 0.579  0.504 0.54 0.50
    ## bif_17 2938  0.45  0.45 0.398  0.349 0.36 0.48
    ## bif_18 2938  0.45  0.44 0.387  0.336 0.50 0.50
    ## bif_19 2938  0.32  0.32 0.238  0.203 0.44 0.50
    ## bif_20 2938  0.45  0.45 0.403  0.352 0.65 0.48
    ## bif_22 2938  0.17  0.17 0.062  0.052 0.62 0.49
    ## bif_23 2938  0.45  0.46 0.404  0.351 0.29 0.45
    ## bif_24 2938  0.33  0.33 0.249  0.216 0.52 0.50
    ## bif_25 2938  0.47  0.47 0.432  0.375 0.68 0.47
    ## 
    ## Non missing response frequency for each item
    ##           0    1 miss
    ## bif_01 0.45 0.55    0
    ## bif_02 0.37 0.63    0
    ## bif_04 0.70 0.30    0
    ## bif_07 0.47 0.53    0
    ## bif_08 0.65 0.35    0
    ## bif_09 0.49 0.51    0
    ## bif_10 0.42 0.58    0
    ## bif_11 0.81 0.19    0
    ## bif_12 0.45 0.55    0
    ## bif_15 0.55 0.45    0
    ## bif_16 0.46 0.54    0
    ## bif_17 0.64 0.36    0
    ## bif_18 0.50 0.50    0
    ## bif_19 0.56 0.44    0
    ## bif_20 0.35 0.65    0
    ## bif_22 0.38 0.62    0
    ## bif_23 0.71 0.29    0
    ## bif_24 0.48 0.52    0
    ## bif_25 0.32 0.68    0

``` r
bif_omega_temporal
```

    ## Omega 
    ## Call: omegah(m = m, nfactors = nfactors, fm = fm, key = key, flip = flip, 
    ##     digits = digits, title = title, sl = sl, labels = labels, 
    ##     plot = plot, n.obs = n.obs, rotate = rotate, Phi = Phi, option = option, 
    ##     covar = covar)
    ## Alpha:                 0.76 
    ## G.6:                   0.76 
    ## Omega Hierarchical:    0.63 
    ## Omega H asymptotic:    0.8 
    ## Omega Total            0.78 
    ## 
    ## Schmid Leiman Factor loadings greater than  0.2 
    ##            g   F1*   F2*   F3*   h2   u2   p2
    ## bif_01  0.31                   0.11 0.89 0.90
    ## bif_02  0.45                   0.25 0.75 0.82
    ## bif_04  0.32        0.33       0.22 0.78 0.48
    ## bif_07  0.43                   0.24 0.76 0.78
    ## bif_08  0.29        0.30       0.19 0.81 0.45
    ## bif_09  0.51                   0.29 0.71 0.90
    ## bif_10  0.37        0.21       0.19 0.81 0.73
    ## bif_11  0.26              0.27 0.15 0.85 0.42
    ## bif_12  0.51                   0.30 0.70 0.87
    ## bif_15  0.34              0.30 0.22 0.78 0.54
    ## bif_16  0.58                   0.38 0.62 0.87
    ## bif_17  0.32              0.30 0.20 0.80 0.52
    ## bif_18  0.28              0.36 0.21 0.79 0.38
    ## bif_19                    0.38 0.17 0.83 0.11
    ## bif_20  0.41                   0.20 0.80 0.83
    ## bif_22                    0.20 0.06 0.94 0.01
    ## bif_23  0.32              0.24 0.19 0.81 0.53
    ## bif_24  0.21                   0.09 0.91 0.46
    ## bif_25  0.47                   0.25 0.75 0.87
    ## 
    ## With Sums of squares  of:
    ##    g  F1*  F2*  F3* 
    ## 2.59 0.20 0.41 0.73 
    ## 
    ## general/max  3.57   max/min =   3.71
    ## mean percent general =  0.6    with sd =  0.27 and cv of  0.44 
    ## Explained Common Variance of the general factor =  0.66 
    ## 
    ## The degrees of freedom are 117  and the fit is  0.12 
    ## The number of observations was  2939  with Chi Square =  354.01  with prob <  1.2e-25
    ## The root mean square of the residuals is  0.02 
    ## The df corrected root mean square of the residuals is  0.03
    ## RMSEA index =  0.026  and the 10 % confidence intervals are  0.023 0.029
    ## BIC =  -580.34
    ## 
    ## Compare this with the adequacy of just a general factor and no group factors
    ## The degrees of freedom for just the general factor are 152  and the fit is  0.34 
    ## The number of observations was  2939  with Chi Square =  993.5  with prob <  1.4e-123
    ## The root mean square of the residuals is  0.05 
    ## The df corrected root mean square of the residuals is  0.05 
    ## 
    ## RMSEA index =  0.043  and the 10 % confidence intervals are  0.041 0.046
    ## BIC =  -220.35 
    ## 
    ## Measures of factor score adequacy             
    ##                                                  g   F1*   F2*   F3*
    ## Correlation of scores with factors            0.84  0.28  0.55  0.64
    ## Multiple R square of scores with factors      0.70  0.08  0.30  0.41
    ## Minimum correlation of factor score estimates 0.40 -0.84 -0.39 -0.17
    ## 
    ##  Total, General and Subset omega for each subset
    ##                                                  g  F1*  F2*  F3*
    ## Omega total for total scores and subscales    0.78 0.71 0.40 0.56
    ## Omega general for total scores and subscales  0.63 0.65 0.24 0.23
    ## Omega group for total scores and subscales    0.10 0.07 0.17 0.33

# Fujita et al. (2006, Study 1)

``` r
bif_alpha_spatial
```

    ## 
    ## Reliability analysis   
    ## Call: psych::alpha(x = bif_rel_spatial)
    ## 
    ##   raw_alpha std.alpha G6(smc) average_r S/N    ase mean   sd median_r
    ##       0.67      0.67    0.67      0.14 2.1 0.0088 0.64 0.21     0.14
    ## 
    ##     95% confidence boundaries 
    ##          lower alpha upper
    ## Feldt     0.66  0.67  0.69
    ## Duhachek  0.66  0.67  0.69
    ## 
    ##  Reliability if an item is dropped:
    ##        raw_alpha std.alpha G6(smc) average_r S/N alpha se  var.r med.r
    ## bif_02      0.66      0.66    0.65      0.14 2.0   0.0091 0.0048  0.14
    ## bif_04      0.67      0.67    0.66      0.14 2.0   0.0089 0.0045  0.14
    ## bif_05      0.65      0.65    0.64      0.13 1.8   0.0095 0.0042  0.13
    ## bif_07      0.66      0.66    0.65      0.14 1.9   0.0092 0.0045  0.14
    ## bif_09      0.64      0.64    0.63      0.13 1.8   0.0097 0.0041  0.13
    ## bif_10      0.66      0.66    0.65      0.14 1.9   0.0093 0.0045  0.14
    ## bif_12      0.64      0.64    0.63      0.13 1.8   0.0096 0.0040  0.13
    ## bif_14      0.65      0.65    0.64      0.13 1.8   0.0095 0.0040  0.13
    ## bif_16      0.63      0.63    0.62      0.13 1.7   0.0098 0.0033  0.13
    ## bif_19      0.68      0.68    0.67      0.15 2.1   0.0086 0.0039  0.15
    ## bif_20      0.65      0.65    0.64      0.14 1.9   0.0093 0.0046  0.14
    ## bif_22      0.67      0.68    0.67      0.15 2.1   0.0088 0.0040  0.15
    ## bif_23      0.65      0.65    0.65      0.14 1.9   0.0093 0.0047  0.13
    ## 
    ##  Item statistics 
    ##           n raw.r std.r r.cor r.drop mean   sd
    ## bif_02 2971  0.39  0.41  0.31   0.26 0.79 0.40
    ## bif_04 2971  0.39  0.39  0.28   0.23 0.61 0.49
    ## bif_05 2971  0.51  0.50  0.43   0.35 0.51 0.50
    ## bif_07 2971  0.43  0.42  0.33   0.27 0.67 0.47
    ## bif_09 2971  0.54  0.54  0.49   0.40 0.62 0.49
    ## bif_10 2971  0.44  0.45  0.37   0.30 0.77 0.42
    ## bif_12 2971  0.52  0.52  0.47   0.38 0.74 0.44
    ## bif_14 2971  0.51  0.50  0.43   0.35 0.46 0.50
    ## bif_16 2971  0.57  0.58  0.55   0.44 0.73 0.44
    ## bif_19 2970  0.33  0.32  0.19   0.15 0.47 0.50
    ## bif_20 2971  0.45  0.46  0.38   0.31 0.75 0.43
    ## bif_22 2971  0.30  0.32  0.19   0.16 0.81 0.39
    ## bif_23 2971  0.47  0.46  0.37   0.31 0.44 0.50
    ## 
    ## Non missing response frequency for each item
    ##           0    1 miss
    ## bif_02 0.21 0.79    0
    ## bif_04 0.39 0.61    0
    ## bif_05 0.49 0.51    0
    ## bif_07 0.33 0.67    0
    ## bif_09 0.38 0.62    0
    ## bif_10 0.23 0.77    0
    ## bif_12 0.26 0.74    0
    ## bif_14 0.54 0.46    0
    ## bif_16 0.27 0.73    0
    ## bif_19 0.53 0.47    0
    ## bif_20 0.25 0.75    0
    ## bif_22 0.19 0.81    0
    ## bif_23 0.56 0.44    0

``` r
bif_omega_spatial
```

    ## Omega 
    ## Call: omegah(m = m, nfactors = nfactors, fm = fm, key = key, flip = flip, 
    ##     digits = digits, title = title, sl = sl, labels = labels, 
    ##     plot = plot, n.obs = n.obs, rotate = rotate, Phi = Phi, option = option, 
    ##     covar = covar)
    ## Alpha:                 0.67 
    ## G.6:                   0.67 
    ## Omega Hierarchical:    0.64 
    ## Omega H asymptotic:    0.92 
    ## Omega Total            0.7 
    ## 
    ## Schmid Leiman Factor loadings greater than  0.2 
    ##            g   F1*   F2*   F3*   h2   u2   p2
    ## bif_02  0.29                   0.10 0.90 0.89
    ## bif_04  0.31                   0.11 0.89 0.88
    ## bif_05  0.43                   0.21 0.79 0.90
    ## bif_07  0.33                   0.12 0.88 0.95
    ## bif_09  0.47                   0.23 0.77 0.95
    ## bif_10  0.39                   0.16 0.84 0.97
    ## bif_12  0.50                   0.26 0.74 0.98
    ## bif_14  0.40        0.71       0.66 0.34 0.24
    ## bif_16  0.58                   0.33 0.67 1.00
    ## bif_19                    0.45 0.22 0.78 0.08
    ## bif_20  0.36                   0.16 0.84 0.83
    ## bif_22                         0.06 0.94 0.42
    ## bif_23  0.34                   0.14 0.86 0.79
    ## 
    ## With Sums of squares  of:
    ##    g  F1*  F2*  F3* 
    ## 1.89 0.00 0.55 0.31 
    ## 
    ## general/max  3.43   max/min =   195.56
    ## mean percent general =  0.76    with sd =  0.31 and cv of  0.4 
    ## Explained Common Variance of the general factor =  0.69 
    ## 
    ## The degrees of freedom are 42  and the fit is  0.05 
    ## The number of observations was  2971  with Chi Square =  149.49  with prob <  5.7e-14
    ## The root mean square of the residuals is  0.02 
    ## The df corrected root mean square of the residuals is  0.03
    ## RMSEA index =  0.029  and the 10 % confidence intervals are  0.024 0.035
    ## BIC =  -186.37
    ## 
    ## Compare this with the adequacy of just a general factor and no group factors
    ## The degrees of freedom for just the general factor are 65  and the fit is  0.11 
    ## The number of observations was  2971  with Chi Square =  321.15  with prob <  1.5e-35
    ## The root mean square of the residuals is  0.03 
    ## The df corrected root mean square of the residuals is  0.04 
    ## 
    ## RMSEA index =  0.036  and the 10 % confidence intervals are  0.033 0.04
    ## BIC =  -198.64 
    ## 
    ## Measures of factor score adequacy             
    ##                                                  g   F1*  F2*   F3*
    ## Correlation of scores with factors            0.83  0.04 0.75  0.52
    ## Multiple R square of scores with factors      0.69  0.00 0.56  0.27
    ## Minimum correlation of factor score estimates 0.39 -1.00 0.13 -0.46
    ## 
    ##  Total, General and Subset omega for each subset
    ##                                                  g  F1*  F2*  F3*
    ## Omega total for total scores and subscales    0.70 0.33 0.59 0.42
    ## Omega general for total scores and subscales  0.64 0.33 0.54 0.31
    ## Omega group for total scores and subscales    0.05 0.00 0.06 0.11

# Social Distance (Paradigmatic Replication)

``` r
bif_alpha_social
```

    ## 
    ## Reliability analysis   
    ## Call: psych::alpha(x = bif_rel_social)
    ## 
    ##   raw_alpha std.alpha G6(smc) average_r S/N    ase mean   sd median_r
    ##       0.82      0.82    0.82      0.15 4.5 0.0049  0.4 0.21     0.15
    ## 
    ##     95% confidence boundaries 
    ##          lower alpha upper
    ## Feldt     0.81  0.82  0.83
    ## Duhachek  0.81  0.82  0.83
    ## 
    ##  Reliability if an item is dropped:
    ##        raw_alpha std.alpha G6(smc) average_r S/N alpha se  var.r med.r
    ## bif_01      0.81      0.81    0.82      0.15 4.4   0.0050 0.0054  0.16
    ## bif_02      0.81      0.81    0.81      0.15 4.3   0.0051 0.0053  0.15
    ## bif_03      0.82      0.82    0.82      0.16 4.6   0.0048 0.0047  0.16
    ## bif_04      0.81      0.81    0.82      0.15 4.3   0.0050 0.0054  0.16
    ## bif_05      0.81      0.81    0.82      0.15 4.4   0.0050 0.0053  0.16
    ## bif_06      0.81      0.81    0.82      0.15 4.3   0.0050 0.0053  0.15
    ## bif_07      0.81      0.81    0.81      0.15 4.2   0.0051 0.0052  0.15
    ## bif_08      0.81      0.81    0.82      0.15 4.3   0.0050 0.0054  0.15
    ## bif_09      0.80      0.81    0.81      0.15 4.1   0.0052 0.0050  0.15
    ## bif_10      0.81      0.81    0.81      0.15 4.3   0.0050 0.0054  0.15
    ## bif_11      0.81      0.81    0.82      0.15 4.3   0.0050 0.0055  0.15
    ## bif_12      0.81      0.81    0.81      0.15 4.1   0.0052 0.0049  0.15
    ## bif_13      0.81      0.81    0.81      0.15 4.2   0.0051 0.0053  0.15
    ## bif_14      0.81      0.81    0.81      0.15 4.2   0.0051 0.0054  0.15
    ## bif_15      0.81      0.81    0.81      0.15 4.2   0.0051 0.0053  0.15
    ## bif_16      0.80      0.80    0.81      0.14 4.1   0.0053 0.0046  0.15
    ## bif_17      0.81      0.81    0.81      0.15 4.2   0.0051 0.0054  0.15
    ## bif_18      0.81      0.81    0.81      0.15 4.2   0.0051 0.0055  0.15
    ## bif_19      0.81      0.81    0.82      0.15 4.3   0.0050 0.0054  0.16
    ## bif_20      0.80      0.81    0.81      0.15 4.1   0.0052 0.0050  0.15
    ## bif_21      0.81      0.81    0.82      0.15 4.3   0.0050 0.0056  0.15
    ## bif_22      0.82      0.82    0.82      0.16 4.6   0.0047 0.0044  0.16
    ## bif_23      0.81      0.81    0.81      0.15 4.2   0.0051 0.0055  0.15
    ## bif_24      0.81      0.81    0.82      0.15 4.3   0.0050 0.0055  0.16
    ## bif_25      0.81      0.81    0.81      0.15 4.2   0.0051 0.0051  0.15
    ## 
    ##  Item statistics 
    ##           n raw.r std.r r.cor r.drop mean   sd
    ## bif_01 2923  0.37  0.36  0.31  0.279 0.41 0.49
    ## bif_02 2923  0.45  0.44  0.40  0.364 0.50 0.50
    ## bif_03 2922  0.22  0.21  0.14  0.121 0.50 0.50
    ## bif_04 2922  0.37  0.37  0.32  0.285 0.29 0.46
    ## bif_05 2922  0.37  0.37  0.32  0.282 0.42 0.49
    ## bif_06 2922  0.40  0.40  0.36  0.321 0.33 0.47
    ## bif_07 2922  0.45  0.45  0.41  0.373 0.47 0.50
    ## bif_08 2922  0.38  0.39  0.34  0.302 0.28 0.45
    ## bif_09 2922  0.53  0.53  0.51  0.460 0.39 0.49
    ## bif_10 2922  0.44  0.44  0.40  0.360 0.54 0.50
    ## bif_11 2922  0.40  0.42  0.38  0.337 0.18 0.38
    ## bif_12 2922  0.53  0.53  0.50  0.455 0.43 0.50
    ## bif_13 2922  0.51  0.51  0.48  0.435 0.39 0.49
    ## bif_14 2922  0.47  0.47  0.44  0.394 0.35 0.48
    ## bif_15 2922  0.49  0.49  0.46  0.411 0.36 0.48
    ## bif_16 2922  0.60  0.60  0.60  0.539 0.40 0.49
    ## bif_17 2922  0.49  0.49  0.46  0.416 0.32 0.47
    ## bif_18 2922  0.46  0.46  0.42  0.377 0.41 0.49
    ## bif_19 2922  0.38  0.38  0.33  0.297 0.38 0.49
    ## bif_20 2921  0.54  0.54  0.52  0.471 0.45 0.50
    ## bif_21 2922  0.41  0.42  0.37  0.333 0.36 0.48
    ## bif_22 2922  0.19  0.19  0.11  0.095 0.54 0.50
    ## bif_23 2922  0.45  0.46  0.42  0.376 0.29 0.45
    ## bif_24 2922  0.37  0.37  0.32  0.288 0.42 0.49
    ## bif_25 2921  0.48  0.47  0.44  0.398 0.55 0.50
    ## 
    ## Non missing response frequency for each item
    ##           0    1 miss
    ## bif_01 0.59 0.41    0
    ## bif_02 0.50 0.50    0
    ## bif_03 0.50 0.50    0
    ## bif_04 0.71 0.29    0
    ## bif_05 0.58 0.42    0
    ## bif_06 0.67 0.33    0
    ## bif_07 0.53 0.47    0
    ## bif_08 0.72 0.28    0
    ## bif_09 0.61 0.39    0
    ## bif_10 0.46 0.54    0
    ## bif_11 0.82 0.18    0
    ## bif_12 0.57 0.43    0
    ## bif_13 0.61 0.39    0
    ## bif_14 0.65 0.35    0
    ## bif_15 0.64 0.36    0
    ## bif_16 0.60 0.40    0
    ## bif_17 0.68 0.32    0
    ## bif_18 0.59 0.41    0
    ## bif_19 0.62 0.38    0
    ## bif_20 0.55 0.45    0
    ## bif_21 0.64 0.36    0
    ## bif_22 0.46 0.54    0
    ## bif_23 0.71 0.29    0
    ## bif_24 0.58 0.42    0
    ## bif_25 0.45 0.55    0

``` r
bif_omega_social
```

    ## Omega 
    ## Call: omegah(m = m, nfactors = nfactors, fm = fm, key = key, flip = flip, 
    ##     digits = digits, title = title, sl = sl, labels = labels, 
    ##     plot = plot, n.obs = n.obs, rotate = rotate, Phi = Phi, option = option, 
    ##     covar = covar)
    ## Alpha:                 0.82 
    ## G.6:                   0.82 
    ## Omega Hierarchical:    0.62 
    ## Omega H asymptotic:    0.75 
    ## Omega Total            0.83 
    ## 
    ## Schmid Leiman Factor loadings greater than  0.2 
    ##            g   F1*   F2*   F3*   h2   u2   p2
    ## bif_01  0.27                   0.10 0.90 0.74
    ## bif_02  0.36  0.21             0.20 0.80 0.66
    ## bif_03                         0.03 0.97 0.28
    ## bif_04  0.28              0.43 0.26 0.74 0.29
    ## bif_05  0.30                   0.16 0.84 0.58
    ## bif_06  0.34  0.21             0.17 0.83 0.67
    ## bif_07  0.40  0.28             0.26 0.74 0.63
    ## bif_08  0.29              0.32 0.19 0.81 0.43
    ## bif_09  0.48  0.29             0.31 0.69 0.73
    ## bif_10  0.37  0.21             0.18 0.82 0.73
    ## bif_11  0.31              0.25 0.18 0.82 0.54
    ## bif_12  0.47  0.26             0.30 0.70 0.75
    ## bif_13  0.42                   0.24 0.76 0.74
    ## bif_14  0.38                   0.20 0.80 0.73
    ## bif_15  0.39        0.24       0.23 0.77 0.66
    ## bif_16  0.54  0.25             0.37 0.63 0.78
    ## bif_17  0.38        0.30       0.24 0.76 0.58
    ## bif_18  0.34        0.35       0.24 0.76 0.47
    ## bif_19  0.25        0.39       0.21 0.79 0.28
    ## bif_20  0.47  0.24             0.31 0.69 0.71
    ## bif_21  0.30        0.21       0.15 0.85 0.61
    ## bif_22              0.28       0.09 0.91 0.05
    ## bif_23  0.35              0.26 0.22 0.78 0.55
    ## bif_24  0.26        0.25       0.13 0.87 0.51
    ## bif_25  0.42  0.30             0.28 0.72 0.63
    ## 
    ## With Sums of squares  of:
    ##    g  F1*  F2*  F3* 
    ## 3.17 0.69 0.81 0.56 
    ## 
    ## general/max  3.9   max/min =   1.45
    ## mean percent general =  0.57    with sd =  0.18 and cv of  0.32 
    ## Explained Common Variance of the general factor =  0.61 
    ## 
    ## The degrees of freedom are 228  and the fit is  0.27 
    ## The number of observations was  2923  with Chi Square =  788.31  with prob <  8.5e-63
    ## The root mean square of the residuals is  0.02 
    ## The df corrected root mean square of the residuals is  0.03
    ## RMSEA index =  0.029  and the 10 % confidence intervals are  0.027 0.031
    ## BIC =  -1031.21
    ## 
    ## Compare this with the adequacy of just a general factor and no group factors
    ## The degrees of freedom for just the general factor are 275  and the fit is  0.61 
    ## The number of observations was  2923  with Chi Square =  1783.6  with prob <  7e-219
    ## The root mean square of the residuals is  0.05 
    ## The df corrected root mean square of the residuals is  0.06 
    ## 
    ## RMSEA index =  0.043  and the 10 % confidence intervals are  0.041 0.045
    ## BIC =  -411 
    ## 
    ## Measures of factor score adequacy             
    ##                                                  g   F1*   F2*   F3*
    ## Correlation of scores with factors            0.81  0.49  0.65  0.60
    ## Multiple R square of scores with factors      0.65  0.24  0.42  0.36
    ## Minimum correlation of factor score estimates 0.31 -0.52 -0.16 -0.29
    ## 
    ##  Total, General and Subset omega for each subset
    ##                                                  g  F1*  F2*  F3*
    ## Omega total for total scores and subscales    0.83 0.75 0.60 0.53
    ## Omega general for total scores and subscales  0.62 0.56 0.33 0.30
    ## Omega group for total scores and subscales    0.12 0.19 0.27 0.23

# Likelihood Distance (Paradigmatic Replication)

``` r
bif_alpha_likelihood
```

    ## 
    ## Reliability analysis   
    ## Call: psych::alpha(x = bif_rel_likelihood)
    ## 
    ##   raw_alpha std.alpha G6(smc) average_r S/N   ase mean   sd median_r
    ##       0.57      0.57    0.56      0.13 1.3 0.012 0.51 0.23     0.13
    ## 
    ##     95% confidence boundaries 
    ##          lower alpha upper
    ## Feldt     0.55  0.57  0.59
    ## Duhachek  0.55  0.57  0.59
    ## 
    ##  Reliability if an item is dropped:
    ##        raw_alpha std.alpha G6(smc) average_r S/N alpha se  var.r med.r
    ## bif_01      0.55      0.55    0.54      0.13 1.2    0.013 0.0059  0.13
    ## bif_07      0.55      0.56    0.54      0.14 1.3    0.012 0.0056  0.13
    ## bif_08      0.55      0.56    0.54      0.14 1.3    0.012 0.0060  0.13
    ## bif_09      0.50      0.50    0.48      0.11 1.0    0.014 0.0043  0.10
    ## bif_11      0.54      0.54    0.52      0.13 1.2    0.013 0.0056  0.13
    ## bif_12      0.52      0.52    0.50      0.12 1.1    0.013 0.0041  0.11
    ## bif_18      0.53      0.54    0.52      0.13 1.2    0.013 0.0056  0.12
    ## bif_22      0.59      0.59    0.57      0.15 1.4    0.012 0.0043  0.14
    ## bif_25      0.53      0.54    0.52      0.13 1.2    0.013 0.0052  0.13
    ## 
    ##  Item statistics 
    ##           n raw.r std.r r.cor r.drop mean   sd
    ## bif_01 2935  0.46  0.45  0.31   0.24 0.56 0.50
    ## bif_07 2935  0.45  0.44  0.30   0.22 0.47 0.50
    ## bif_08 2934  0.44  0.43  0.29   0.22 0.35 0.48
    ## bif_09 2935  0.60  0.59  0.54   0.41 0.59 0.49
    ## bif_11 2935  0.46  0.49  0.37   0.28 0.22 0.41
    ## bif_12 2935  0.53  0.55  0.47   0.34 0.71 0.45
    ## bif_18 2935  0.51  0.50  0.39   0.29 0.46 0.50
    ## bif_22 2935  0.35  0.34  0.15   0.11 0.46 0.50
    ## bif_25 2935  0.48  0.50  0.39   0.29 0.74 0.44
    ## 
    ## Non missing response frequency for each item
    ##           0    1 miss
    ## bif_01 0.44 0.56    0
    ## bif_07 0.53 0.47    0
    ## bif_08 0.65 0.35    0
    ## bif_09 0.41 0.59    0
    ## bif_11 0.78 0.22    0
    ## bif_12 0.29 0.71    0
    ## bif_18 0.54 0.46    0
    ## bif_22 0.54 0.46    0
    ## bif_25 0.26 0.74    0

``` r
bif_omega_likelihood
```

    ## Omega 
    ## Call: omegah(m = m, nfactors = nfactors, fm = fm, key = key, flip = flip, 
    ##     digits = digits, title = title, sl = sl, labels = labels, 
    ##     plot = plot, n.obs = n.obs, rotate = rotate, Phi = Phi, option = option, 
    ##     covar = covar)
    ## Alpha:                 0.57 
    ## G.6:                   0.56 
    ## Omega Hierarchical:    0.4 
    ## Omega H asymptotic:    0.65 
    ## Omega Total            0.62 
    ## 
    ## Schmid Leiman Factor loadings greater than  0.2 
    ##            g   F1*   F2*   F3*   h2   u2   p2
    ## bif_01  0.25        0.29       0.15 0.85 0.42
    ## bif_07  0.26        0.42       0.25 0.75 0.28
    ## bif_08  0.21        0.20       0.13 0.87 0.34
    ## bif_09  0.44  0.28             0.32 0.68 0.61
    ## bif_11  0.29  0.40             0.25 0.75 0.35
    ## bif_12  0.43              0.29 0.29 0.71 0.63
    ## bif_18  0.32  0.30             0.22 0.78 0.48
    ## bif_22                         0.03 0.97 0.38
    ## bif_25  0.41              0.42 0.34 0.66 0.48
    ## 
    ## With Sums of squares  of:
    ##    g  F1*  F2*  F3* 
    ## 0.92 0.41 0.35 0.30 
    ## 
    ## general/max  2.22   max/min =   1.39
    ## mean percent general =  0.44    with sd =  0.12 and cv of  0.27 
    ## Explained Common Variance of the general factor =  0.46 
    ## 
    ## The degrees of freedom are 12  and the fit is  0.01 
    ## The number of observations was  2935  with Chi Square =  32.58  with prob <  0.0011
    ## The root mean square of the residuals is  0.01 
    ## The df corrected root mean square of the residuals is  0.02
    ## RMSEA index =  0.024  and the 10 % confidence intervals are  0.014 0.034
    ## BIC =  -63.23
    ## 
    ## Compare this with the adequacy of just a general factor and no group factors
    ## The degrees of freedom for just the general factor are 27  and the fit is  0.12 
    ## The number of observations was  2935  with Chi Square =  337.85  with prob <  1.9e-55
    ## The root mean square of the residuals is  0.06 
    ## The df corrected root mean square of the residuals is  0.07 
    ## 
    ## RMSEA index =  0.063  and the 10 % confidence intervals are  0.057 0.069
    ## BIC =  122.27 
    ## 
    ## Measures of factor score adequacy             
    ##                                                   g   F1*   F2*   F3*
    ## Correlation of scores with factors             0.66  0.53  0.52  0.48
    ## Multiple R square of scores with factors       0.44  0.28  0.27  0.23
    ## Minimum correlation of factor score estimates -0.12 -0.44 -0.45 -0.53
    ## 
    ##  Total, General and Subset omega for each subset
    ##                                                  g  F1*  F2*  F3*
    ## Omega total for total scores and subscales    0.62 0.44 0.35 0.47
    ## Omega general for total scores and subscales  0.40 0.23 0.14 0.27
    ## Omega group for total scores and subscales    0.14 0.21 0.22 0.20
