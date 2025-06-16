**Importer une base de données
import excel "C:\Users\HP\Desktop\PRINCESSE\Group_TP\Nouveau dossier\Adoption_Poultry_innovations.xls", sheet("Sheet1") firstrow clear
**Si c'est un fichier STATA
 use "chemin d'acces" 
**visionner la base de données
edit
**Statistique d" l'age
mean AGE
sum AGE
sum AGE, d *
sum AGE if GENDER < 1 
* ou summarize AGE, detail pour avoir la médiane et les percentiles
**Si on oublie les fonctions d'une commande 
help summarize ()
**On veut calculer le log de l'age
gen NewAGE=ln(AGE)
edit
*pour fusionner les dase de données augmenter les obs "merge" augmenter les variable "append"
*pour voir les boublons dans la base
duplicates list
duplicates report
*pour remplacer les nodalités d'une variable
replace var_name = new_value if condition 
*pour suprimer une variable 
drop AGE
*pour trier
sort AGE
*pour orderner les variables
order 
**convertir les variable numérique en variable alphanumérique 
encode 
*pour changer les noms desvariables
label var REGION "NewREGION"
tab GENDER
label define GENDER 1 "Man" 0 "Woman"
label value GENDER GENDER
tab GENDER
label define Name 1 "Yes" 0 "No"
label value EDUC Name 
label value CREDIT Name 
tab EDUC
tab CREDIT
*tableau croisé
tab GENDER CREDIT
*tableau des profil ligne et profil colonne 
tab GENDER CREDIT, col
tab GENDER CREDIT, row
*tableau des profil ligne et profil colonne sans les fréquence absolu
tab GENDER CREDIT, col nofreq
tab GENDER CREDIT, row chi
tab GENDER, sum(REGION)
*pour faire un test t de student
ttest REGION, by(GENDER) 
ttest AGE= 40
*regression linéaire
reg VACCIN GENDER AGE EDUC CREDIT HHSIZE EXPVIL COCK CHICKHOU HENHOUSE
*regression logistique
logit VACCIN GENDER AGE EDUC CREDIT HHSIZE EXPVIL COCK CHICKHOU HENHOUSE
*regression probit
probit VACCIN GENDER AGE EDUC CREDIT HHSIZE EXPVIL COCK CHICKHOU HENHOUSE
*regression Tobit
tobit vardependente varindependente, ll(0) ul(1)
**pour faire un anova 
anova EDUC REGION
predict resid, residual
swilk resid
hist resid, normale
**correlation de correlation de pearson
pwcorr EDUC REGION 
correlate EDUC REGION 
spearman EDUC REGION
tab EDUC REGION, chi
display sqrt(83.1068/283.1068)
*regression logit et probit et tobit (variable censuré ou tronqué)
tobit var1 var2
logi var1 var2
prob var1 var2
*Regression linéaire 
*simple
reg EDUC REGION 
*multiple 
reg EDUC REGION GENDER 
