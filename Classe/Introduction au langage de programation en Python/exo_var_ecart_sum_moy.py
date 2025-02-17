# -*- coding: utf-8 -*-
"""
Created on Fri Feb 14 20:50:31 2025

@author: gniel
"""

import math

def somme(liste):
    """Retourne la somme des éléments de la liste."""
    return sum(liste)

def moyenne(liste):
    """Retourne la moyenne des éléments de la liste."""
    return somme(liste) / len(liste) if liste else 0

def variance(liste):
    """Retourne la variance des éléments de la liste."""
    moy = moyenne(liste)
    return sum((x - moy) ** 2 for x in liste) / len(liste) if liste else 0

def ecart_type(liste):
    """Retourne l'écart-type des éléments de la liste."""
    return math.sqrt(variance(liste))

# Exemple d'utilisation
if __name__ == "__main__":
    data = [10, 20, 30, 40, 50]
    print("Somme:", somme(data))
    print("Moyenne:", moyenne(data))
    print("Variance:", variance(data))
    print("Écart-type:", ecart_type(data))
