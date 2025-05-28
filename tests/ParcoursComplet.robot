*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/ParcoursComplet/" -i "ParcoursComplet" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#Force Tags      ParcoursComplet
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  1s
Test Teardown   Close Browser
#Library         DataDriver        ../jeu_de_donnees/test.csv      delimiter=;
Variables        ../jeu_de_donnees/simple.yaml
Resource        ../resources/Keywords.resource

*** Test Cases ***
Ajouter un employé
      ${Nom}  ${Prenom}  ${Id}  ${Nationnalite}  ${EtatCivile}  ${DateNaissance}  ${Sexe}
      [Template]    addEmployes
