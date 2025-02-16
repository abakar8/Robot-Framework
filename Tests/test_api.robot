*** Settings ***
Library    RequestsLibrary
Force Tags    test_api
Suite Setup    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com

*** Test Cases ***
Test GET Request
    ${response}=    GET On Session    jsonplaceholder    /posts/1
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

Test POST Request
    ${data}=    Create Dictionary    title=foo    body=bar    userId=1
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${data}
    Should Be Equal As Strings    ${response.status_code}    201
    Log To Console    ${response.json()}

Test PUT Request
    ${data}=    Create Dictionary    title=updated title    body=updated body    userId=1
    ${response}=    PUT On Session    jsonplaceholder    /posts/1    json=${data}
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

Test DELETE Request
    ${response}=    DELETE On Session    jsonplaceholder    /posts/1
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}