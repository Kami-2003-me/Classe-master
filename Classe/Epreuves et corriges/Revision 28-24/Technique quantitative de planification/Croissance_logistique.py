# -*- coding: utf-8 -*-
"""
Created on Mon May  5 15:24:29 2025

@author: HP
"""

def logis(P0, Pmax, tau, t) :
    import numpy as np
    y = Pmax/(1 + ((Pmax - P0)/P0)*np.exp(-tau*t))
    return y
P0 = 500
Pmax = 2000
tau = 0.1
t = 5
L = (3, 6, 8, 12, 13, 14)
for i in L:
    print(logis(P0, Pmax, tau, i))
import numpy as np

# Définir la matrice carrée
M = np.array([[9/10, -1/10, -1/10],
              [-2/10, 25/30, -3/10],
              [-1/10, -2/30, 9/10]])
#Calculer le determinant 
det_M = np.linalg.det(M)
print("determinant Matrice :\n", det_M)
# Calculer l'inverse
M_inv = np.linalg.inv(M)

print("Matrice inverse :\n", M_inv)
X = np.array([[1000], [3000],[2000]])
X1 = np.array([[1100], [3300],[2200]])
Y =  np.array([[400], [2000],[1500]])
Y1 = M@X1
R = Y1 - Y  
print("la consommation :\n", Y1)
print("différence d'augmentation par an :\n", R)
Y2 = Y + 0.10 * Y
print("la consommation s'il elle augmentait de 15% :\n", Y2)
X2 = M_inv@Y2


 