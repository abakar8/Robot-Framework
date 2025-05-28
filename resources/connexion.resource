*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/ParcoursComplet/" -i "ParcoursComplet" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Variables        ../resources/locator.py
*** Keywords ***
Given The user is on the homepage
     Open Browser    http://localhost/orangehrm-5.7/web/index.php/auth/login    Firefox
     Title Should Be    OrangeHRM
When The user enters a valid Username and Password
     Input Text    ${UsernameInputBox}    admin
     Input Text    ${PasswordInputBox}     Abandass-2024
     Click Button  ${LoginButton}
Then The results should be dashbord Orangehrm
    Wait Until Element Is Visible    ${PimButton}
