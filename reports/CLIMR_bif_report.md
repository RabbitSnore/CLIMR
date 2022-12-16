Construal Level International Multilab Replication (CLIMR) Project:
Examination of Behavior Identification Form (BIF) Item Behavior
================
CLIMR Team
2022-12-16

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

-   The CLIMR validation experiment for the BIF, which attempted a
    direct manipulation of abstraction
-   Sánchez, Coleman, & Ledgerwood (2021), which attempted to manipulate
    temporal distance
-   Grinfeld et al (2021), experiments 2b, 2c, and the replication of
    2c, which attempted to manipulate hypotheticality

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
    ## -5.9671 -0.4573 -0.1194  0.4821  6.0074 
    ## 
    ## Random effects:
    ##  Groups Name         Variance Std.Dev. Corr 
    ##  sub    (Intercept)  4.4341   2.1057        
    ##  item   (Intercept)  0.4439   0.6662        
    ##         groupdistant 0.0126   0.1123   -0.50
    ## Number of obs: 10808, groups:  sub, 436; item, 25
    ## 
    ## Fixed effects:
    ##              Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)   -1.8156     0.1999  -9.081   <2e-16 ***
    ## groupdistant   3.0613     0.2188  13.993   <2e-16 ***
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
    ## bif1   -1.4771635     3.031588
    ## bif10  -1.4357135     3.011155
    ## bif11  -1.7896435     3.016146
    ## bif12  -2.1841061     3.122745
    ## bif13  -1.7009675     3.045340
    ## bif14  -2.5607149     3.129844
    ## bif15  -2.2897256     3.131460
    ## bif16  -0.7415255     2.917984
    ## bif17  -2.5065798     3.098627
    ## bif18  -1.7513511     3.015036
    ## bif19  -0.7225258     3.006066
    ## bif2   -0.9270916     3.011811
    ## bif20  -1.9179547     3.068593
    ## bif21  -1.9816577     2.991774
    ## bif22  -2.1906831     3.096873
    ## bif23  -1.5969888     3.042703
    ## bif24  -2.5478212     3.070140
    ## bif25  -2.0594639     3.098370
    ## bif3   -2.5580073     3.151050
    ## bif4   -1.3297037     3.058316
    ## bif5   -2.5274073     3.156786
    ## bif6   -1.3978045     3.039482
    ## bif7   -0.8197874     2.968804
    ## bif8   -2.7965980     3.098728
    ## bif9   -0.9277392     3.042688

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
    ## Formula: bif_response ~ as.factor(Distance_condition) + (1 | ID) + (1 +      as.factor(Distance_condition) | item)
    ##    Data: sanchez_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  15190.3  15234.7  -7589.1  15178.3    12119 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.4986 -0.8337  0.3860  0.7903  3.5040 
    ## 
    ## Random effects:
    ##  Groups Name                           Variance Std.Dev. Corr 
    ##  ID     (Intercept)                    0.63420  0.7964        
    ##  item   (Intercept)                    0.44143  0.6644        
    ##         as.factor(Distance_condition)2 0.04628  0.2151   -0.21
    ## Number of obs: 12125, groups:  ID, 484; item, 25
    ## 
    ## Fixed effects:
    ##                                Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)                     0.01845    0.14525   0.127  0.89891   
    ## as.factor(Distance_condition)2  0.25517    0.09347   2.730  0.00634 **
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
    ## BIF01 -0.007553661                     0.19532568
    ## BIF02  0.688855707                     0.56699288
    ## BIF03  0.158531647                     0.35110674
    ## BIF04 -0.682579390                    -0.02865140
    ## BIF05  1.157733351                    -0.13138483
    ## BIF06 -0.179991012                     0.30769872
    ## BIF07  0.304852026                     0.16590329
    ## BIF08 -0.712944487                     0.27749083
    ## BIF09  0.153678855                     0.19581898
    ## BIF10  0.087185393                     0.25705939
    ## BIF11 -1.567595127                     0.39604681
    ## BIF12  0.664033384                     0.26913959
    ## BIF13 -0.024153492                     0.10372069
    ## BIF14 -0.190239884                     0.32810825
    ## BIF15 -0.010400613                     0.47266670
    ## BIF16  0.784399025                     0.27356071
    ## BIF17 -0.568768596                     0.25260759
    ## BIF18 -0.151828191                     0.28722049
    ## BIF19 -0.312456948                     0.19697364
    ## BIF20  0.747761787                     0.13901667
    ## BIF21 -0.580407684                     0.50841726
    ## BIF22  0.133294222                     0.23683876
    ## BIF23 -0.716802199                     0.07822627
    ## BIF24 -0.069731628                     0.40998119
    ## BIF25  1.261833840                     0.22186246

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
    ##  item     (Intercept)           0.58294  0.7635       
    ##           conditionhypothetical 0.01113  0.1055   0.79
    ## Number of obs: 9025, groups:  workerId, 361; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)             0.6016     0.2298   2.618  0.00884 **
    ## conditionhypothetical  -0.1127     0.2428  -0.464  0.64258   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## cndtnhyptht -0.481

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
    ## (Intercept)            -0.1329     0.3964  -0.335  0.73734   
    ## conditionhypothetical   1.7418     0.5351   3.255  0.00113 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## cndtnhyptht -0.646
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.00217242 (tol = 0.002, component 1)

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
    ##  workerId (Intercept)           5.92544  2.4342       
    ##  item     (Intercept)           0.64208  0.8013       
    ##           conditionhypothetical 0.05001  0.2236   0.48
    ## Number of obs: 2500, groups:  workerId, 100; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)            0.53731    0.39023   1.377    0.169
    ## conditionhypothetical  0.06204    0.50887   0.122    0.903
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
    ## apple         -0.03977963           -0.19683883
    ## army           0.84285915           -0.08582208
    ## car            0.88984032           -0.03381792
    ## carpet         0.87680891           -0.09383518
    ## cavity         0.33772308           -0.15674368
    ## child          0.71042004           -0.09133188
    ## chop           0.05906322           -0.17537088
    ## cleaning       0.10812061           -0.16470549
    ## climbing      -0.09030313           -0.19253342
    ## doorbell       2.16368335            0.07087842
    ## eating         0.62898283           -0.10506589
    ## garden         0.14093894           -0.16138402
    ## greeting      -0.15795430           -0.18810579
    ## list           0.66350275           -0.12814674
    ## locking        2.07139077            0.04574750
    ## painting       0.85909796           -0.07853654
    ## personality    0.92581378           -0.07194682
    ## plants        -1.36283411           -0.32590314
    ## reading        1.39475534           -0.03489782
    ## rent           1.09474723           -0.04765024
    ## temptation    -0.10763714           -0.18102660
    ## test           0.35436825           -0.16075773
    ## toothbrushing  1.01093219           -0.08059738
    ## voting         0.71042004           -0.09133188
    ## washing        0.12553567           -0.17999756

``` r
coef(log_model_grinfeld_2c_rs)$item
```

    ##               (Intercept) conditionhypothetical
    ## apple         -0.98615788              1.523738
    ## army           0.05792477              1.790587
    ## car            0.37703506              1.872146
    ## carpet         0.33497414              1.861396
    ## cavity        -0.42006175              1.668421
    ## child         -0.09057156              1.752633
    ## chop          -0.53559237              1.638894
    ## cleaning      -0.56195608              1.632156
    ## climbing      -0.78074992              1.576236
    ## doorbell       0.86769895              1.997552
    ## eating         0.18101041              1.822045
    ## garden        -0.57397853              1.629084
    ## greeting      -0.63861707              1.612563
    ## list           0.11224850              1.804471
    ## locking        0.65390228              1.942909
    ## painting      -0.04966435              1.763089
    ## personality   -0.11656238              1.745991
    ## plants        -1.50710306              1.390594
    ## reading        0.32059880              1.857722
    ## rent           0.19508738              1.825644
    ## temptation    -0.70315539              1.596068
    ## test          -0.27471817              1.705570
    ## toothbrushing  0.65390228              1.942909
    ## voting         0.20919255              1.829249
    ## washing       -0.56195608              1.632156

``` r
coef(log_model_grinfeld_2c_rep_rs)$item
```

    ##                (Intercept) conditionhypothetical
    ## apple         -0.005659422          -0.038263781
    ## army           0.276320323           0.030137824
    ## car            1.534282729           0.190686539
    ## carpet         1.254690569           0.175385486
    ## cavity        -0.162966042          -0.148099011
    ## child          0.807813172           0.111775361
    ## chop           0.216592744           0.035235418
    ## cleaning      -0.417522567          -0.033272246
    ## climbing      -0.422718040          -0.001895857
    ## doorbell       1.461596184           0.194776860
    ## eating         0.744816697           0.116542101
    ## garden        -0.044223993          -0.158462493
    ## greeting      -0.139887373           0.066146819
    ## list           0.857407515           0.202217783
    ## locking        1.664494787           0.344443227
    ## painting       0.871385757           0.107044173
    ## personality    0.866690462           0.138753648
    ## plants        -1.262340628          -0.215988769
    ## reading        1.530247100           0.222897771
    ## rent           1.141663115           0.024825199
    ## temptation    -0.173334129          -0.085394573
    ## test           0.401434212          -0.011435885
    ## toothbrushing  0.930927865           0.134095581
    ## voting         0.456779455           0.014959249
    ## washing        0.630116534           0.063052522

# Summary

In short, there is little evidence to suggest that psychological
distance manipulations produce widely different effects across different
BIF items. The variation may not be nil, but across many experiments,
estimated random slopes suggest that the BIF items function generally
quite similarly in response to a manipulation.
