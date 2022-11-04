Construal Level International Multilab Replication (CLIMR) Project:
Pretest of Valence Differences in BIF Item Response Options
================
CLIMR Team
2022-11-04

# Overview

The documentation for this pretest is provided here:
<https://osf.io/g6d5v>

# Separate Judgments of Item Response Options

When judged separately, the response options for each item are generally
rated such that the abstract option is more positively valenced than the
concrete option.

``` r
bif_d %>% 
  knitr::kable()
```

| item   |          d |       var |   ci_lower |   ci_upper |
|:-------|-----------:|----------:|-----------:|-----------:|
| bif_01 |  0.9413056 | 0.0074075 |  0.7722754 |  1.1103358 |
| bif_02 |  2.1128505 | 0.0103992 |  1.9125748 |  2.3131263 |
| bif_03 |  0.6141789 | 0.0069821 |  0.4500746 |  0.7782832 |
| bif_04 |  0.1974207 | 0.0066993 |  0.0366743 |  0.3581671 |
| bif_05 |  0.7535554 | 0.0071415 |  0.5875886 |  0.9195222 |
| bif_06 |  1.0019380 | 0.0075060 |  0.8317875 |  1.1720884 |
| bif_07 |  0.8409323 | 0.0072579 |  0.6736173 |  1.0082472 |
| bif_08 |  0.2151093 | 0.0067054 |  0.0542897 |  0.3759288 |
| bif_09 |  1.3391569 | 0.0081661 |  1.1616825 |  1.5166313 |
| bif_10 |  0.6873452 | 0.0070617 |  0.5223079 |  0.8523825 |
| bif_11 | -0.0337728 | 0.0066676 | -0.1941392 |  0.1265936 |
| bif_12 |  1.0657412 | 0.0076163 |  0.8943451 |  1.2371373 |
| bif_13 | -0.3565716 | 0.0067730 | -0.5182000 | -0.1949432 |
| bif_14 |  1.1470927 | 0.0077669 |  0.9740113 |  1.3201742 |
| bif_15 |  0.2175529 | 0.0067062 |  0.0567227 |  0.3783831 |
| bif_16 |  1.2953358 | 0.0080696 |  1.1189134 |  1.4717581 |
| bif_17 |  0.7068331 | 0.0070844 |  0.5415305 |  0.8721356 |
| bif_18 |  0.2825103 | 0.0067334 |  0.1213547 |  0.4436658 |
| bif_19 |  0.9862716 | 0.0074800 |  0.8164166 |  1.1561266 |
| bif_20 |  0.8836155 | 0.0073195 |  0.7155926 |  1.0516383 |
| bif_21 |  0.0359620 | 0.0066677 | -0.1244060 |  0.1963299 |
| bif_22 |  0.9957628 | 0.0074957 |  0.8257293 |  1.1657963 |
| bif_23 |  1.0221313 | 0.0075402 |  0.8515940 |  1.1926687 |
| bif_24 |  1.1472808 | 0.0077672 |  0.9741953 |  1.3203662 |
| bif_25 |  0.7709744 | 0.0071637 |  0.6047498 |  0.9371991 |

Combining across the items, the valence difference in response options
appears to be non-trivial.

``` r
bif_scale_smd
```

    ##           d          var  ci_lower  ci_upper
    ## 1 0.6701145 0.0002816371 0.6372197 0.7030094

# Examination of the Effects of Valence Differences on Response Patterns

To assess the extent to which these valence differences might influence
people’s responses to the BIF items, especially in an situation in which
there is a plausible motvation to provide more positive responses under
some conditions, we examined the data from Yan et al (2016, Experiment
3, 10.1093/jcr/ucw045). In this experiment, participants were provided
with a description of a socially close or socially distant target and
asked to complete the BIF. It is plausible that people would want to
provide more positive responses for a socially close target, not for any
reason related to construal level but for motivational reasons.

The authors of this experiment graciously provided the original data,
which we used to fit models in which we predicted BIF responses using
the social distance manipulation and the BIF valence differences.

As a first look, we fit models predicting BIF responses from the
distance manipulation and tested whether adding random slopes for the
items improved the fit of the model. If there is substantial variance in
the random slopes, that would be an indication that there may extraneous
influences (e.g., valence) on the BIF responses. However, a likelihood
ratio test indicates that there is no significant improvement to the
model offered by adding random slopes.

``` r
lrt_rs
```

    ## Data: yan_exp_3_long
    ## Models:
    ## model_soc: bif ~ mani_social + (1 | id) + (1 | item)
    ## model_rs: bif ~ mani_social + (1 | id) + (1 + mani_social | item)
    ##           npar    AIC    BIC  logLik deviance  Chisq Df Pr(>Chisq)
    ## model_soc    4 6199.2 6225.1 -3095.6   6191.2                     
    ## model_rs     6 6200.8 6239.7 -3094.4   6188.8 2.3869  2     0.3032

Next, we can examine the effect of adding the valence difference for
each item as a predictor in the model and also test if adding an
interaction between valence and the distance manipulation improves the
model.

We see below that a series of LRTs indicates that adding valence does
not offer significant improvement to the model, nor does adding the
interaction term.

``` r
lrt_val
```

    ## Data: yan_exp_3_long
    ## Models:
    ## model_soc: bif ~ mani_social + (1 | id) + (1 | item)
    ## model_val: bif ~ mani_social + d_mc + (1 | id) + (1 | item)
    ## model_val_int: bif ~ mani_social * d_mc + (1 | id) + (1 | item)
    ##               npar    AIC    BIC  logLik deviance  Chisq Df Pr(>Chisq)
    ## model_soc        4 6199.2 6225.1 -3095.6   6191.2                     
    ## model_val        5 6198.9 6231.3 -3094.5   6188.9 2.2583  1     0.1329
    ## model_val_int    6 6200.3 6239.2 -3094.2   6188.3 0.6236  1     0.4297

It can nevertheless be informative to examine the detailed model output.

As can be seen below, if the valence differences (as measured by the
separate judgments) had any influence on the responses to the BIF in
this experiment, those differences were minimal. Moreover, controlling
for the valence differences did not meaningfully change the estimate of
the effect of social distance, suggesting that those effects were
non-redundant.

``` r
summary(model_soc)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ mani_social + (1 | id) + (1 | item)
    ##    Data: yan_exp_3_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   6199.2   6225.1  -3095.6   6191.2     4821 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6705 -1.0386  0.5679  0.7572  1.7042 
    ## 
    ## Random effects:
    ##  Groups Name        Variance Std.Dev.
    ##  id     (Intercept) 0.3429   0.5856  
    ##  item   (Intercept) 0.1125   0.3355  
    ## Number of obs: 4825, groups:  id, 193; item, 25
    ## 
    ## Fixed effects:
    ##              Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)   0.46244    0.09806   4.716 2.41e-06 ***
    ## mani_social2  0.19131    0.10537   1.816   0.0694 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## mani_socil2 -0.493

``` r
summary(model_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ mani_social + d_mc + (1 | id) + (1 | item)
    ##    Data: yan_exp_3_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   6198.9   6231.3  -3094.5   6188.9     4820 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6521 -1.0360  0.5676  0.7574  1.7126 
    ## 
    ## Random effects:
    ##  Groups Name        Variance Std.Dev.
    ##  id     (Intercept) 0.3428   0.5855  
    ##  item   (Intercept) 0.1007   0.3173  
    ## Number of obs: 4825, groups:  id, 193; item, 25
    ## 
    ## Fixed effects:
    ##              Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)   0.46245    0.09561   4.837 1.32e-06 ***
    ## mani_social2  0.19130    0.10536   1.816   0.0694 .  
    ## d_mc          0.21045    0.13681   1.538   0.1240    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) mn_sc2
    ## mani_socil2 -0.505       
    ## d_mc         0.003  0.001

``` r
summary(model_val_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ mani_social * d_mc + (1 | id) + (1 | item)
    ##    Data: yan_exp_3_long
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   6200.3   6239.2  -3094.2   6188.3     4819 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6455 -1.0384  0.5652  0.7569  1.6884 
    ## 
    ## Random effects:
    ##  Groups Name        Variance Std.Dev.
    ##  id     (Intercept) 0.3428   0.5855  
    ##  item   (Intercept) 0.1007   0.3174  
    ## Number of obs: 4825, groups:  id, 193; item, 25
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        0.46296    0.09563   4.841 1.29e-06 ***
    ## mani_social2       0.19016    0.10537   1.805   0.0711 .  
    ## d_mc               0.25409    0.14760   1.721   0.0852 .  
    ## mani_social2:d_mc -0.09648    0.12180  -0.792   0.4283    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) mn_sc2 d_mc  
    ## mani_socil2 -0.506              
    ## d_mc         0.006 -0.005       
    ## mn_scl2:d_m -0.007  0.012 -0.375
