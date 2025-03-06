# -*- coding: utf-8 -*-
"""
Created on Tue Feb 18 08:14:04 2025

@author: chimo
"""

import csv
6
def mean(values):
    return sum(values) / len(values)

def linear_regression(X, Y):
    """Calcule les coefficients de régression linéaire Y = b0 + b1*X."""
    n = len(X)
    x_mean = mean(X)
    y_mean = mean(Y)

    num = sum((X[i] - x_mean) * (Y[i] - y_mean) for i in range(n))
    den = sum((X[i] - x_mean) ** 2 for i in range(n))
    b1 = num / den  # Pente
    b0 = y_mean - b1 * x_mean  # Intercept

    # Prédictions
    y_pred = [b0 + b1 * X[i] for i in range(n)]

    # Évaluation
    eqm = sum((Y[i] - y_pred[i]) ** 2 for i in range(n)) / n
    ss_total = sum((Y[i] - y_mean) ** 2 for i in range(n))
    ss_residual = sum((Y[i] - y_pred[i]) ** 2 for i in range(n))
    r2 = 1 - (ss_residual / ss_total)

    return b0, b1, eqm, r2

def interpret_results(b0, b1, eqm, r2):
    """Affiche une interprétation des résultats."""
    print("\n📊 Presentation et interprétation des résultats")
    print(f"✅ Équation de la régression : Y = {b0:.2f} + {b1:.2f}X")
    print(f"📉 Erreur quadratique moyenne (EQM) : {eqm:.4f}")
    print(f"📈 Score de détermination (R²) : {r2:.4f}")

    if r2 > 0.8:
        print("🔹 Le modèle explique très bien les variations de Y.")
    elif r2 > 0.5:
        print("🔸 Le modèle explique partiellement les variations de Y.")
    else:
        print("⚠ Le modèle explique faiblement les variations de Y.")

def load_csv():
    """Charge une base de données CSV."""
    filepath = input("📂 Entrez le chemin d'acces du fichier CSV : ")
    
    try:
        with open(filepath, 'r', encoding='utf-8') as file:
            reader = csv.DictReader(file)
            data = list(reader)
            if not data:
                print("❌ Fichier vide.")
                return None, None
            columns = data[0].keys()
            print("\n📌 Colonnes disponibles :", ", ".join(columns))
            x_var = input("👉 Entrez le nom de la variable explicative (X) : ")
            y_var = input("👉 Entrez le nom de la variable expliquée (Y) : ")

            X = [float(row[x_var]) for row in data if row[x_var]]
            Y = [float(row[y_var]) for row in data if row[y_var]]
            
            return X, Y
    except Exception as e:
        print(f"❌ Erreur lors du chargement du fichier : {e}")
        return None, None

def manual_data_entry():
    """Permet à l'utilisateur d'entrer manuellement des données."""
    try:
        num_values = int(input("🔢 Combien de valeurs voulez-vous entrer ? "))

        print("\n🔹 Entrez les valeurs pour la variable explicative (X) :")
        X = [float(input(f"X[{i+1}] = ")) for i in range(num_values)]

        print("\n🔹 Entrez les valeurs pour la variable expliquée (Y) :")
        Y = [float(input(f"Y[{i+1}] = ")) for i in range(num_values)]

        return X, Y
    except ValueError:
        print("❌ Veuillez entrer des nombres valides.")
        return None, None

# Menu principal
print("📊 Programme de Régression Linéaire")
print(" 1️⃣ Charger un fichier CSV")
print(" 2️⃣ Entrer les données manuellement")

choice = input("👉 Choisissez une option (1 ou 2) : ")

if choice == "1":
    X, Y = load_csv()
elif choice == "2":
    X, Y = manual_data_entry()
else:
    print("❌ Choix invalide.")
    X, Y = None, None

if X and Y:
    b0, b1, eqm, r2 = linear_regression(X, Y)
    interpret_results(b0, b1, eqm, r2)
else:
    print("⚠ Aucune analyse effectuée.")