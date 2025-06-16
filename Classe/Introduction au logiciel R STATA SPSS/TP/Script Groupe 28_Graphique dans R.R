

# SCRIPT R - Graphiques statistiques classiques
# -----------------------------------------------

# Nettoyage de l'environnement
rm(list = ls())       # Supprime tous les objets de l'environnement
cat("\014")           # Efface la console

# Chargement des packages nécessaires
install.packages("ggplot2")  # À exécuter UNE SEULE FOIS si non installé
library(ggplot2)

# Génération de données simulées
set.seed(123)              # Pour reproductibilité
x <- rnorm(100, mean = 50, sd = 10)     # Variable quantitative (ex : notes)
y <- 2 * x + rnorm(100, mean = 0, sd = 5)  # Variable corrélée à x (ex : score)

🔵 1. Nuage de points (scatterplot)
# OBJECTIF : Visualiser la relation entre deux variables numériques

# Base R
plot(x, y, main = "Nuage de points : X vs Y", xlab = "Variable X", ylab = "Variable Y", pch = 19, col = "blue")

# ggplot2
df <- data.frame(x = x, y = y)
ggplot(df, aes(x = x, y = y)) +
  geom_point(color = "darkblue") +
  labs(title = "Relation entre X et Y", x = "X", y = "Y")
🧠 Interprétation : Si les points forment une ligne montante ou descendante → relation linéaire (positive ou négative).

🟢 2. Histogramme
# OBJECTIF : Étudier la distribution d'une variable numérique

# Base R
hist(x, breaks = 10, col = "skyblue", main = "Histogramme de X", xlab = "X")

# ggplot2
ggplot(df, aes(x = x)) +
  geom_histogram(binwidth = 5, fill = "green", color = "black") +
  labs(title = "Histogramme - Distribution de X", x = "X")
🧠 Interprétation : Vérifie si les données sont normales, asymétriques ou bimodales.

🟠 3. Boxplot (boîte à moustaches)
# OBJECTIF : Résumer la distribution et repérer les valeurs extrêmes

# Base R
boxplot(x, main = "Boxplot de X", col = "orange")

# ggplot2
ggplot(df, aes(y = x)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Boîte à moustaches de X", y = "X")
🧠 Interprétation : Affiche médiane, étendue interquartile et outliers.

🔴 4. Diagramme en barres
# OBJECTIF : Visualiser des données qualitatives

# Exemple avec la base `mpg` de ggplot2
data(mpg)
head(mpg)
# Base R
barplot(table(mpg$class), col = "lightcoral", main = "Types de véhicules", las = 2)

# ggplot2
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "red") +
  labs(title = "Effectifs par type de véhicule", x = "Classe") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
🧠 Interprétation : Permet de comparer les fréquences de chaque modalité (ex : compact, SUV…).

🟡 5. Diagramme circulaire (camembert)
# OBJECTIF : Représenter des parts d’un total (qualitatif)

freq_drv <- table(mpg$drv)
pie(freq_drv, main = "Répartition par type de transmission", col = rainbow(length(freq_drv)))
🧠 Interprétation : Permet de voir la part de chaque type de transmission (f, r, 4).

🟣 6. Courbe chronologique (ligne temporelle)
# OBJECTIF : Montrer une évolution dans le temps

temps <- 1:12   # Mois
ventes <- c(120, 140, 135, 160, 175, 180, 200, 190, 170, 160, 180, 210)

# Base R
plot(temps, ventes, type = "l", col = "purple", main = "Évolution des ventes", xlab = "Mois", ylab = "Ventes")

# ggplot2
df_temps <- data.frame(mois = temps, ventes = ventes)
ggplot(df_temps, aes(x = mois, y = ventes)) +
  geom_line(color = "purple", size = 1.2) +
  labs(title = "Tendance mensuelle des ventes", x = "Mois", y = "Ventes")
🧠 Interprétation : Identification d’une tendance, pics, ou saisonnalité.