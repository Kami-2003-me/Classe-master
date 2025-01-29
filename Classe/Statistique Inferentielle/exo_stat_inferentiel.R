# Installer et charger le package pwr
install.packages("pwr")  # Installer si ce n'est pas encore fait
library(pwr)

# ------------------------
# 1. Test de la moyenne
# ------------------------

# Paramètres
n <- 30  # Taille de l'échantillon
delta <- 0.5  # Différence entre la moyenne observée et la moyenne sous H0
sigma <- 1  # Écart-type
alpha <- 0.05  # Niveau de signification

# Calcul de la puissance
puissance_moyenne <- pwr.t.test(n = n, d = delta / sigma, sig.level = alpha, type = "one.sample")$power
print(paste("Puissance du test de la moyenne:", puissance_moyenne))

# Représentation graphique
n_values <- seq(5, 100, by = 5)
puissance_values <- sapply(n_values, function(n) {
  pwr.t.test(n = n, d = delta / sigma, sig.level = alpha, type = "one.sample")$power
})

plot(n_values, puissance_values, type = "b", col = "blue", 
     xlab = "Taille de l'échantillon", ylab = "Puissance",
     main = "Puissance du test t pour la moyenne")
abline(h = 0.8, col = "red", lty = 2)  # Ligne de référence

# ------------------------
# 2. Test sur l'écart-type
# ------------------------

# Paramètres
sigma0 <- 1  # Écart-type sous H0
sigma1 <- 1.5  # Écart-type sous H1
n <- 30  # Taille de l'échantillon

# Calcul de la puissance
effect_size <- (sigma1^2 / sigma0^2)
puissance_ecart_type <- pwr.chisq.test(w = effect_size, N = n, sig.level = alpha, df = n - 1)$power
print(paste("Puissance du test sur l'écart-type:", puissance_ecart_type))

# Représentation graphique
sigma1_values <- seq(1, 3, by = 0.1)
puissance_values <- sapply(sigma1_values, function(sigma1) {
  effect_size <- (sigma1^2 / sigma0^2)
  pwr.chisq.test(w = effect_size, N = n, sig.level = alpha, df = n - 1)$power
})

plot(sigma1_values, puissance_values, type = "b", col = "blue",
     xlab = "Écart-type alternatif", ylab = "Puissance",
     main = "Puissance du test sur l'écart-type")
abline(h = 0.8, col = "red", lty = 2)

# ------------------------
# 3. Test sur les proportions
# ------------------------

# Paramètres
p1 <- 0.5  # Proportion sous H0
p2 <- 0.65  # Proportion sous H1
n <- 100  # Taille de l'échantillon

# Calcul de la puissance
puissance_proportion <- pwr.2p.test(h = ES.h(p1, p2), n = n, sig.level = alpha)$power
print(paste("Puissance du test de proportion:", puissance_proportion))

# Représentation graphique
n_values <- seq(20, 200, by = 10)
puissance_values <- sapply(n_values, function(n) {
  pwr.2p.test(h = ES.h(p1, p2), n = n, sig.level = alpha)$power
})

plot(n_values, puissance_values, type = "b", col = "blue",
     xlab = "Taille de l'échantillon", ylab = "Puissance",
     main = "Puissance du test de proportion")
abline(h = 0.8, col = "red", lty = 2)
