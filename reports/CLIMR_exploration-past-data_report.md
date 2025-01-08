Construal Level International Multilab Replication (CLIMR) Project:
Analysis of BIF Response Option Valence Differences in Past Data –
Sánchez et al (2021)
================
CLIMR Team
2025-01-07

# Re-Analysis of Sánchez et al (2021) BIF data

Given that we unexpectedly found a significant interaction between the
distance manipulation and BIF response option valence differences for
the temporal distance replication, it may be worthwhile to examine
whether there is evidence for the influence of this confound in previous
data.

To explore this possibility, we fit a series of mixed effects logistic
regression models on the BIF item responses in the data of Sánchez et al
(2021) in which we examine a potential interaction between the temporal
distance manipulation in this study and valence differences in the item
response options.

``` r
lrt_val_sanchez
```

    ## Data: sanchez_long
    ## Models:
    ## glmm_sanchez_bif_base: bif ~ condition + (1 | ID) + (1 | item)
    ## glmm_sanchez_bif_val: bif ~ condition + d + (1 | ID) + (1 | item)
    ## glmm_sanchez_bif_int: bif ~ condition * d + (1 | ID) + (1 | item)
    ##                       npar   AIC   BIC  logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_sanchez_bif_base    4 15195 15224 -7593.5    15187                          
    ## glmm_sanchez_bif_val     5 15177 15214 -7583.4    15167 20.1102  1  7.311e-06 ***
    ## glmm_sanchez_bif_int     6 15175 15219 -7581.3    15163  4.1917  1    0.04062 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

A likelihood ratio test indicates that adding the valence differences
and the interaction term significantly improves the model.

``` r
summary(glmm_sanchez_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | ID) + (1 | item)
    ##    Data: sanchez_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  15174.6  15219.0  -7581.3  15162.6    12119 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.6454 -0.8406  0.3882  0.7966  3.4799 
    ## 
    ## Random effects:
    ##  Groups Name        Variance Std.Dev.
    ##  ID     (Intercept) 0.6315   0.7947  
    ##  item   (Intercept) 0.1821   0.4267  
    ## Number of obs: 12125, groups:  ID, 484; item, 25
    ## 
    ## Fixed effects:
    ##              Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)  -0.99397    0.22966  -4.328 1.50e-05 ***
    ## condition2    0.06001    0.12609   0.476   0.6341    
    ## d             1.23350    0.24970   4.940 7.81e-07 ***
    ## condition2:d  0.23907    0.11609   2.059   0.0395 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtn2 d     
    ## condition2  -0.273              
    ## d           -0.893  0.173       
    ## conditin2:d  0.204 -0.754 -0.226

Although Sánchez et al (2021) reported a significant effect for temporal
distance on the BIF, accounting for the interaction with the valence
difference confound, this effect becomes near-zero and nonsignificant.
The interaction is such that as the valence difference increases, the
effect of the distance manipulation increases in magnitude. Converting
from the log odds scale to *d*, the effect for the distance manipulation
when the valence difference is zero is *d* = 0.03, 95% CI \[-0.10,
0.17\].

This interaction is in a direction opposite to what was observed in the
CLIMR replication of the temporal distance effect.

## Models Not Retained

``` r
summary(glmm_sanchez_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | ID) + (1 | item)
    ##    Data: sanchez_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  15194.9  15224.5  -7593.5  15186.9    12121 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.7536 -0.8381  0.3881  0.7894  3.3665 
    ## 
    ## Random effects:
    ##  Groups Name        Variance Std.Dev.
    ##  ID     (Intercept) 0.6303   0.7939  
    ##  item   (Intercept) 0.4212   0.6490  
    ## Number of obs: 12125, groups:  ID, 484; item, 25
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)  0.01765    0.14233   0.124  0.90131   
    ## condition2   0.25595    0.08271   3.094  0.00197 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr)
    ## condition2 -0.290

``` r
summary(glmm_sanchez_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | ID) + (1 | item)
    ##    Data: sanchez_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  15176.8  15213.8  -7583.4  15166.8    12120 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.8053 -0.8389  0.3890  0.7893  3.4018 
    ## 
    ## Random effects:
    ##  Groups Name        Variance Std.Dev.
    ##  ID     (Intercept) 0.6302   0.7939  
    ##  item   (Intercept) 0.1822   0.4269  
    ## Number of obs: 12125, groups:  ID, 484; item, 25
    ## 
    ## Fixed effects:
    ##             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept) -1.09165    0.22503  -4.851 1.23e-06 ***
    ## condition2   0.25596    0.08272   3.094  0.00197 ** 
    ## d            1.35146    0.24342   5.552 2.82e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##            (Intr) cndtn2
    ## condition2 -0.186       
    ## d          -0.888  0.003

# Reanalysis of Grinfeld et al (2024, Study 2C) BIF data

We can also examine data from Grinfeld et al (2024, Study 2C) to see if
a similar interaction occurs.

``` r
lrt_val_grinfeld
```

    ## Data: grinfeld_2c_long
    ## Models:
    ## glmm_grinfeld_bif_base: bif ~ condition + (1 | workerId) + (1 | item)
    ## glmm_grinfeld_bif_val: bif ~ condition + d + (1 | workerId) + (1 | item)
    ## glmm_grinfeld_bif_int: bif ~ condition * d + (1 | workerId) + (1 | item)
    ##                        npar    AIC    BIC  logLik deviance   Chisq Df Pr(>Chisq)    
    ## glmm_grinfeld_bif_base    4 2200.3 2223.7 -1096.2   2192.3                          
    ## glmm_grinfeld_bif_val     5 2179.8 2208.9 -1084.9   2169.8 22.6024  1  1.992e-06 ***
    ## glmm_grinfeld_bif_int     6 2181.1 2216.0 -1084.5   2169.1  0.6797  1     0.4097    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

A likelihood ratio test indicates significant model improvement when
adding valence differences as a predictor but not the interaction term.

``` r
summary(glmm_grinfeld_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | workerId) + (1 | item)
    ##    Data: grinfeld_2c_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   2179.8   2208.9  -1084.9   2169.8     2495 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -7.9627 -0.4106  0.1254  0.4380  5.8134 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  workerId (Intercept) 6.4986   2.5492  
    ##  item     (Intercept) 0.1494   0.3866  
    ## Number of obs: 2500, groups:  workerId, 100; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)            -1.4711     0.4431  -3.320  0.00090 ***
    ## conditionhypothetical   1.7254     0.5341   3.230  0.00124 ** 
    ## d                       1.6295     0.2695   6.047 1.48e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnh
    ## cndtnhyptht -0.606       
    ## d           -0.500  0.018

Controlling for valence differences, the effect of hypotheticality holds
in this dataset, though there is also evidence that people prefer the
abstract option more when it is positive.

## Models Not Retained

``` r
summary(glmm_grinfeld_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | workerId) + (1 | item)
    ##    Data: grinfeld_2c_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   2200.4   2223.7  -1096.2   2192.4     2496 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -7.4891 -0.4025  0.1193  0.4387  5.4403 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  workerId (Intercept) 6.5096   2.551   
    ##  item     (Intercept) 0.5055   0.711   
    ## Number of obs: 2500, groups:  workerId, 100; item, 25
    ## 
    ## Fixed effects:
    ##                       Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)            -0.1346     0.4020  -0.335  0.73775   
    ## conditionhypothetical   1.7260     0.5343   3.230  0.00124 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## cndtnhyptht -0.658

``` r
summary(glmm_grinfeld_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | workerId) + (1 | item)
    ##    Data: grinfeld_2c_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   2181.1   2216.0  -1084.5   2169.1     2494 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -8.4022 -0.4087  0.1227  0.4319  5.5992 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  workerId (Intercept) 6.491    2.548   
    ##  item     (Intercept) 0.149    0.386   
    ## Number of obs: 2500, groups:  workerId, 100; item, 25
    ## 
    ## Fixed effects:
    ##                         Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)              -1.3578     0.4620  -2.939  0.00329 ** 
    ## conditionhypothetical     1.5073     0.5923   2.545  0.01094 *  
    ## d                         1.4925     0.3129   4.770 1.84e-06 ***
    ## conditionhypothetical:d   0.2758     0.3254   0.847  0.39682    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnh d     
    ## cndtnhyptht -0.647              
    ## d           -0.558  0.236       
    ## cndtnhypth:  0.286 -0.433 -0.510
