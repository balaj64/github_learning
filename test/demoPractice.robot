*** Settings ***
Documentation    To Validate login form
Library    SeleniumLibrary

*** Variables ***
${Error_Message}    //div[contains(@class,'alert-danger')]

*** Test Cases ***
Validate unsuccessful login
    Open browser with payment page
    Fill the login form
    wait untill the error message appear
    Verify the error message is correct

*** Keywords ***
Open browser with payment page
#    Create Webdriver    Chrome    #we can customize using create webdriver keyword
#    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome

Fill the login form
    Input Text        username    rahulshettyacademy
    Input Password    password    12345
    Click Button    signInBtn

wait untill the error message appear
    Wait Until Element Is Visible    xpath:${Error_Message}
    
Verify the error message is correct
    ${result}    Get Text    xpath:${Error_Message}
    Should Be Equal As Strings   ${result}    Incorrect username/password.