		
			#################################
                	#  Régression linéaire simple   #
                	#################################
 
###Importation des données
RLS<-read.table(file.choose(), header=T)###ou poids<-read.table(file.choose(),header=TRUE)
#poids<-read.table("poids_naissance.txt",header=TRUE)###ou poids<-read.table(file.choose(),header=TRUE)

attach(RLS)
RLS
names(RLS)


###Ajustement sur des donn�es
#1. Inspection graphique
plot(Rendement~Engrais,xlab="Engrais (Kg/ha)", ylab="Rendement (t/ha)")

#Estimation des paramètres de regression a et b.

modele1<- lm(Rendement~Engrais)
modele1

#Représenter la droite de régression sur le nuage de points.
plot(Rendement~Engrais,xlab="Engrais (Kg/ha)", ylab="Rendement (t/ha)")
abline(modele1,col="blue")

###Validation du modèle 
#1. Test de normalité des résidus
#Examen graphique
par(mfrow=c(1,2))
hist(residuals(modele1), main="Histogramme")
qqnorm(resid(modele1))
qqline(resid(modele1),lty=2,col="blue")

#Test de Shapiro-Wilk (equivalent de Ryan-Joiner)
shapiro.test(resid(modele1))


#2. Homogénéité des résidus

# Examen graphique
plot(residuals(modele1)~fitted(modele1),  xlab="Valeurs prédites",ylab="Résidus")


# Test de Breush-Pagan
library(lmtest)
bptest(modele1)

#3. Linéarité de la relation (Ramsey reset test)

resettest(Rendement~Engrais, power=2:3, type="regressor") # (Test reset de non lin�arit�)

#4. Test de signification globale du modèle
anova(modele1)

#5. Test de significativité de a  et de b
result<- summary(modele1) # Présentation des résultats.
result

6. Test d'autocorrélation des résidus: test de Durbin-Waston
library(lmtest)
dwtest(modele1)


                	#################################
                	#  Régression linéaire multiple #
                	#################################

### Importation et affichage des données 
#RLM<-read.table("parasite.txt",header=TRUE)
RLM<-read.table(file.choose(),header=T)
attach(RLM)
RLM

### Ajustement sur les données 
#Inspection graphique 
# Diagramme de dispersion(permet de visualiser la relation
					#entre la variable � expliquer et chacune des variables explicatives, mais aussi de
					#juger de la corr�lation entre les variables explicatives.
pairs(RLM)

### Estimation des paramètres 
modele2 <- lm(Rendement~Engrais+Irrigation+Type_de_sol)
modele2

#Vérification des conditions d'application


#1. Test de normalité des résidus

#Examen graphique
par(mfrow=c(1,2))
hist(residuals(modele2), main="Histogramme")
qqnorm(resid(modele2))
qqline(resid(modele2),lty=2,col="blue")

#Test de Shapiro-Wilk (équivalent de Ryan-Joiner)
shapiro.test(resid(modele2))


#2. Homogénéité des résidus

# Examen graphique
plot(residuals(modele2)~fitted(modele2),  xlab="Valeurs prédites",ylab="Résidus")

# Test de Breush-Pagan
library(lmtest)
bptest(modele2)

4. Test d'autocorrélation des résidus: test de Durbin-Waston

library(lmtest)
dwtest(modele2)


#5. Linéarité de la relation (Ramsey reset test)
resettest(modele2, power=2:3, type="regressor") #(Test reset de non linéarité)

#6 Etude de la colinéarité 
library(car)
vif(modele2)

#7. Test de significativit� de a  et de b
result<- summary(modele2) # Présentation des résultats.
result

#8. Test de signification globale du modèle
anova(modele2)



