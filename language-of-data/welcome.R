# Install package
install.packages('openintro')

# Load package
library(openintro)

# Load data
data(hsb2)

# View the structure of your data
## First option
str(hsb2)

## Second option
library(dplyr)
glimpse(hsb2)


# TYPES OF VARIABLES
# Categorical
## Ordinal
### ses,schtyp, prog

## Nominal
### id, gender, race

# Numerical
## Discrete
### read, write, math, science, socst

## Continuos

# Number of students in public and private schools in hsb2
table(hsb2$schtyp) # frequency table

# Filter for public schools
hsb2_public = hsb2 %>% 
  filter(schtyp == "public")
table(hsb2_public$schtyp)

# Drop unused levels
hsb2_public$schtyp = droplevels(hsb2_public$schtyp)
table(hsb2_public$schtyp)

# Converting numerical variables in categorical ones
# Calculate avarage reading score and show the value
(avg_read = mean((hsb2$read)))

# Create new variable: read_cat
hsb2 = hsb2 %>%
  mutate(read_cat = ifelse(
    read < avg_read, # logical condition
    "below average", # if condition == True
    "at or above average" # if condition == False
  )
)

# Load ggplot2
library(ggplot2)

# Scatterplot of math vs. science scores
ggplot(data = hsb2, aes(x = science, y = math)) +
  geom_point()

# Scatterplot of math vs. science scores, controlling for program
ggplot(data = hsb2, aes(x = science, y = math, color = prog)) +
  geom_point()

