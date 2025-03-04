# Projet d'Automatisation de Tests avec Robot Framework

Ce projet utilise Robot Framework pour automatiser les tests de qualification d'une application web de gestion des ressources humaines.

## Description

Ce dépôt contient les scripts de test, les ressources et les configurations nécessaires pour exécuter des tests automatisés à l'aide de Robot Framework.

## Contenu

* `Tests/`: Dossier contenant les fichiers de test Robot Framework (`.robot`).
* `Ressources/`: Dossier contenant les ressources utilisées par les tests (par exemple, locateurs, données de test).
* `Resultats/`: Dossier contenant les résultats des tests (rapports, captures d'écran).
* `.gitignore`: Fichier spécifiant les fichiers et dossiers à ignorer par Git.
* `README.md`: Ce fichier, fournissant des informations sur le projet.
* `main.py`: (Si applicable) Script Python pour exécuter les tests ou effectuer d'autres tâches.
* `output.xml`: (Si applicable) Fichier XML contenant les résultats des tests.
* `requirements.txt`: Liste des dépendances Python nécessaires pour exécuter les tests.

## Installation

1.  Clonez le dépôt :

    ```bash
    git clonehttps://github.com/abakar8/Regression_Lineaire.git
    ```

2.  Créez un environnement virtuel (recommandé) :

    ```bash
    python -m venv venv
    source venv/bin/activate  # Sur Linux/macOS
    venv\Scripts\activate  # Sur Windows
    ```

3.  Installez les dépendances :

    ```bash
    pip install -r requirements.txt
    ```

## Utilisation

1.  Assurez-vous que l'application ou le site web à tester est en cours d'exécution.

2.  Exécutez les tests à l'aide de la commande `robot` :

    ```bash
    robot -d Resultats/nom_du_test/ Tests/nom_du_fichier_de_test.robot
    ```

    Remplacez `nom_du_test` et `nom_du_fichier_de_test.robot` par les valeurs appropriées.

3.  Les résultats des tests seront disponibles dans le dossier `Resultats/`.

## Tests

* tests de connexion
*  tests d'ajout employé
*  tests de modification information employé
*  tests de déconnexion

## Ressources

* Le dossier `Ressources/` contient les locateurs d'éléments, le jeu de données de tests 
  

## Résultats

* Les résultats des tests sont stockés dans le dossier `Resultats/`.
* Les rapports HTML et les fichiers XML sont générés pour chaque exécution de test.
* Les captures d'écran sont prises en cas d'échec de test.

## Améliorations possibles

 Ajout de nouveaux tests, amélioration des locateurs, intégration avec un outil CI/CD.

## Auteur
Abakar Gargoum

## Licence

Apache 2.0
