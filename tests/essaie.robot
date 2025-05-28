*** Settings ***
Library       SeleniumLibrary

*** Test Cases ***
testcase
    Open Browser    http://www.google.com    chrome
    Maximize Browser Window
    Close Browser

testcase2
    Open Browser    http://www.github.com    chrome
    Maximize Browser Window
    Close Browser

testcase3
    Open Browser    http://www.linkedin.com    chrome
    Maximize Browser Window
    Close Browser