*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/login_logout/" -i "login_logout" Tests
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

****** Test Cases ***
Parcours Complet
   [Tags]    login_logout
   open OrangeHRM
   login
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