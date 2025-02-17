# -*- coding: utf-8 -*-
"""
Created on Thu Feb 13 19:52:32 2025

@author: gniel
"""

def categorie_age_sexe(age, sexe):
    # Vérification des classes d'âge en fonction de l'âge
    if age < 5:
        categorie = "Enfant"
    elif 5 <= age < 10:
        categorie = "Enfant"
    elif 10 <= age < 18:
        categorie = "Adolescent"
    elif 18 <= age < 25:
        categorie = "Jeune"
    elif 25 <= age < 35:
        categorie = "Jeune adulte"
    elif 35 <= age < 65:
        categorie = "Adulte"
    else:
        categorie = "Personne de troisième âge"
    
    # Ajouter un message en fonction du sexe
    if sexe.lower() == 'homme':
        message = f"L'individu est un {categorie} homme."
    elif sexe.lower() == 'femme':
        message = f"L'individu est une {categorie} femme."
    else:
        message = f"L'individu est un {categorie} avec sexe non spécifié."
    
    return message

# Exemple d'utilisation :
age = 60
sexe = 'femme'

print(categorie_age_sexe(age, sexe))