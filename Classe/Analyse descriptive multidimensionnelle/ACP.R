# Installer et charger les bibliothèques nécessaires
install.packages(c("FactoMineR", "factoextra"))  # À faire une seule fois
library(FactoMineR)
library(factoextra)

# Exemple de données : On utilise le dataset "iris" sans la colonne des espèces
data(iris)
iris
df <- iris[, -5]  # Exclure la colonne catégorielle

# Effectuer l'ACP (centrage et réduction automatique)
acp <- PCA(df, graph = FALSE)

# Graphique des variances expliquées (scree plot)
fviz_eig(acp)

# Graphique des individus (avec colorisation par groupe si nécessaire)
fviz_pca_ind(acp, 
             col.ind = "cos2", # Coloration selon la qualité de représentation
             gradient.cols = c("blue", "purple", "red"),
             repel = TRUE) # Évite le chevauchement des labels

# Graphique des variables
fviz_pca_var(acp, 
             col.var = "contrib", # Coloration selon la contribution
             gradient.cols = c("blue", "purple", "red"),
             repel = TRUE)

# Graphique biplot (individus et variables sur le même plan)
fviz_pca_biplot(acp, 
                repel = TRUE, 
                col.var = "red", 
                col.ind = "blue")

# Contributions des variables sur les axes principaux
fviz_contrib(acp, choice = "var", axes = 1) # Axe 1
fviz_contrib(acp, choice = "var", axes = 2) # Axe 2