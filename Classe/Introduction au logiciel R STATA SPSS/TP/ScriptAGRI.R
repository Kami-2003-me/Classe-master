#################################
                	#  Representation et analyse des données sur R  #
                	################################
### Importation et affichage des données 
#AGRI<-read.table("AGRI.txt",header=TRUE)
AGRI<-read.table(file.choose(),header=T)
attach(AGRI)
AGRI

### Inspection sur les données 
dim(AGRI)          # Nombre de lignes et de colonnes
str(AGRI)          # Structure : noms, types de colonnes, premiers éléments
sum(is.na(AGRI))                # Nombre total de NA
colSums(is.na(AGRI))            # Nombre de NA par colonne
anyNA(AGRI)                     # Test logique
summary(AGRI)  
hist(AGRI$Engrais)             # Histogramme de l'engrais
hist(AGRI$Superficie )                #Histogramme Superficie
hist(AGRI$Pluviometrie)             #Histogramme Pluviométrie
hist(AGRI$Rendement)                #Histogramme Rendement
boxplot(Pluviometrie,Engrais,Superficie,Rendement,main = "Boite a moustache", xlab = "Pluviometrie,Engrais,Superficie,Rendement", ylab = "Valeur")       # Boîte à moustaches

###Correltion entre variable
cor(AGRI$Pluviometrie, AGRI$Superficie) 

### Estimation des paramètres 
modele0 <- lm(Rendement~Pluviometrie+Engrais+Rendement+Sol)
summary(modele0)

##Vérification des conditions d'application

#1. Test de normalité des résidus
#Examen graphique
par(mfrow=c(1,2))
hist(residuals(modele0), main="Histogramme")
qqnorm(resid(modele0))
qqline(resid(modele0),lty=2,col="red")

#Test de Shapiro-Wilk (équivalent de Ryan-Joiner)
shapiro.test(resid(modele0))

#2. Homogénéité des résidus

# Examen graphique
plot(residuals(modele0)~fitted(modele0),  xlab="Valeurs prédites",ylab="Résidus")

# Test de Breush-Pagan
library(lmtest)
bptest(modele0)


#3. Test de significativite global des coefficients
result<- summary(modele0) # Présentation des résultats.
result

###4.Test de ANOVA
###4.1 Exécution des test
res.modele1 <- aov(Rendement ~ Sol, data = AGRI) 
summary(res.modele1)
shapiro.test(residuals(modele1))
bartlett.test(residuals(modele1)~Sol,data=AGRI)

res.modele2 <- aov(Rendement ~ Climat, data = AGRI) 
summary(res.modele2)
shapiro.test(residuals(modele2))
bartlett.test(residuals(modele2)~Climat,data=AGRI)

res.aov <- aov(Rendement ~Region,data=AGRI) 
summary(res.aov)


### Analyse en composante principale ACP
# Installer et charger les bibliothèques nécessaires
install.packages(c("FactoMineR", "factoextra"))  # À faire une seule fois
library(FactoMineR)
library(factoextra)

# Suppression des variables catégorielles
AGRI
df <- AGRI[,-1:-3]  # Exclure les colonnes catégorielles
df
# Effectuer l'ACP (centrage et réduction automatique)
# ACP avec centrage et réduction
acp_result <- prcomp(df, scale. = TRUE)
summary(acp_result)
# Affichage des composantes principales
acp_result$x

# Affichage des vecteurs propres (chargements)
acp_result$rotation
# Scree plot : variance expliquée par chaque composante
plot(acp_result, type = "l")

# Biplot : projection des individus et variables
biplot(acp_result)
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


