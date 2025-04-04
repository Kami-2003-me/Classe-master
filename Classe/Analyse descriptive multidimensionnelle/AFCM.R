#Exemple de l'Analyse Factorielle des Correspondances Multiples (AFCM) en R
#Nous allons réaliser une AFCM sur un jeu de données fictif représentant les préférences des individus #pour plusieurs catégories (alimentation, sport et moyen de transport).
________________________________________
# Installation et chargement des packages
# Si ce n'est pas encore fait, installe les packages nécessaires avec :
install.packages("FactoMineR")
install.packages("factoextra")

#Puis charge-les :
library(FactoMineR)
library(factoextra)


#Création d'un jeu de données fictif
#Nous allons créer un tableau avec 10 individus et 3 variables qualitatives :
# Création du jeu de données
data_afcm <- data.frame(
  Alimentation = c("Végétarien", "Omnivore", "Végétarien", "Vegan", "Omnivore", 
                   "Vegan", "Végétarien", "Omnivore", "Omnivore", "Vegan"),
  Sport = c("Natation", "Football", "Basket", "Natation", "Course", 
            "Course", "Football", "Basket", "Course", "Natation"),
  Transport = c("Voiture", "Vélo", "Bus", "Voiture", "Vélo", 
                "Bus", "Vélo", "Voiture", "Bus", "Vélo")
)

# Affichage du tableau
print(data_afcm)
#Ce jeu de données comprend :
#Une variable Alimentation avec 3 modalités : Végétarien, Omnivore, Vegan
# Une variable Sport avec 4 modalités : Natation, Football, Basket, Course
 # Une variable Transport avec 3 modalités : Voiture, Vélo, Bus

#Réalisation de l’AFCM
#On applique la fonction MCA() de FactoMineR :
# Réalisation de l'AFCM
afcm_result <- MCA(data_afcm, graph = FALSE)

# Visualisation des valeurs propres (importance des axes)
afcm_result$eig
#Les valeurs propres permettent d’identifier combien d’axes sont significatifs pour expliquer la variabilité des #données.
#Visualisation des résultats
#Projection des individus
fviz_mca_ind(afcm_result, repel = TRUE, col.ind = "blue")
#Cette visualisation montre comment les individus se répartissent selon leurs préférences.
#Les individus proches ont des réponses similaires.

#Projection des modalités des variables
fviz_mca_var(afcm_result, repel = TRUE, col.var = "red")
#Cette visualisation affiche les modalités des variables et comment elles sont reliées.
#Des modalités proches indiquent qu'elles sont souvent choisies ensemble.
#Carte factorielle combinée (individus + modalités)
fviz_mca_biplot(afcm_result, repel = TRUE)
#Ce graphique superpose les individus et les modalités pour une vision globale.

📌 Tableau Disjonctif Complet et Tableau de Burt en AFCM
L'Analyse Factorielle des Correspondances Multiples (AFCM) repose sur deux types de tableaux :
1.	Le Tableau Disjonctif Complet (TDC)
🔹 Représente les données sous forme binaire (0/1).
🔹 Chaque variable catégorielle est transformée en plusieurs colonnes (une par modalité).
2.	Le Tableau de Burt
🔹 Contient les fréquences de co-occurrence entre les modalités.
🔹 C'est une matrice carrée où chaque bloc représente une matrice de contingence entre deux variables.

#Tableau Disjonctif Complet (TDC)
# Le TDC est utilisé pour convertir un jeu de données catégorielles en une matrice binaire.
# Exemple de données :
# Chargement du package
library(FactoMineR)

# Jeu de données fictif
data_afcm <- data.frame(
  Alimentation = c("Végétarien", "Omnivore", "Végétarien", "Vegan", "Omnivore"),
  Sport = c("Natation", "Football", "Basket", "Natation", "Course"),
  Transport = c("Voiture", "Vélo", "Bus", "Voiture", "Vélo")
)

# Création du Tableau Disjonctif Complet
tdc <- model.matrix(~ . - 1, data = data_afcm)

# Affichage du Tableau Disjonctif Complet
print(tdc)
#Chaque modalité devient une colonne avec 1 si l’individu a cette modalité, sinon 0.
#Avantage : Permet d’appliquer des méthodes factorielles aux données qualitatives.

#Le Tableau de Burt
#Le Tableau de Burt est obtenu en croisant le Tableau Disjonctif Complet avec lui-même.
#Génération du Tableau de Burt dans R :
# Réalisation de l'AFCM
afcm_result <- MCA(data_afcm, graph = FALSE)

# Affichage du Tableau de Burt
print(afcm_result$call$X)
#Ce tableau est symétrique et contient les fréquences croisées des modalités.
#Avantage : Permet de visualiser les relations entre les modalités des variables.

