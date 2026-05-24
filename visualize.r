# visualize.R
# Visualisation avancée en R : carte de chaleur de données simulées

# Installer les packages si nécessaire
packages <- c("ggplot2", "viridis")
installed <- packages %in% rownames(installed.packages())

if (any(!installed)) {
  install.packages(packages[!installed])
}

library(ggplot2)
library(viridis)

# Génération de données simulées
set.seed(42)

x <- seq(-10, 10, length.out = 200)
y <- seq(-10, 10, length.out = 200)

grid <- expand.grid(x = x, y = y)

# Fonction mathématique pour créer des motifs intéressants
grid$z <- with(grid,
               sin(sqrt(x^2 + y^2)) *
               cos(x / 2) *
               exp(-(x^2 + y^2) / 100)
)

# Création de la visualisation
p <- ggplot(grid, aes(x, y, fill = z)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_viridis(option = "plasma") +
  coord_fixed() +
  labs(
    title = "Visualisation avancée en R",
    subtitle = "Carte de chaleur générée mathématiquement",
    x = "Axe X",
    y = "Axe Y",
    fill = "Valeur"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18),
    plot.subtitle = element_text(size = 12),
    panel.grid = element_blank()
  )

# Affichage
print(p)