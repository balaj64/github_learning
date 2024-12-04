*** Settings ***
Documentation    To Validate login form
Library    SeleniumLibrary
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    Open browser with payment page
Test Teardown    Sleep    5s

*** Variables ***
${okey_button}    okayBtn
${username}        rahulshettyacademy
${password}        learning

*** Test Cases ***
#Validate Radio button and check box
#    Fill the login form and select the radio button
#    wait untill the Alert is apper
#    Select the dropdown
#    Select checkbox

Handling child windows
    Select the blinking text from the payment page
    Verify the new window to be open or not
    Grab the email id from the new page

*** Keywords ***
Open browser with payment page
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window

Fill the login form and select the radio button
    Input Text    username    ${username}
    Input Password    password    ${password}
    Click Element    xpath:(//span[@class='checkmark'])[2]
    
wait untill the Alert is apper
    Wait Until Element Is Visible   ${okey_button} 
    Click Button    ${okey_button}
    Wait Until Element Is Not Visible    ${okey_button}

Select the dropdown
    Select From List By Value    //select[@class='form-control']    teach
    
Select checkbox
    Click Element        id:terms
    Checkbox Should Be Selected    id:terms

Select the blinking text from the payment page
    Click Element        css:a.blinkingText
    Switch Window    NEW

Verify the new window to be open or not
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the email id from the new page
    ${text}    Get Text    css:.red
    @{splited_string}    Split String    ${text}    at
    Log To Console    ${splited_string}
    ${email}    Get From List    ${splited_string}    1
    Log To Console    ${email}
    





    
