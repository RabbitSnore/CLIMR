# Construal Level International Multi-lab Replication (CLIMR) Project

A project for collaborative replications of studies of Construal Level Theory (CLT).

## (Re-)Building the Project

If you want to reproduce the analyses and output for the CLIMR project, the most straightforward way to do this is to clone this repository into an R Project. [This webpage](https://resources.github.com/whitepapers/github-and-rstudio/) has information about how to clone repositories in R Studio. Once you have cloned the repository, run the following code:

```
source("CLIMR_build_project.R")
```

Running this script will install all necessary packages and build the project, including all effect size calculations, meta-analytic models, data visualizations, and reports.

Additionally, `CLIMR_build_project.R` includes parameters that control its operations (e.g., whether to run a simulation or load data files). These parameters must be changed manually, and they should only be changed if you know what you are doing.

## IMPORTANT NOTE

Currently, the project is configured so that it will simulate data by default, rather than load real data. No actual data have been collected. When data collection for the project is complete, the code will be updated to import the publicly available data set by default.