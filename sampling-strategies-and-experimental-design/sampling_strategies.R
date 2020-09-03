# Simple random sampling:
## randomly select cases from the population
### each case is equally likely to be selected.

# Stratified sampling:
## 1- divide the population into homogeneous groups (strata)
## 2- randomly sample from within each stratum.

# Cluster sampling:
## 1- divide the population into clusters
## 2- randomly sample a few clusters
## 3- sample all observations within these clusters
### the clusters are heterogeneous within themselves and each cluster is similar to the others

# Multistage sampling:
## 1- divide the population into clusters
## 2- randomly sample a few clusters
## 3- randomly sample observations from within those clusters


library(openintro)
library(dplyr)

# Load county data
data("county")

# Remove DS
county_noDC = county %>%
  filter(state != "District of Columbia") %>%
  droplevels()

# Simple random sample of 150 counties
county_srs = county_noDC %>%
  sample_n(size = 150)

# Glimpse county_srs
glimpse(county_srs)

# State distribution of SRS counties
county_srs %>%
  group_by(state) %>%
  count()

# Stratified sample of 150 counties, each state is a stratum
county_str = county_noDC %>%
  group_by(state) %>%
  sample_n(size = 3)

# State distribution of stratified sample counties
glimpse(county_str)


