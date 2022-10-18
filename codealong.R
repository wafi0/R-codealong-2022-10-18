library(palmerpenguins)
library(ggplot2)
library(tidyverse)
ggplot(
  penguins, aes(
    bill_depth_mm,
    bill_length_mm
  )) +
  geom_point(
    aes(
      col = species,
      shape = island,
      # alpha = body_mass_g
    ),
    size = 1
  ) +
  labs(
    x = "Bill depth (mm)",
    y = "Bill length (mm)",
    title = "My nice title",
    subtitle = "This is the subtitle",
    caption = "A caption",
    col = "SPECIES"
  ) +
#  facet_grid(species ~ island) +
  facet_wrap(species ~ island) +
  guides(col="none", shape="none") # remove legend
#plot(penguins$bill_depth_mm, penguins$bill_length_mm)