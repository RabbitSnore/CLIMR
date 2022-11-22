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
    ## (Intercept)   -1.8156     0.2000   -9.08   <2e-16 ***
    ## groupdistant   3.0613     0.2188   13.99   <2e-16 ***
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
    ## bif1   -1.4771632     3.031579
    ## bif10  -1.4357127     3.011146
    ## bif11  -1.7896420     3.016134
    ## bif12  -2.1841071     3.122737
    ## bif13  -1.7009671     3.045330
    ## bif14  -2.5607153     3.129834
    ## bif15  -2.2897267     3.131453
    ## bif16  -0.7415234     2.917973
    ## bif17  -2.5065793     3.098615
    ## bif18  -1.7513497     3.015024
    ## bif19  -0.7225259     3.006062
    ## bif2   -0.9270916     3.011805
    ## bif20  -1.9179546     3.068584
    ## bif21  -1.9816550     2.991758
    ## bif22  -2.1906833     3.096864
    ## bif23  -1.5969886     3.042695
    ## bif24  -2.5478196     3.070126
    ## bif25  -2.0594644     3.098361
    ## bif3   -2.5580084     3.151042
    ## bif4   -1.3297043     3.058310
    ## bif5   -2.5274088     3.156778
    ## bif6   -1.3978045     3.039474
    ## bif7   -0.8197864     2.968796
    ## bif8   -2.7965968     3.098714
    ## bif9   -0.9277399     3.042685

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
    ##  workerId (Intercept)           4.84568  2.2013       
    ##  item     (Intercept)           0.58294  0.7635       
    ##           conditionhypothetical 0.01113  0.1055   0.79
    ## Number of obs: 9025, groups:  workerId, 361; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)             0.6016     0.2297   2.618  0.00883 **
    ## conditionhypothetical  -0.1127     0.2428  -0.464  0.64260   
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
    ## (Intercept)            -0.1329     0.3964  -0.335  0.73732   
    ## conditionhypothetical   1.7418     0.5351   3.255  0.00113 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## cndtnhyptht -0.646
    ## optimizer (Nelder_Mead) convergence code: 0 (OK)
    ## Model failed to converge with max|grad| = 0.00217486 (tol = 0.002, component 1)

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
    ## (Intercept)            0.53731    0.39024   1.377    0.169
    ## conditionhypothetical  0.06203    0.50891   0.122    0.903
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
    ## apple         -0.03978320           -0.19683689
    ## army           0.84285482           -0.08581797
    ## car            0.88983767           -0.03381567
    ## carpet         0.87680409           -0.09383047
    ## cavity         0.33771893           -0.15674050
    ## child          0.71041624           -0.09132858
    ## chop           0.05905990           -0.17536908
    ## cleaning       0.10811742           -0.16470377
    ## climbing      -0.09030627           -0.19253206
    ## doorbell       2.16367773            0.07088625
    ## eating         0.62897898           -0.10506263
    ## garden         0.14093569           -0.16138218
    ## greeting      -0.15795692           -0.18810515
    ## list           0.66349786           -0.12814224
    ## locking        2.07138462            0.04575567
    ## painting       0.85909382           -0.07853262
    ## personality    0.92580951           -0.07194265
    ## plants        -1.36283557           -0.32590616
    ## reading        1.39474983           -0.03489156
    ## rent           1.09474293           -0.04764579
    ## temptation    -0.10763977           -0.18102587
    ## test           0.35436387           -0.16075424
    ## toothbrushing  1.01092712           -0.08059219
    ## washing        0.12553183           -0.17999505
    ## voting         0.71041624           -0.09132858

``` r
coef(log_model_grinfeld_2c_rs)$item
```

    ##               (Intercept) conditionhypothetical
    ## apple         -0.98616186              1.523743
    ## army           0.05792263              1.790588
    ## car            0.37703325              1.872146
    ## carpet         0.33497199              1.861397
    ## cavity        -0.42006382              1.668424
    ## child         -0.09057355              1.752635
    ## chop          -0.53559541              1.638898
    ## cleaning      -0.56195882              1.632159
    ## climbing      -0.78075320              1.576240
    ## doorbell       0.86769731              1.997550
    ## eating         0.18100844              1.822046
    ## garden        -0.57398190              1.629087
    ## greeting      -0.63862046              1.612567
    ## list           0.11224653              1.804472
    ## locking        0.65390056              1.942908
    ## painting      -0.04966682              1.763091
    ## personality   -0.11656486              1.745993
    ## plants        -1.50710806              1.390600
    ## reading        0.32059683              1.857722
    ## rent           0.19508525              1.825644
    ## temptation    -0.70315881              1.596072
    ## test          -0.27472116              1.705572
    ## toothbrushing  0.65390056              1.942908
    ## washing       -0.56195882              1.632159
    ## voting         0.20919024              1.829250

``` r
coef(log_model_grinfeld_2c_rep_rs)$item
```

    ##                (Intercept) conditionhypothetical
    ## apple         -0.005655134          -0.038278359
    ## army           0.276323897           0.030125069
    ## car            1.534285062           0.190675939
    ## carpet         1.254692925           0.175375264
    ## cavity        -0.162960366          -0.148117594
    ## child          0.807816059           0.111764086
    ## chop           0.216596202           0.035223095
    ## cleaning      -0.417518650          -0.033285107
    ## climbing      -0.422714562          -0.001907389
    ## doorbell       1.461598415           0.194766703
    ## eating         0.744819471           0.116531257
    ## garden        -0.044218087          -0.158481942
    ## greeting      -0.139884617           0.066137086
    ## list           0.857409228           0.202210142
    ## locking        1.664495110           0.344438745
    ## painting       0.871388756           0.107032466
    ## personality    0.866693030           0.138743295
    ## plants        -1.262334632          -0.216006179
    ## reading        1.530248991           0.222888563
    ## rent           1.141667456           0.024809020
    ## temptation    -0.173329319          -0.085410503
    ## test           0.401438452          -0.011450836
    ## toothbrushing  0.930930545           0.134084796
    ## washing        0.630119942           0.063039850
    ## voting         0.456783379           0.014945199

# Summary

In short, there is little evidence to suggest that psychological
distance manipulations produce widely different effects across different
BIF items. The variation may not be nil, but across many experiments,
estimated random slopes suggest that the BIF items function generally
quite similarly in response to a manipulation.
