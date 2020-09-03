# Visualize dataframe
glimpse(evals) # 463 rows and 23 columns

# Variables
str(evals)

# Recode cls_students as cls_type
evals_fortified = evals %>%
  mutate(
    cls_type = case_when(
      cls_students<=18 ~ "small",
      cls_students > 18 & cls_students < 60 ~ "midsize",
      cls_students >59 ~ "large"
    )
  )

# Scatterplot of score vs. bty_avg
library(ggplot2)

ggplot(evals, aes(x = bty_avg, y = score)) +
  geom_point()


# Scatterplot of score vs. bty_avg colored by cls_type
ggplot(evals_fortified, aes(x = bty_avg, y = score, colour = cls_type)) +
  geom_point()

