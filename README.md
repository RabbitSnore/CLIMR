# Construal Level International Multi-lab Replication (CLIMR) Project

This project entails multi-lab collaborative replications of four studies on Construal Level Theory (CLT):

Liberman, N., Sagristano, M. D., & Trope, Y. (2002). The effect of temporal distance on level of mental construal. *Journal of Experimental Social Psychology, 38*(6), 523-534. Experiment 1. 

Liberman, N., & Trope, Y. (1998). The role of feasibility and desirability considerations in near and distant future decisions: A test of temporal construal theory. *Journal of personality and social psychology, 75*(1), 5-18. Experiment 1. 


Henderson, M. D., Fujita, K., Trope, Y., & Liberman, N. (2006). Transcending the "here": the effect of spatial distance on social judgment. *Journal of Personality and Social Psychology, 91*(5), 845-856. Experiment 1. 

Wakslak, C. J., Trope, Y., Liberman, N., & Alony, R. (2006). Seeing the forest when entry is unlikely: probability and the mental representation of events. *Journal of Experimental Psychology: General, 135*(4), 641-653. Experiment 1.   

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