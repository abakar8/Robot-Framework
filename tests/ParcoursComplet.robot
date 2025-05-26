*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/ParcoursComplet/" -i "ParcoursComplet" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#Force Tags      ParcoursComplet
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  1s
Test Teardown   Close Browser
Library         DataDriver        ../jeu_de_donnees/test.csv      delimiter=;
Variables        ../resources/locator.py
#Resource        ../resources/Keywords.resource
Test Template     addEmployes

*** Test Cases ***
addEmployes  ${Nom}  ${Prenom}  ${Id}  ${Nationnalite}  ${EtatCivile}  ${DateNaissance}  ${Sexe}       Nom      Prenom


*** Keywords ***
addEmployes
    [Arguments]   ${Nom}  ${Prenom}   ${Id}   ${Nationnalite}     ${EtatCivile}   ${DateNaissance}    ${Sexe}
    Log    ${Nom}
    Log    ${Prenom}
    Log    ${id}
    #${Nationnalite}  ${EtatCivile}  ${DateNaissance}  ${Sexe}
    Open Browser    http://localhost/orangehrm-5.7/web/index.php/auth/login    Firefox
    Title Should Be    OrangeHRM
    Input Text    ${UsernameInputBox}    admin
    Input Text    ${PasswordInputBox}     Abandass-2024
    Click Button  ${LoginButton}
    Wait Until Element Is Visible    ${PimButton}
    Click Element                    ${PimButton}
    Wait Until Element Is Visible    ${AddButtonTittle}
    Wait Until Element Is Visible    ${AddButton}
    Click Element                    ${AddButton}
    Input Text                       ${EmployeeFirstName}    ${Nom}
    Input Text                       ${EmployeeLastName}     ${Prenom}
    Input Text                       ${IdEmployee}           ${id}
    Wait Until Element Is Visible    ${SubmitButton}
    Click Element                    ${SubmitButton}
    Wait Until Element Is Visible     ${PersonalDetailsTittle}
   Wait Until Element Is Visible    ${EmpNationality}
    Click Element                   ${EmpNationality}
    Wait Until Element Is Visible   ${EmpNationalityInput}='${Nationnalite}']
    Click Element                   ${EmpNationalityInput}='${Nationnalite}']
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
    Wait Until Element Is Visible    css=button[type='submit']
    Click Element                    css=button[type='submit']
    Wait Until Element Is Visible    ${MenuProfil}  timeout=30s
    Click Element                    ${MenuProfil}
    Click Element                    ${LogoutButton}
