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
