library(ggplot2)
library(palmerpenguins)
library(dplyr)
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm,
                y = bill_length_mm)
) +
  geom_point(
    mapping = aes(colour = species)
  ) +
  labs(title = "Bill depth and length",
       subtitle = paste("Dimensions for Adelie,",
                        "Chinstrap, and Gentoo",
                        "Penguins"),
       x = "Bill depth (mm)",
       y = "Bill length (mm)",
       colour = "Species",
       caption = "Source: palmerpenguins package"
  )