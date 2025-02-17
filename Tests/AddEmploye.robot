*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/AddEmploye/" -i "AddEmploye" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Force Tags      login
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  1s
Test Teardown   Close Browser
Variables       ../Ressources/locator.py

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
    Input Text    ${UsernameInputBox}    ${USERNAME}
    Input Text    ${PasswordInputBox}     ${PASSWORD}
    Click Button  ${LoginButton}
logout
    Wait Until Element Is Visible    ${MenuProfil}  timeout=30s
    Click Element                    ${MenuProfil}
    Wait Until Element Is Visible    ${LogoutButton}    timeout=30s
    Click Element                    ${LogoutButton}
addEmployes
    Wait Until Element Is Visible    ${PimButton}
    Click Element                    ${PimButton}
    Wait Until Element Is Visible    ${AddButtonTittle}
    Wait Until Element Is Visible    ${AddButton}
    Click Element                    ${AddButton}
    Input Text                       ${EmployeeFirstName}    ${Prenom}
    Input Text                       ${EmployeeLastName}     ${Nom}
    Input Text                       ${IdEmployee}           ${id}
    Wait Until Element Is Visible    ${SubmitButton}
    Click Element                    ${SubmitButton}
    Wait Until Element Is Visible     ${PersonalDetailsTittle}