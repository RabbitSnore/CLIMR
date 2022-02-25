# Construal Level International Multi-lab Replication (CLIMR) Project

This project entails multi-lab collaborative replications of studies on Construal Level Theory (CLT):

Liberman, N., & Trope, Y. (1998). The role of feasibility and desirability considerations in near and distant future decisions: A test of temporal construal theory. _Journal of Personality and Social Psychology, 75_(1), 5-18. Experiment 1. 

Fujita, K., Henderson, M., Eng, J., Trope, Y., & Liberman, N. (2006). Spatial distance and mental construal of social events. _Psychological Science, 14_, 278-282. Experiment 1.

In addition to close replications of these two studies, this project also entails two conceptual replications relevant to social and likelihood distance.

## Compendium Structure

The CLIMR project compendium comprises two main parts, one hosted on the Open Science Framework (OSF; https://osf.io/ra3dp/) and one hosted on GitHub (https://github.com/RabbitSnore/CLIMR). The OSF repository for CLIMR contains the materials, methods, and data (once data are collected). The GitHub repository contains the code necessary to execute and reproduce the statistical analyses for the project.

## (Re-)Building the Project

If you want to reproduce the analyses and output for the CLIMR project, the most straightforward way to do this is to clone this repository into an R Project in R Studio. [This webpage](https://resources.github.com/whitepapers/github-and-rstudio/) has information about how to clone repositories in R Studio. Once you have cloned the repository, open the project in R Studio, and run the following code:

```
source("CLIMR_build_project.R")
```

Running this script will install all necessary packages and build the project, including all effect size calculations, meta-analytic models, data visualizations, and reports.

Additionally, `CLIMR_build_project.R` includes parameters that control its operations (e.g., whether to run a simulation or load data files). These parameters must be changed manually, and they should only be changed if you know what you are doing.

Additional supplemental materials are available on the Open Science Framework: https://osf.io/ra3dp/

## IMPORTANT NOTE

Currently, the project is configured so that it will simulate data by default, rather than load real data. No actual data have been collected. When data collection for the project is complete, the code will be updated to import the publicly available data set by default.