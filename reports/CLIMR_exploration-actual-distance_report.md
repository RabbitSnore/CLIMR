Construal Level International Multilab Replication (CLIMR) Project:
Influence of Actual Distance on the Spatial Distance Effect
================
CLIMR Team
2024-12-05

# Does the actual distance between the cities used in the spatial distance manipulation influence the effect of the manipulation on the BIF?

``` r
lrt_km_spatial
```

    ## Data: data_bif_spatial %>% filter(complete.cases(haversine))
    ## Models:
    ## glmm_spatial_km_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_km_add: bif ~ condition + haversine_rescale + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_km_int: bif ~ condition * haversine_rescale + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                      npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_spatial_km_base    5 44984 45027 -22487    44974                     
    ## glmm_spatial_km_add     6 44984 45036 -22486    44972 1.7054  1     0.1916
    ## glmm_spatial_km_int     7 44986 45046 -22486    44972 0.3783  1     0.5385

``` r
summary(glmm_spatial_km_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial %>% filter(complete.cases(haversine))
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44983.9  45026.7 -22486.9  44973.9    38437 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9148 -0.8235  0.4210  0.6499  2.9666 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.77348  0.8795  
    ##  lab     (Intercept) 0.06563  0.2562  
    ##  item    (Intercept) 0.46114  0.6791  
    ## Number of obs: 38442, groups:  lab:sub, 2958; lab, 77; item, 13
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.70143    0.19284   3.637 0.000275 ***
    ## conditiondistant  0.04446    0.04030   1.103 0.270005    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.104

``` r
summary(glmm_spatial_km_add)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + haversine_rescale + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_spatial %>% filter(complete.cases(haversine))
    ## Control: glmerControl(optimizer = "bobyqa")
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44984.2  45035.5 -22486.1  44972.2    38436 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9128 -0.8230  0.4211  0.6498  2.9622 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.77374  0.8796  
    ##  lab     (Intercept) 0.06287  0.2507  
    ##  item    (Intercept) 0.46109  0.6790  
    ## Number of obs: 38442, groups:  lab:sub, 2958; lab, 77; item, 13
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        0.702767   0.192794   3.645 0.000267 ***
    ## conditiondistant   0.044552   0.040310   1.105 0.269063    
    ## haversine_rescale -0.003359   0.002548  -1.318 0.187409    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.104       
    ## havrsn_rscl -0.005 -0.002

``` r
summary(glmm_spatial_km_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * haversine_rescale + (1 | lab:sub) + (1 | lab) +      (1 | item)
    ##    Data: data_bif_spatial %>% filter(complete.cases(haversine))
    ## Control: glmerControl(optimizer = "bobyqa")
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  44985.8  45045.7 -22485.9  44971.8    38435 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9110 -0.8230  0.4208  0.6496  2.9683 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.77355  0.8795  
    ##  lab     (Intercept) 0.06288  0.2508  
    ##  item    (Intercept) 0.46111  0.6790  
    ## Number of obs: 38442, groups:  lab:sub, 2958; lab, 77; item, 13
    ## 
    ## Fixed effects:
    ##                                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                         0.702809   0.192681   3.648 0.000265 ***
    ## conditiondistant                    0.044361   0.040305   1.101 0.271055    
    ## haversine_rescale                  -0.004233   0.002915  -1.452 0.146503    
    ## conditiondistant:haversine_rescale  0.001745   0.002827   0.617 0.537111    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd hvrsn_
    ## condtndstnt -0.104              
    ## havrsn_rscl -0.004  0.002       
    ## cndtndstn:_  0.000 -0.007 -0.486

# Does the actual distance between the cities used in the spatial distance manipulation influence the strength of the spatial distance manipulation?

``` r
meta_spatial_mc_km
```

    ## 
    ## Multivariate Meta-Analysis Model (k = 77; method: REML)
    ## 
    ## Variance Components: none
    ## 
    ## Test for Residual Heterogeneity:
    ## QE(df = 75) = 157.1653, p-val < .0001
    ## 
    ## Test of Moderators (coefficient 2):
    ## QM(df = 1) = 17.6278, p-val < .0001
    ## 
    ## Model Results:
    ## 
    ##            estimate      se     zval    pval   ci.lb   ci.ub      
    ## intrcpt      1.0007  0.0590  16.9737  <.0001  0.8852  1.1163  *** 
    ## haversine    0.0001  0.0000   4.1985  <.0001  0.0001  0.0002  *** 
    ## 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
knitr::include_graphics("figures/climr_spatial-actual-distance-cause-size.png")
```

<img src="figures/climr_spatial-actual-distance-cause-size.png" width="1800" />
