*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/AddEmploye/" -i "AddEmploye" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Force Tags      login
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  1s
Test Teardown   Close Browser
#Variables       ../../Ressources/locators.py

*** Variables ***
${BROWSER}      Firefox
${URL}          http://localhost/orangehrm-5.7/web/index.php/auth/login
${USERNAME}     admin
${PASSWORD}     Abandass-2024
${Prenom}       Ali
${Nom}          Ben
${id}           111333

****** Test Cases ***
Parcours Complet
   [Tags]    AddEmploye
   open OrangeHRM
   login
   addEmployes
   logout



*** Keywords ***
open OrangeHRM
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    OrangeHRM

login
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
logout
    Wait Until Element Is Visible    xpath=//span[@class='oxd-userdropdown-tab']   timeout=30s
    Click Element                    xpath=//span[@class='oxd-userdropdown-tab']
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Logout')]    timeout=30s
    Click Element                    xpath=//a[contains(text(),'Logout')]
addEmployes
    Wait Until Element Is Visible    xpath=//span[contains(@class,'oxd-main-menu-item--name') and text()='PIM']
    Click Element                    xpath=//span[contains(@class, 'oxd-main-menu-item--name') and text()='PIM']
    Wait Until Element Is Visible    xpath=//h5[@class='oxd-text oxd-text--h5 oxd-table-filter-title']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Add']
    Click Element                    xpath=//button[normalize-space()='Add']
    Input Text                       name=firstName    ${Prenom}
    Input Text                       name=lastName     ${Nom}
    Input Text                       xpath=(//input[@class='oxd-input oxd-input--active'])[2]        ${id}
    Wait Until Element Is Visible    css=button[type='submit']
    Click Element                    css=button[type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Personal Details']