# -*- coding: utf-8 -*-
"""
Created on Tue May  6 16:41:22 2025

@author: jeank
"""

import pandas as pd
#import numpy as np 
import matplotlib.pyplot as plt

# Charger les données
#df = pd.read_csv("data.csv")
df = pd.read_excel("Classeur1.xlsx")
df['Date'] = pd.to_datetime(df['Date'])
df.set_index('Date', inplace= True)


# Visualisaation des données 
# Tracer la série temporelle pour observer les tendances:

plt.figure(figsize=(10,5))
plt.plot(df.index, df['Vente'], label="Série temporelle")
plt.xlabel("Date")
plt.ylabel("Vente")
plt.legend()
plt.show()



from sklearn.linear_model import LinearRegression

# Préparation des données
df['Timestamp'] = df.index.map(pd.Timestamp.timestamp)
X = df[['Timestamp']]
y = df['Vente']

# Entraînement du modèle

model = LinearRegression()
model.fit(X, y)

# Prédiction sur une nouvelle période

#future_dates = pd.date_range(start=df.index[-1], periods=10, freq='D') # Jour
#future_dates = pd.date_range(start=df.index[-1], periods=10, freq='W') # Semaine
future_dates = pd.date_range(start=df.index[-1], periods=10, freq='M') # Mois
#future_dates = pd.date_range(start=df.index[-1], periods=10, freq='Y') # Année
future_timestamps = future_dates.map(pd.Timestamp.timestamp).values.reshape(-1,1)
future_predictions = model.predict(future_timestamps)

# Affichage des prédictions

plt.figure(figsize=(10,5))
plt.plot(df.index, df['Vente'], label="Historique")
plt.plot(future_dates, future_predictions, label="Prévision", linestyle="dashed")
plt.xlabel("Date")
plt.ylabel("Vente")
plt.legend()
plt.show()