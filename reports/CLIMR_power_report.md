Construal Level International Multilab Replication (CLIMR) Project:
Power Analysis Report
================
CLIMR Team
2023-11-24

# **THESE RESULTS ARE SIMULATED. DO NOT INTERPRET.**

# Power Figure

``` r
knitr::include_graphics("./figures/climr_power_figure.png")
```

<img src="./figures/climr_power_figure.png" width="4500" />

# Power Analyses for Each Replication

## Liberman & Trope (1998, Study 1)

### What sample sizes are needed for 80% and 95% power to detect the replication effect?

``` r
power_80_n_temporal
```

    ## [1] 162.3499

``` r
power_95_n_temporal
```

    ## [1] 267.5077

### What proportion of previous experiments had at least 80% power to detect effects the size of the replication effect?

``` r
smaller_prop_temporal
```

    ## [1] 0.14

### What is the median power for the replication effect that the previous experiments samples provided?

``` r
median_power_temporal
```

    ## [1] 0.4408179

## Fujita et al. (2006, Study 1)

### What sample sizes are needed for 80% and 95% power to detect the replication effect?

``` r
power_80_n_spatial
```

    ## [1] 206.4215

``` r
power_95_n_spatial
```

    ## [1] 340.4778

### What proportion of previous experiments had at least 80% power to detect effects the size of the replication effect?

``` r
smaller_prop_spatial
```

    ## [1] 0.08

### What is the median power for the replication effect that the previous experiments samples provided?

``` r
median_power_spatial
```

    ## [1] 0.3609655

## Social Distance (Paradigmatic Replication)

### What sample sizes are needed for 80% and 95% power to detect the replication effect?

``` r
power_80_n_social
```

    ## [1] 189.1534

``` r
power_95_n_social
```

    ## [1] 311.887

### What proportion of previous experiments had at least 80% power to detect effects the size of the replication effect?

``` r
smaller_prop_social
```

    ## [1] 0.1

### What is the median power for the replication effect that the previous experiments samples provided?

``` r
median_power_social
```

    ## [1] 0.388382

## Likelihood Distance (Paradigmatic Replication)

### What sample sizes are needed for 80% and 95% power to detect the replication effect?

``` r
power_80_n_likelihood
```

    ## [1] 200.6022

``` r
power_95_n_likelihood
```

    ## [1] 330.8429

### What proportion of effects for which previous experiments had 80% power is the replication effect smaller than?

``` r
smaller_prop_likelihood
```

    ## [1] 0.08

### What is the median power for the replication effect that the previous experiments samples provided?

``` r
median_power_likelihood
```

    ## [1] 0.3697343
