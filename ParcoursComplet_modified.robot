*** Settings ***
LIBRARY    SeleniumLibrary
VARIABLES    ../jeu_de_donnees/simple.yaml
RESOURCE    ../resources/Keywords.resource

*** Test Cases ***
Ajouter un employé
    [Tags]    custom_tag
    addEmployes    ${Nom}    ${Prenom}    ${Id}    ${Nationnalite}    ${EtatCivile}    ${DateNaissance}    ${Sexe}

