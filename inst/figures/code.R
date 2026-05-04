library(hexSticker)
library(ggplot2)
library(pkmapr)

# Get layers
districts <- get_districts()
provinces <- get_provinces()

p <- ggplot() +
  # Districts (light texture)
  geom_sf(data = districts,
          fill = NA,
          color = "#FFFFFF",
          alpha = 0.25,
          size = 0.05) +
  # Provinces (clean borders)
  geom_sf(data = provinces,
          fill = NA,
          color = "#FFFFFF",
          size = 0.3) +
  theme_void() +
  theme(
    panel.background = element_rect(fill = "transparent", color = NA),
    plot.background = element_rect(fill = "transparent", color = NA)
  )

sticker(p,
        package = "pkmapr",
        p_size = 12,
        p_color = "#FFFFFF",
        p_family = "sans",
        p_x = 0.6,            # Upper-left
        p_y = 1.3,            # Upper area
        s_x = 1,               # Map centered
        s_y = 1,               # Map centered
        s_width = 1.4,
        s_height = 1.4,
        h_fill = "#01411C",
        h_color = "#FFFFFF",
        filename = "inst/figures/logo.png")
