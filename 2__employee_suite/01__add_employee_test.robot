*** Settings ***

Documentation  This file contains test case related to invalid login

Resource    ../resource/base/common_functionalities.resource

Library  DataDriver  file=../test_data/orange_data.xlsx  sheet_name=employee_valid_details

Test Setup   Launch Browser and Navigate to URL
Test Teardown   Close Browser

Test Template  Add valid Employee Template

*** Test Cases ***
Add valid Employee test  ${test_name}


*** Keywords ***
Add valid Employee Template
    [Arguments]  ${username}  ${password}  ${firstName}  ${middleName}  ${lastName}  ${expected_1}  ${expected_2}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    class=oxd-button
    Click Element    xpath=//span[contains(normalize-space(),'PIM')]
    Click Element    link=Add Employee
    Input Text    name=firstName    ${firstName}
    Input Text    name=middleName    ${middleName}
    Input Text    name=lastName    ${lastName}
    Click Element    xpath=//button[text()=' Save ']
    Wait Until Page Contains    ${firstName}${SPACE}${lastName}
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstName}')]    ${expected_1}
    Element Attribute Value Should Be    name=firstName    value    ${expected_2}


