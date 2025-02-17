def categorie_personne():
    # Demander les informations à l'utilisateur
    nom = input("Entrez votre nom : ")
    
    # Vérification de l'âge (entre 0 et 100)
    while True:
        try:
            age = int(input("Entrez votre âge (entre 0 et 100) : "))
            if age < 0 or age > 120:
                print("L'âge doit être compris entre 0 et 100 ans. Veuillez entrer un âge valide.")
            else:
                break
        except ValueError:
            print("Veuillez entrer un nombre valide pour l'âge.")
    
    # Vérification du sexe
    while True:
        sexe = input("Entrez votre sexe (H/F) : ").strip().upper()
        if sexe in ["H", "F"]:
            break
        else:
            print("Veuillez entrer 'H' pour homme ou 'F' pour femme.")

    # Déterminer la catégorie d'âge
    if age < 3:
        categorie = "Bébé"
    elif age < 13:
        categorie = "Enfant"
    elif age < 18:
        categorie = "Adolescent"
    elif age < 65:
        categorie = "Adulte"
    else:
        categorie = "Senior"

    # Message de retour personnalisé
    titre = "M." if sexe == "H" else "Mme"
    print(f"Bonjour {titre} {nom}, vous appartenez à la catégorie : {categorie}.")

# Exécuter la fonction
categorie_personne()
