*** Settings ***
Documentation    This file is for executing the parameterization test
Library    SeleniumLibrary
Test Template      Verify unsuccessfull login
Test Setup      Open browser and launch payement login page
Test Teardown    Close Browser

*** Variables ***
${Error_message}      xpath://div[contains(@class,'alert-danger')]

*** Test Cases ***    username    Password
Invalid Username      Bala        learning
Invalid Password      rahulshetty    12345
Special Charactor     *$#            learning

*** Keywords ***
Verify unsuccessfull login
    [Arguments]    ${username}    ${password}
    Fill the login form    ${username}    ${password}
    Wait untill the element is appear
    Validate the error message

Open browser and launch payement login page
    Create Webdriver        Chrome
    Go To        https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window
    
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text     username        ${username}
    Input Password    password     ${password}
    Click Button    signInBtn
    
Wait untill the element is appear
    Wait Until Element Is Visible    ${Error_message}
    
Validate the error message
    Element Text Should Be    ${Error_message}        Incorrect username/password.
    Sleep    5s
