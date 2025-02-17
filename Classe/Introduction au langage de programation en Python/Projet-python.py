# -*- coding: utf-8 -*-
"""
Created on Thu Feb 13 14:35:41 2025

@author: gniel
"""

print("BONJOUR ABDOUL")
a=3
b=11
c=a**2+b
print(c)
print("c =",c)
d=b%a
print(d)
print("d =",d)
#chaine de caractere
l = "Kamila est belle, mais Baki n'est pas mal aussi. "
e = "l = Kamila est belle, mais Baki n'est pas mal aussi."
print(e)
s = "Comment allez vous?"
print(l+s)
print(l*3)
print(l[0])
print(l[2:])
print(l[2:5])
print(l[2::2]) 
print(l[-1::-1])
Id= ["ABDOUL","Baki","Masculin",24,1.80,64,"Etudiant","Celibataire",00,"Beninois",1]
print(Id)
print(Id[0])
print(Id[2:])
print(Id[2:5])
print(Id[2::2]) 
print(Id[-1::-1])
Nb = [10,28,28,6,789,9008,35,37,46,2,563,8]
Nb.sort()
print(Nb)
a=0
if a<0:
    print("a est negatif")
else:
    print("a est positif")
    for i in range(10):
        print("kamila est belle\n")
        i=i+1

for num in range(1, 11):
    print(f"\nTable de multiplication de {num} :")
    for i in range(1, 11):
        print(f"{num} x {i} = {num * i}")

        
def f(x, y, z):
    return x**2 + 2*x*y + y**2 + 2*y*z + z**2 - 3

# Exemple d'utilisation
x, y, z = 1, 2, 3
result = f(x, y, z)
print(f"f({x}, {y}, {z}) =", result)


def gradient_f(x, y, z):
    df_dx = 2*x + 2*y
    df_dy = 2*x + 2*y + 2*z
    df_dz = 2*y + 2*z
    return ([df_dx, df_dy, df_dz])

# Exemple d'utilisation
x, y, z = 1, 0, 1
grad = gradient_f(x, y, z)
print(f"Gradient en ({x}, {y}, {z}) : {grad}")
