################################################################################

# CLIMR -- Erroneous survey redirection, ES_04, ES_01

################################################################################

# Some participants from ES_04 were erroneously redirected to the likelihood and
# social experiments for ES_01 before the technical issue causing this was
# detected and resolved. Fortunately, for these experiments, the materials for
# these labs are basically compatible, so we do not see a compelling reason to
# exclude the data from these participants. However, these cases will need to be
# identified and relocated to the correct studies, from ES_01's data to ES_04's.

# Load necessary information ---------------------------------------------------

# Load redirection data for ES_04

cases_es_04 <- 
  read_csv("data/utility/climr_consent-and-redirect_base_ES_04_es_lab.csv")

# Clean and extract necessary information

cases_es_04 <- cases_es_04 %>% 
  slice(-1, -2) %>% 
  type_convert()

cases_es_04 <- cases_es_04 %>% 
  filter(distance == "likelihood" | distance == "social") %>% 
  select(id_subject, id_internal, distance)

# Extract experimental data ----------------------------------------------------

# Extract the likelihood and social data from ES_04

es_04 <- raw %>% 
  filter(lab == "ES_04" & (experiment == "likelihood" | experiment == "social"))

# Identify "missing" cases

cases <- cases_es_04[!(cases_es_04$id_internal %in% es_04$id_internal), ]

# Extract the likelihood and social data from ES_01

es_01 <- raw %>% 
  filter(lab == "ES_01")

# Identify and correct cases ---------------------------------------------------

# Extract "missing" participants' data from ES_01

data_mia <- es_01[es_01$id_internal %in% cases$id_internal, ]

# Reassign lab

data_mia$lab <- "ES_04"

# Remove mistaken participants from ES_01 data

es_01 <- es_01[!(es_01$id_internal %in% cases$id_internal), ]

# Reassemble data --------------------------------------------------------------

raw <- raw %>% 
  filter(lab != "ES_01")

raw <- bind_rows(raw, es_01, data_mia)
