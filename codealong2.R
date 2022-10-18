library(palmerpenguins)
library(ggplot2)
library(dplyr)
library(tidyverse)

ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(aes(fill = species),
                 bins = 50,
                 alpha = 0.8) +
  labs(fill = NULL) +
  theme(legend.position = "top")

ggplot(penguins, aes(x = body_mass_g)) +
  geom_density(aes(fill = species,
                   col = species),
               alpha = 0.5) +
  labs(fill = NULL, col = NULL) +
  theme(legend.position = "top")

library(ggridges)
ggplot(
  penguins,
  aes(
    x = body_mass_g,
    y = paste0(species, " (", sex, ")"),
    fill = species
  )
) +
  ggridges::geom_density_ridges(alpha = 0.5) +
  labs(x = "Body mass (g)",
       y = "Species (sex)") +
  guides(fill = "none")
## Picking joint bandwidth of 127

ggplot(penguins, aes(x = species,
                     y = body_mass_g)) +
  geom_boxplot()

ggplot(penguins, aes(x = body_mass_g,
                     y = species)) +
  geom_boxplot()

ggplot(penguins, aes(x = species)) +
  geom_bar()

ggplot(penguins, aes(x = species,
                     fill = island)) +
  geom_bar()

ggplot(penguins, aes(x = species,
                     fill = island)) +
  geom_bar(position = "fill")

ggplot(penguins, aes(x = species,
                     fill = sex)) +
  geom_bar(position = "dodge")

ggplot(penguins, aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point() +
  geom_smooth()

ggplot(penguins, aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     col = species)) +
  geom_point() +
  geom_smooth()

ggplot(penguins, aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     col = species)) +
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE, # remove the shaded region
              fullrange = TRUE) #extrapolate to min & max of the data range

penguins %>%
  count(species, year) %>%
  ggplot(., aes(year, n)) +
  geom_line()

penguins %>%
  count(species, year) %>%
  ggplot(., aes(year, n, col = species)) +
  geom_line()

penguins %>%
  count(species, year) %>%
  ggplot(., aes(year, n, fill = species)) +
  geom_bar(stat = "identity", #instead of count, we want identity
           position = "dodge")

g <- ggplot(penguins, aes(species, body_mass_g, fill = species)) + geom_boxplot()
library(ggthemes)
g + theme_excel() + scale_fill_excel()


ngroup <- 5
tibble(
  group = factor(1:ngroup),
  count = sample(10, size = ngroup,
                 replace = TRUE)
) %>%
  ggplot(aes(group, count, fill = group)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  scale_fill_manual(
    values = c("yellow", "pink", "red", "blue", "gray")
  )  # you can supply HTML colours

tibble(
  x = rnorm(10000),
  y = rnorm(10000)
) %>%
  ggplot(aes(x, y)) +
  geom_hex() +
  coord_fixed() + # ensures fixed x/y scales
  scale_fill_viridis_c(option = "plasma") +
  theme_bw()