*** Settings ***
LIBRARY    SeleniumLibrary

*** Test Cases ***
testcase
    [Tags]    custom_tag
    Open Browser    http://www.google.com    chrome
    Maximize Browser Window    
    Close Browser    

testcase2
    [Tags]    custom_tag
    Open Browser    http://www.github.com    chrome
    Maximize Browser Window    
    Close Browser    

testcase3
    [Tags]    custom_tag
    Open Browser    http://www.linkedin.com    chrome
    Maximize Browser Window    
    Close Browser    

