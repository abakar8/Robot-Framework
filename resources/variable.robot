*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/ParcoursComplet/" -i "ParcoursComplet" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Library           DataDriver    file=../jeu_de_donnees/emp_data.csv

*** Variables ***
${BROWSER}      Firefox
${URL}          http://localhost/orangehrm-5.7/web/index.php/auth/login
${USERNAME}     admin
${PASSWORD}     Abandass-2024
${Prenom}       Ali
${Nom}          Ben
${id}           111333
${Nationnalite}    Belgian
${DateNaissance}    2000-09-12
${EtatCivile}       Married
${Sexe}        Male