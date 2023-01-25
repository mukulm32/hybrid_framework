*** Settings ***

Documentation  This file contains test case related to invalid login

Resource    ../resource/base/common_functionalities.resource

Test Setup   Launch Browser and Navigate to URL
Test Teardown   Close Browser
Test Template  valid login Template

*** Test Cases ***
TC1  admin  admin123  Dashboard


*** Keywords ***
valid login Template
    [Arguments]  ${username}  ${password}  ${validdata}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    class=oxd-button
    Element Should Contain    xpath=//h6[contains(@class,'oxd-topbar-header-breadcrumb-module')]    ${validdata}
