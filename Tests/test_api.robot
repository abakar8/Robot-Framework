*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Vérifier une API publique
    ${response}    GET    https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}rowser