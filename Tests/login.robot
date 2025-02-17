*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/login/" -i "login" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Force Tags      login
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  1s
Test Teardown   Close Browser
Variables       ../../Ressources/locators.py

*** Variables ***
${BROWSER}      Firefox
${URL}          http://localhost/orangehrm-5.7/web/index.php/auth/login
${USERNAME}     admin
${PASSWORD}     Abandass-2024

****** Test Cases ***
Parcours Complet
   open OrangeHRM
   login


*** Keywords ***
open OrangeHRM
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    OrangeHRM

login
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']