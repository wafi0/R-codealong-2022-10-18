library(palmerpenguins)
library(ggplot2)
library(tidyverse)
ggplot(
  penguins, aes(
    bill_depth_mm,
    bill_length_mm,
    col = species
  )) +
  geom_point() +
  labs(
    x = "Bill depth (mm)",
    y = "Bill length (mm)",
    title = "My nice title",
    subtitle = "This is the subtitle",
    caption = "A caption",
    col = "SPECIES"
  ) +
  scale_x_log10()

plot(penguins$bill_depth_mm, penguins$bill_length_mm)