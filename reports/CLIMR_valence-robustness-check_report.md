Construal Level International Multilab Replication (CLIMR) Project:
Robustness Tests Account for Valence Differences in the Response Options
for the Items on the Behavior Identification Form (BIF)
================
CLIMR Team
2023-11-24

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Liberman & Trope (1998, Study 1)

``` r
lrt_val_temporal
```

    ## Data: data_bif_temporal
    ## Models:
    ## glmm_temporal_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_temporal_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                        npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_temporal_bif_base    5 83626 83671 -41808    83616                     
    ## glmm_temporal_bif_val     6 83627 83681 -41807    83615 1.1447  1     0.2847
    ## glmm_temporal_bif_int     7 83629 83692 -41807    83615 0.0056  1     0.9404

``` r
summary(glmm_temporal_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83625.9  83671.1 -41808.0  83615.9    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5548 -0.8897 -0.7019  1.0455  1.7893 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.007115 0.08435 
    ##  lab     (Intercept) 0.055227 0.23501 
    ##  item    (Intercept) 0.009231 0.09608 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.01716    0.03260   0.527    0.598    
    ## conditiondistant -0.48041    0.01713 -28.047   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.248

``` r
summary(glmm_temporal_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83626.8  83681.0 -41807.4  83614.8    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5514 -0.8899 -0.7018  1.0454  1.7904 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.007115 0.08435 
    ##  lab     (Intercept) 0.055220 0.23499 
    ##  item    (Intercept) 0.008739 0.09348 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.06733    0.05649   1.192    0.233    
    ## conditiondistant -0.48041    0.01713 -28.048   <2e-16 ***
    ## d                -0.06115    0.05650  -1.082    0.279    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.144       
    ## d           -0.820  0.001

``` r
summary(glmm_temporal_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_temporal
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83628.8  83692.0 -41807.4  83614.8    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.5518 -0.8900 -0.7018  1.0454  1.7909 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.007116 0.08435 
    ##  lab     (Intercept) 0.055219 0.23499 
    ##  item    (Intercept) 0.008739 0.09348 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         0.066013   0.059153   1.116    0.264    
    ## conditiondistant   -0.477620   0.041007 -11.647   <2e-16 ***
    ## d                  -0.059541   0.060417  -0.985    0.324    
    ## conditiondistant:d -0.003407   0.045480  -0.075    0.940    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.327              
    ## d           -0.838  0.323       
    ## cndtndstnt:  0.297 -0.909 -0.355

# Fujita et al. (2006, Study 1)

``` r
lrt_val_spatial
```

    ## Data: data_bif_spatial
    ## Models:
    ## glmm_spatial_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_spatial_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                       npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_spatial_bif_base    5 83190 83235 -41590    83180                     
    ## glmm_spatial_bif_val     6 83192 83246 -41590    83180 0.0006  1     0.9812
    ## glmm_spatial_bif_int     7 83193 83256 -41590    83179 0.8461  1     0.3577

``` r
summary(glmm_spatial_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83189.9  83235.1 -41590.0  83179.9    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4177 -0.8723 -0.6916  1.0563  1.7972 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.010519 0.10256 
    ##  lab     (Intercept) 0.052073 0.22820 
    ##  item    (Intercept) 0.009673 0.09835 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.01740    0.03250  -0.535    0.592    
    ## conditiondistant -0.49537    0.01734 -28.574   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.259

``` r
summary(glmm_spatial_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83191.9  83246.1 -41590.0  83179.9    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4177 -0.8723 -0.6916  1.0562  1.7973 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.010519 0.10256 
    ##  lab     (Intercept) 0.052073 0.22820 
    ##  item    (Intercept) 0.009673 0.09835 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.016256   0.058308  -0.279    0.780    
    ## conditiondistant -0.495371   0.017336 -28.574   <2e-16 ***
    ## d                -0.001391   0.059014  -0.024    0.981    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.144       
    ## d           -0.830  0.000

``` r
summary(glmm_spatial_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_spatial
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83193.1  83256.3 -41589.5  83179.1    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4183 -0.8720 -0.6914  1.0555  1.7913 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.010522 0.10258 
    ##  lab     (Intercept) 0.052075 0.22820 
    ##  item    (Intercept) 0.009667 0.09832 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                      Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         0.0004094  0.0610523   0.007    0.995    
    ## conditiondistant   -0.5297874  0.0412474 -12.844   <2e-16 ***
    ## d                  -0.0217108  0.0630072  -0.345    0.730    
    ## conditiondistant:d  0.0419568  0.0456154   0.920    0.358    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.327              
    ## d           -0.847  0.318       
    ## cndtndstnt:  0.297 -0.907 -0.351

# Social Distance (Paradigmatic Replication)

``` r
lrt_val_social
```

    ## Data: data_bif_social
    ## Models:
    ## glmm_social_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_social_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                      npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)  
    ## glmm_social_bif_base    5 83631 83676 -41811    83621                       
    ## glmm_social_bif_val     6 83630 83685 -41809    83618 2.8341  1    0.09228 .
    ## glmm_social_bif_int     7 83632 83696 -41809    83618 0.0152  1    0.90172  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
summary(glmm_social_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83631.1  83676.3 -41810.6  83621.1    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4843 -0.8825 -0.7139  1.0468  1.7623 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.00937  0.0968  
    ##  lab     (Intercept) 0.04666  0.2160  
    ##  item    (Intercept) 0.01096  0.1047  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)       0.008084   0.032465   0.249    0.803    
    ## conditiondistant -0.462814   0.017184 -26.933   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.263

``` r
summary(glmm_social_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83630.3  83684.5 -41809.2  83618.3    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4804 -0.8822 -0.7137  1.0464  1.7639 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.009372 0.09681 
    ##  lab     (Intercept) 0.046646 0.21598 
    ##  item    (Intercept) 0.009590 0.09793 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.07546    0.05764  -1.309   0.1905    
    ## conditiondistant -0.46281    0.01718 -26.933   <2e-16 ***
    ## d                 0.10183    0.05876   1.733   0.0831 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.147       
    ## d           -0.836 -0.002

``` r
summary(glmm_social_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_social
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83632.3  83695.5 -41809.1  83618.3    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4806 -0.8822 -0.7136  1.0465  1.7648 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.009371 0.09681 
    ##  lab     (Intercept) 0.046646 0.21598 
    ##  item    (Intercept) 0.009590 0.09793 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                     Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.073172   0.060518  -1.209    0.227    
    ## conditiondistant   -0.467428   0.041097 -11.374   <2e-16 ***
    ## d                   0.099045   0.062916   1.574    0.115    
    ## conditiondistant:d  0.005612   0.045422   0.124    0.902    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.336              
    ## d           -0.853  0.325       
    ## cndtndstnt:  0.305 -0.908 -0.358

# Likelihood Distance (Paradigmatic Replication)

``` r
lrt_val_likelihood
```

    ## Data: data_bif_likelihood
    ## Models:
    ## glmm_likelihood_bif_base: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_bif_val: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ## glmm_likelihood_bif_int: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##                          npar   AIC   BIC logLik deviance  Chisq Df Pr(>Chisq)
    ## glmm_likelihood_bif_base    5 83137 83182 -41563    83127                     
    ## glmm_likelihood_bif_val     6 83138 83192 -41563    83126 0.7970  1     0.3720
    ## glmm_likelihood_bif_int     7 83139 83203 -41563    83125 0.8384  1     0.3599

``` r
summary(glmm_likelihood_bif_base)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83136.9  83182.1 -41563.5  83126.9    61870 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4757 -0.8663 -0.6895  1.0631  1.8842 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.008891 0.09429 
    ##  lab     (Intercept) 0.059122 0.24315 
    ##  item    (Intercept) 0.008749 0.09354 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.05129    0.03298  -1.555     0.12    
    ## conditiondistant -0.45755    0.01724 -26.546   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr)
    ## condtndstnt -0.252

``` r
summary(glmm_likelihood_bif_val)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition + d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83138.1  83192.3 -41563.1  83126.1    61869 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4717 -0.8661 -0.6893  1.0631  1.8815 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.008891 0.09429 
    ##  lab     (Intercept) 0.059116 0.24314 
    ##  item    (Intercept) 0.008420 0.09176 
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.01018    0.05621  -0.181    0.856    
    ## conditiondistant -0.45755    0.01724 -26.546   <2e-16 ***
    ## d                -0.05010    0.05567  -0.900    0.368    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd
    ## condtndstnt -0.148       
    ## d           -0.812  0.001

``` r
summary(glmm_likelihood_bif_int)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
    ##  Family: binomial  ( logit )
    ## Formula: bif ~ condition * d + (1 | lab:sub) + (1 | lab) + (1 | item)
    ##    Data: data_bif_likelihood
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##  83139.3  83202.5 -41562.6  83125.3    61868 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -1.4802 -0.8666 -0.6893  1.0634  1.8939 
    ## 
    ## Random effects:
    ##  Groups  Name        Variance Std.Dev.
    ##  lab:sub (Intercept) 0.008893 0.0943  
    ##  lab     (Intercept) 0.059117 0.2431  
    ##  item    (Intercept) 0.008427 0.0918  
    ## Number of obs: 61875, groups:  lab:sub, 2475; lab, 99; item, 25
    ## 
    ## Fixed effects:
    ##                    Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)        -0.02667    0.05904  -0.452    0.651    
    ## conditiondistant   -0.42331    0.04117 -10.283   <2e-16 ***
    ## d                  -0.03000    0.05987  -0.501    0.616    
    ## conditiondistant:d -0.04180    0.04565  -0.916    0.360    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) cndtnd d     
    ## condtndstnt -0.336              
    ## d           -0.832  0.334       
    ## cndtndstnt:  0.305 -0.908 -0.367
