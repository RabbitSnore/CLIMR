# Construal Level International Multi-lab Replication (CLIMR) Project

A project for collaborative replications of studies of Construal Level Theory (CLT).

## (Re-)Building the Project

If you want to reproduce the analyses and output for the CLIMR project, the most straightforward way to do this is to clone this repository into an R Project. [This webpage](https://resources.github.com/whitepapers/github-and-rstudio/) has information about how to clone repositories in R Studio. Once you have cloned the repository, run the following code:

```
source("CLIMR_build_project.R")
```

Running this script will install all necessary packages and build the project, including all effect size calculations, meta-analytic models, data visualizations, and reports.