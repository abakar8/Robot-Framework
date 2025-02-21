*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/AddEmploye/" -i "AddEmploye" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Force Tags      AddEmploye
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
${Nationnalite}    Belgian
${DateNaissance}    2000-09-12
${EtatCivile}       Married
${Sexe}        Male
****** Test Cases ***
Parcours Complet
   [Tags]    AddEmploye
   open OrangeHRM
   login
   addEmployes
   addEmpDetail
   logout



*** Keywords ***
open OrangeHRM
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    OrangeHRM

login
    Input Text    ${UsernameInputBox}    ${USERNAME}
    Input Text    ${PasswordInputBox}     ${PASSWORD}
    Click Button  ${LoginButton}
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
addEmpDetail
   Wait Until Element Is Visible    xpath://label[text()='Nationality']/ancestor::div[contains(@class, 'oxd-input-group')]//div[contains(@class, 'oxd-select-text')]
    Click Element                   xpath://label[text()='Nationality']/ancestor::div[contains(@class, 'oxd-input-group')]//div[contains(@class, 'oxd-select-text')]
    Wait Until Element Is Visible    xpath://*[text()='${Nationnalite}']
    Click Element                   xpath://*[text()='${Nationnalite}']
    Wait Until Element Is Visible    xpath://label[text()='Marital Status']/ancestor::div[contains(@class, 'oxd-input-group')]//div[contains(@class, 'oxd-select-text')]
    Click Element                   xpath://label[text()='Marital Status']/ancestor::div[contains(@class, 'oxd-input-group')]//div[contains(@class, 'oxd-select-text')]
    Wait Until Element Is Visible    xpath://*[text()='${EtatCivile}']
    Click Element                   xpath://*[text()='${EtatCivile}']
    Wait Until Element Is Visible    xpath://label[text()='Date of Birth']/ancestor::div[contains(@class, 'oxd-input-group')]//input
    Input Text                       xpath://label[text()='Date of Birth']/ancestor::div[contains(@class, 'oxd-input-group')]//input    ${DateNaissance}
    Wait Until Element Is Visible    xpath://div[contains(@class, '--gender-grouped-field')]
    Click Element    xpath://div[@class="oxd-radio-wrapper" and label[contains(.,'${Sexe}')]]
    Wait Until Element Is Visible    css=button[type='submit']
    Click Element                    css=button[type='submit']
SearcheEmpByName
        Wait Until Element Is Visible    xpath://li[contains(@class='oxd-topbar-body-nav-tab --visited') and text()='Liste des employés']

logout
    Wait Until Element Is Visible    ${MenuProfil}  timeout=30s
    Click Element                    ${MenuProfil}
    Wait Until Element Is Visible    ${LogoutButton}    timeout=30s
    Click Element                    ${LogoutButton}