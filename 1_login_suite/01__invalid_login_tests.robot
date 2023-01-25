*** Settings ***

Documentation  This file contains test case related to invalid login

Resource    ../resource/base/common_functionalities.resource

Library  DataDriver  file=../test_data/orange_data.xlsx  sheet_name=Invalid Login Test

Test Setup   Launch Browser and Navigate to URL
Test Teardown   Close Browser

Test Template   Invalid Login Template


*** Test Cases ***

TC1


*** Keywords ***
Invalid Login Template
    [Arguments]  ${username}  ${password}  ${expected error}
    #Launch Browser and Navigate to URL
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    class=oxd-button
    Element Should Contain    xpath=//p[contains(@class,'oxd-alert-content-text')]    ${expected error}
