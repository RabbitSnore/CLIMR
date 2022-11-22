Construal Level International Multilab Replication (CLIMR) Project:
Examination of Behavior Identification Form (BIF) Item Behavior
================
CLIMR Team
2022-11-22

# Behavior Identification Form (BIF) - Distance Manipulation by Item Interaction

Reviewers have expressed concern that some items of the BIF might entail
actions that inherently involve events that are more psychologically
distant or less psychologically distant (and perhaps therefore more or
less difficult to imagine happening), and these differences in items
might cause manipulations of psychological distance to work differently
for different items. Stated differently, if this occurs, there would be
an interaction between a psychological distance manipulation and the
items on the BIF.

If we are concerned about how a direct manipulation of psychological
distance might interact with the distances inherent in the actions
described in the BIF items, we can model this interaction as random
slopes in a mixed effects model predicting BIF responses. This set of
slopes would allow the effect of a distance manipulation to vary across
items. If there is considerable variance in these slopes, the problem is
plausible. If there is little or no variation, the problem is less
plausible.

We have several data sets that can provide information about the
plausibility of this concern. We can examine data from the following
sources:

- The CLIMR validation experiment for the BIF, which attempted a direct
  manipulation of abstraction
- Sánchez, Coleman, & Ledgerwood (2021), which attempted to manipulate
  temporal distance
- Grinfeld et al (2021), experiments 2b, 2c, and the replication of 2c,
  which attempted to manipulate hypotheticality

## CLIMR

``` r
anova(log_model_climr, log_model_climr_rs)
```

    ## Data: bif_long
    ## Models:
    ## log_model_climr: bif_response ~ group + (1 | sub) + (1 | item)
    ## log_model_climr_rs: bif_response ~ group + (1 | sub) + (1 + group | item)
    ##                    npar    AIC    BIC  logLik deviance  Chisq Df Pr(>Chisq)
    ## log_model_climr       4 9690.3 9719.5 -4841.2   9682.3                     
    ## log_model_climr_rs    6 9693.4 9737.1 -4840.7   9681.4 0.9099  2     0.6345

This likelihood ratio test indicates that adding random slopes for BIF
items by abstraction condition does not offer a significant improvement
to the model.

``` r
summary(log_model_climr_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif_response ~ group + (1 | sub) + (1 + group | item)
    ##    Data: bif_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   9693.4   9737.1  -4840.7   9681.4    10802 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -5.9671 -0.4573 -0.1194  0.4821  6.0075 
    ## 
    ## Random effects:
    ##  Groups Name         Variance Std.Dev. Corr 
    ##  sub    (Intercept)  4.43410  2.1057        
    ##  item   (Intercept)  0.44386  0.6662        
    ##         groupdistant 0.01261  0.1123   -0.50
    ## Number of obs: 10808, groups:  sub, 436; item, 25
    ## 
    ## Fixed effects:
    ##              Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)   -1.8156     0.1999  -9.083   <2e-16 ***
    ## groupdistant   3.0613     0.2187  13.999   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## groupdistnt -0.549

And indeed, we can see that the variance of the random slopes is quite
small, suggesting that the BIF items operated similarly.

Directly examining the random slopes, we can indeed see substantial
similarity across the estimated coefficients for each item.

``` r
coef(log_model_climr_rs)$item
```

    ##       (Intercept) groupdistant
    ## bif1   -1.4771647     3.031594
    ## bif10  -1.4357118     3.011156
    ## bif11  -1.7896385     3.016141
    ## bif12  -2.1841158     3.122767
    ## bif13  -1.7009686     3.045346
    ## bif14  -2.5607218     3.129861
    ## bif15  -2.2897358     3.131484
    ## bif16  -0.7415167     2.917967
    ## bif17  -2.5065812     3.098634
    ## bif18  -1.7513464     3.015031
    ## bif19  -0.7225302     3.006080
    ## bif2   -0.9270950     3.011822
    ## bif20  -1.9179575     3.068602
    ## bif21  -1.9816459     2.991756
    ## bif22  -2.1906880     3.096887
    ## bif23  -1.5969906     3.042711
    ## bif24  -2.5478166     3.070137
    ## bif25  -2.0594705     3.098386
    ## bif3   -2.5580184     3.151075
    ## bif4   -1.3297106     3.058334
    ## bif5   -2.5274199     3.156813
    ## bif6   -1.3978077     3.039492
    ## bif7   -0.8197853     2.968803
    ## bif8   -2.7965957     3.098729
    ## bif9   -0.9277472     3.042709

## Sánchez et al (2021)

``` r
anova(log_model_sanchez, log_model_sanchez_rs)
```

    ## Data: sanchez_long
    ## Models:
    ## log_model_sanchez: bif_response ~ as.factor(Distance_condition) + (1 | ID) + (1 | item)
    ## log_model_sanchez_rs: bif_response ~ as.factor(Distance_condition) + (1 | ID) + (1 + as.factor(Distance_condition) | item)
    ##                      npar   AIC   BIC  logLik deviance  Chisq Df Pr(>Chisq)  
    ## log_model_sanchez       4 15195 15224 -7593.5    15187                       
    ## log_model_sanchez_rs    6 15190 15235 -7589.1    15178 8.6417  2    0.01329 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

This likelihood ratio test indicated that adding random slopes for BIF
items for the temporal distance manipulation significantly improved the
model.

``` r
summary(log_model_sanchez_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif_response ~ as.factor(Distance_condition) + (1 | ID) + (1 +  
    ##     as.factor(Distance_condition) | item)
    ##    Data: sanchez_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  15190.3  15234.7  -7589.1  15178.3    12119 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4986 -0.8337  0.3861  0.7903  3.5040 
    ## 
    ## Random effects:
    ##  Groups Name                           Variance Std.Dev. Corr 
    ##  ID     (Intercept)                    0.63420  0.7964        
    ##  item   (Intercept)                    0.44142  0.6644        
    ##         as.factor(Distance_condition)2 0.04628  0.2151   -0.21
    ## Number of obs: 12125, groups:  ID, 484; item, 25
    ## 
    ## Fixed effects:
    ##                                Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)                     0.01844    0.14526   0.127  0.89900   
    ## as.factor(Distance_condition)2  0.25517    0.09348   2.730  0.00634 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## as.fct(D_)2 -0.340

However, we still see that there is relatively little variation in
random slopes.

We can examine the estimated random slopes directly:

``` r
coef(log_model_sanchez_rs)$item
```

    ##        (Intercept) as.factor(Distance_condition)2
    ## BIF01 -0.007553246                     0.19532220
    ## BIF02  0.688851998                     0.56699563
    ## BIF03  0.158530243                     0.35110618
    ## BIF04 -0.682576766                    -0.02865776
    ## BIF05  1.157740532                    -0.13140134
    ## BIF06 -0.179992282                     0.30769837
    ## BIF07  0.304853226                     0.16589800
    ## BIF08 -0.712946123                     0.27749176
    ## BIF09  0.153679466                     0.19581493
    ## BIF10  0.087185123                     0.25705696
    ## BIF11 -1.567600529                     0.39605492
    ## BIF12  0.664033668                     0.26913524
    ## BIF13 -0.024151906                     0.10371522
    ## BIF14 -0.190241434                     0.32810839
    ## BIF15 -0.010403796                     0.47266948
    ## BIF16  0.784399398                     0.27355595
    ## BIF17 -0.568769673                     0.25260740
    ## BIF18 -0.151829156                     0.28721958
    ## BIF19 -0.312456937                     0.19697127
    ## BIF20  0.747763997                     0.13900889
    ## BIF21 -0.580412274                     0.50842296
    ## BIF22  0.133294273                     0.23683571
    ## BIF23 -0.716801072                     0.07822255
    ## BIF24 -0.069734080                     0.40998275
    ## BIF25  1.261835634                     0.22185403

Although there is certainly some variation, it is not so extensive that
it obscures the apparent effect of the distance manipulation. Note there
are there only two items for which the distance manipulation is
estimated to have a negative effect (i.e., opposite the predicted
direction), and these slopes are estimated to be quite small.

## Grinfeld et al (2021)

``` r
anova(log_model_grinfeld_2b, log_model_grinfeld_2b_rs)
```

    ## Data: grinfeld_2b_long
    ## Models:
    ## log_model_grinfeld_2b: bif ~ condition + (1 | workerId) + (1 | item)
    ## log_model_grinfeld_2b_rs: bif ~ condition + (1 | workerId) + (1 + condition | item)
    ##                          npar    AIC    BIC  logLik deviance  Chisq Df Pr(>Chisq)
    ## log_model_grinfeld_2b       4 8925.4 8953.8 -4458.7   8917.4                     
    ## log_model_grinfeld_2b_rs    6 8927.6 8970.2 -4457.8   8915.6 1.7925  2     0.4081

``` r
anova(log_model_grinfeld_2c, log_model_grinfeld_2c_rs)
```

    ## Data: grinfeld_2c_long
    ## Models:
    ## log_model_grinfeld_2c: bif ~ condition + (1 | workerId) + (1 | item)
    ## log_model_grinfeld_2c_rs: bif ~ condition + (1 | workerId) + (1 + condition | item)
    ##                          npar    AIC    BIC  logLik deviance  Chisq Df Pr(>Chisq)
    ## log_model_grinfeld_2c       4 2200.3 2223.7 -1096.2   2192.3                     
    ## log_model_grinfeld_2c_rs    6 2203.0 2237.9 -1095.5   2191.0 1.3981  2     0.4971

``` r
anova(log_model_grinfeld_2c_rep, log_model_grinfeld_2c_rep_rs)
```

    ## Data: grinfeld_2c_rep_long
    ## Models:
    ## log_model_grinfeld_2c_rep: bif ~ condition + (1 | workerId) + (1 | item)
    ## log_model_grinfeld_2c_rep_rs: bif ~ condition + (1 | workerId) + (1 + condition | item)
    ##                              npar    AIC    BIC  logLik deviance  Chisq Df Pr(>Chisq)
    ## log_model_grinfeld_2c_rep       4 2386.7 2410.0 -1189.4   2378.7                     
    ## log_model_grinfeld_2c_rep_rs    6 2389.7 2424.6 -1188.8   2377.7 1.0506  2     0.5914

Each of these likelihood ratio tests indicates that adding random slopes
for each BIF item for the psychological distance conditions did not
significantly improve the model, in each of these experiments from
Grinfeld et al (2021).

``` r
summary(log_model_grinfeld_2b_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | workerId) + (1 + condition | item)
    ##    Data: grinfeld_2b_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   8927.6   8970.2  -4457.8   8915.6     9019 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -5.2388 -0.5681  0.1368  0.5522  5.6438 
    ## 
    ## Random effects:
    ##  Groups   Name                  Variance Std.Dev. Corr
    ##  workerId (Intercept)           4.84567  2.2013       
    ##  item     (Intercept)           0.58293  0.7635       
    ##           conditionhypothetical 0.01113  0.1055   0.79
    ## Number of obs: 9025, groups:  workerId, 361; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)             0.6016     0.2298   2.617  0.00886 **
    ## conditionhypothetical  -0.1127     0.2429  -0.464  0.64261   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## cndtnhyptht -0.482

``` r
summary(log_model_grinfeld_2c_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | workerId) + (1 + condition | item)
    ##    Data: grinfeld_2c_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   2203.0   2237.9  -1095.5   2191.0     2494 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -8.1147 -0.4039  0.1235  0.4360  5.3187 
    ## 
    ## Random effects:
    ##  Groups   Name                  Variance Std.Dev. Corr
    ##  workerId (Intercept)           6.4966   2.5488       
    ##  item     (Intercept)           0.3996   0.6321       
    ##           conditionhypothetical 0.0261   0.1616   1.00
    ## Number of obs: 2500, groups:  workerId, 100; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)            -0.1329     0.3964  -0.335  0.73733   
    ## conditionhypothetical   1.7418     0.5351   3.255  0.00113 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## cndtnhyptht -0.646
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.002175 (tol = 0.002, component 1)

``` r
summary(log_model_grinfeld_2c_rep_rs)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | workerId) + (1 + condition | item)
    ##    Data: grinfeld_2c_rep_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   2389.7   2424.6  -1188.8   2377.7     2494 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -4.1183 -0.4573  0.1437  0.5127  5.6861 
    ## 
    ## Random effects:
    ##  Groups   Name                  Variance Std.Dev. Corr
    ##  workerId (Intercept)           5.92540  2.4342       
    ##  item     (Intercept)           0.64208  0.8013       
    ##           conditionhypothetical 0.05001  0.2236   0.48
    ## Number of obs: 2500, groups:  workerId, 100; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)            0.53731    0.39028   1.377    0.169
    ## conditionhypothetical  0.06203    0.50896   0.122    0.903
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## cndtnhyptht -0.620

Unsurprisingly given the results above, we see very little variation in
random slopes across these three experiments.

When we examine the specific estimated random slopes, we can see that
the estimates accordingly cluster tightly around the overall estimated
effect of the manipulation. Where the effect is estimated close to zero,
the random slopes are tightly distributed near zero, and where the
estimated effect is positive, the random slopes are all positive with
little variation. Again, it appears that BIF items did not substantially
interact with these manipulations.

``` r
coef(log_model_grinfeld_2b_rs)$item
```

    ##               (Intercept) conditionhypothetical
    ## apple         -0.03976990           -0.19685991
    ## army           0.84286714           -0.08583959
    ## car            0.88984770           -0.03383308
    ## carpet         0.87681697           -0.09385314
    ## cavity         0.33773218           -0.15676358
    ## child          0.71042817           -0.09134941
    ## chop           0.05907267           -0.17539113
    ## cleaning       0.10812992           -0.16472534
    ## climbing      -0.09029341           -0.19255421
    ## doorbell       2.16368884            0.07086587
    ## eating         0.62899117           -0.10508391
    ## garden         0.14094819           -0.16140377
    ## greeting      -0.15794460           -0.18812624
    ## list           0.66351134           -0.12816591
    ## locking        2.07139650            0.04573391
    ## painting       0.85910586           -0.07855374
    ## personality    0.92582157           -0.07196384
    ## plants        -1.36282245           -0.32592790
    ## reading        1.39476240           -0.03491397
    ## rent           1.09475465           -0.04766643
    ## temptation    -0.10762754           -0.18104681
    ## test           0.35437738           -0.16077785
    ## toothbrushing  1.01094003           -0.08061497
    ## voting         0.71042817           -0.09134941
    ## washing        0.12554514           -0.18001816

``` r
coef(log_model_grinfeld_2c_rs)$item
```

    ##               (Intercept) conditionhypothetical
    ## apple         -0.98616203              1.523743
    ## army           0.05792267              1.790588
    ## car            0.37703334              1.872146
    ## carpet         0.33497205              1.861397
    ## cavity        -0.42006381              1.668424
    ## child         -0.09057352              1.752635
    ## chop          -0.53559548              1.638898
    ## cleaning      -0.56195887              1.632159
    ## climbing      -0.78075331              1.576241
    ## doorbell       0.86769745              1.997550
    ## eating         0.18100850              1.822046
    ## garden        -0.57398200              1.629087
    ## greeting      -0.63862056              1.612567
    ## list           0.11224658              1.804472
    ## locking        0.65390068              1.942908
    ## painting      -0.04966682              1.763091
    ## personality   -0.11656486              1.745993
    ## plants        -1.50710833              1.390601
    ## reading        0.32059689              1.857722
    ## rent           0.19508529              1.825644
    ## temptation    -0.70315891              1.596072
    ## test          -0.27472121              1.705572
    ## toothbrushing  0.65390068              1.942908
    ## voting         0.20919028              1.829249
    ## washing       -0.56195887              1.632159

``` r
coef(log_model_grinfeld_2c_rep_rs)$item
```

    ##                (Intercept) conditionhypothetical
    ## apple         -0.005655347          -0.038278047
    ## army           0.276323672           0.030125432
    ## car            1.534284845           0.190676355
    ## carpet         1.254692697           0.175375693
    ## cavity        -0.162960544          -0.148117396
    ## child          0.807815831           0.111764488
    ## chop           0.216595972           0.035223470
    ## cleaning      -0.417518888          -0.033284743
    ## climbing      -0.422714812          -0.001906987
    ## doorbell       1.461598192           0.194767133
    ## eating         0.744819237           0.116531672
    ## garden        -0.044218255          -0.158481769
    ## greeting      -0.139884879           0.066137539
    ## list           0.857408967           0.202210648
    ## locking        1.664494839           0.344439337
    ## painting       0.871388533           0.107032855
    ## personality    0.866692794           0.138743723
    ## plants        -1.262334845          -0.216005942
    ## reading        1.530248760           0.222889020
    ## rent           1.141667282           0.024809278
    ## temptation    -0.173329523          -0.085410228
    ## test           0.401438250          -0.011450537
    ## toothbrushing  0.930930314           0.134085212
    ## voting         0.456783170           0.014945523
    ## washing        0.630119723           0.063040213

# Summary

In short, there is little evidence to suggest that psychological
distance manipulations produce widely different effects across different
BIF items. The variation may not be nil, but across many experiments,
estimated random slopes suggest that the BIF items function generally
quite similarly in response to a manipulation.
