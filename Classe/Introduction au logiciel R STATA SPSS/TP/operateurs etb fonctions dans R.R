Opérateurs arithmétiques
Description : utilisés pour effectuer des calculs mathématiques de base.

5 + 3     # Addition
10 - 4    # Soustraction
6 * 2     # Multiplication
8 / 2     # Division
2^3       # Puissance
10 %% 3   # Modulo (reste de la division)

Opérateurs relationnels
Description : comparent deux valeurs et retournent un booléen (TRUE ou FALSE).

5 > 3     # TRUE
4 == 4    # TRUE
7 != 2    # TRUE
6 <= 5    # FALSE

Opérateurs logiques
Description : utilisés pour combiner ou inverser des conditions logiques.
TRUE & FALSE     # ET logique
TRUE | FALSE     # OU logique
!TRUE            # NON logique


Opérateurs d’affectation
Description : permettent d’assigner une valeur à une variable.

x <- 10
y = 5
z <<- 3  # Affectation globale


II. Les fonctions dans R
1. Fonctions de base
Description : fonctions intégrées pour manipuler des données.


sum(c(1, 2, 3))       # Somme
mean(c(4, 5, 6))      # Moyenne
length(c(1, 2, 3, 4)) # Longueur


Création de fonctions personnalisées
Description : définir ses propres fonctions pour automatiser des tâches.

ma_fonction <- function(x) {
  return(x^2)
}
ma_fonction(4)  # Retourne 16

Fonctions d’application
Description : appliquer une fonction à un ensemble de données.


lapply(list(1:3, 4:6), sum)  # Applique sum à chaque élément de la liste
sapply(1:5, function(x) x^2) # Applique une fonction à chaque élément


