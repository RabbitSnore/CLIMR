Construal Level International Multilab Replication (CLIMR) Project:
Reliability analysis for the Behavior Identification Form (BIF)
================
CLIMR Team
2024-11-08

# Liberman & Trope (1998, Study 1)

``` r
bif_alpha_temporal
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

``` r
bif_alpha_temporal
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
    ## general/max  3.44   max/min =   195.46
    ## mean percent general =  0.76    with sd =  0.31 and cv of  0.4 
    ## Explained Common Variance of the general factor =  0.69 
    ## 
    ## The degrees of freedom are 42  and the fit is  0.05 
    ## The number of observations was  2972  with Chi Square =  149.51  with prob <  5.7e-14
    ## The root mean square of the residuals is  0.02 
    ## The df corrected root mean square of the residuals is  0.03
    ## RMSEA index =  0.029  and the 10 % confidence intervals are  0.024 0.035
    ## BIC =  -186.36
    ## 
    ## Compare this with the adequacy of just a general factor and no group factors
    ## The degrees of freedom for just the general factor are 65  and the fit is  0.11 
    ## The number of observations was  2972  with Chi Square =  321.25  with prob <  1.4e-35
    ## The root mean square of the residuals is  0.03 
    ## The df corrected root mean square of the residuals is  0.04 
    ## 
    ## RMSEA index =  0.036  and the 10 % confidence intervals are  0.033 0.04
    ## BIC =  -198.55 
    ## 
    ## Measures of factor score adequacy             
    ##                                                  g   F1*  F2*   F3*
    ## Correlation of scores with factors            0.83  0.04 0.75  0.52
    ## Multiple R square of scores with factors      0.69  0.00 0.56  0.27
    ## Minimum correlation of factor score estimates 0.39 -1.00 0.12 -0.46
    ## 
    ##  Total, General and Subset omega for each subset
    ##                                                  g  F1*  F2*  F3*
    ## Omega total for total scores and subscales    0.70 0.33 0.59 0.42
    ## Omega general for total scores and subscales  0.64 0.33 0.54 0.31
    ## Omega group for total scores and subscales    0.05 0.00 0.06 0.11

``` r
bif_alpha_spatial
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
    ## general/max  3.44   max/min =   195.46
    ## mean percent general =  0.76    with sd =  0.31 and cv of  0.4 
    ## Explained Common Variance of the general factor =  0.69 
    ## 
    ## The degrees of freedom are 42  and the fit is  0.05 
    ## The number of observations was  2972  with Chi Square =  149.51  with prob <  5.7e-14
    ## The root mean square of the residuals is  0.02 
    ## The df corrected root mean square of the residuals is  0.03
    ## RMSEA index =  0.029  and the 10 % confidence intervals are  0.024 0.035
    ## BIC =  -186.36
    ## 
    ## Compare this with the adequacy of just a general factor and no group factors
    ## The degrees of freedom for just the general factor are 65  and the fit is  0.11 
    ## The number of observations was  2972  with Chi Square =  321.25  with prob <  1.4e-35
    ## The root mean square of the residuals is  0.03 
    ## The df corrected root mean square of the residuals is  0.04 
    ## 
    ## RMSEA index =  0.036  and the 10 % confidence intervals are  0.033 0.04
    ## BIC =  -198.55 
    ## 
    ## Measures of factor score adequacy             
    ##                                                  g   F1*  F2*   F3*
    ## Correlation of scores with factors            0.83  0.04 0.75  0.52
    ## Multiple R square of scores with factors      0.69  0.00 0.56  0.27
    ## Minimum correlation of factor score estimates 0.39 -1.00 0.12 -0.46
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

``` r
bif_alpha_social
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

``` r
bif_alpha_likelihood
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
