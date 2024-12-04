*** Settings ***
Documentation    To Validate login form
Library    SeleniumLibrary
Library    Collections
Test Setup    Open browser with payment page
Test Teardown    Close Browser
Resource    resource.robot

*** Variables ***
${Error_Message}    //div[contains(@class,'alert-danger')]

*** Test Cases ***
#Validate unsuccessful login
#    Fill the login form    ${User_name}    ${Invalid_Password}
#    wait until the element is located on that page   ${Error_Message}
#    Verify the error message is correct

Validate card display in shoping page
    Fill The Login Form  ${User_name}     ${Valid_Password}
    wait until the element is located on that page    css:.nav-link
    Verify card titles in shop page
    Select the card    Blackberry

*** Keywords ***


Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password    ${password}
    Click Button    signInBtn

wait until the element is located on that page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify the error message is correct
#    ${result}    Get Text    xpath:${Error_Message}
#    Should Be Equal As Strings   ${result}    Incorrect username/password.
    Element Text Should Be   xpath:${Error_Message}     Incorrect username/password.

Verify card titles in shop page
    @{expected_element}    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{elements}    Get Webelements    css:.card-title
    @{actual_list}    Create List    
    FOR    ${element}    IN    @{elements}
        Log   ${element.text}
        Append To List    ${actual_list}    ${element.text}
    END
    Lists Should Be Equal    ${expected_element}    ${actual_list}
    
Select the card
    [Arguments]    ${cardname}
    @{elements}    Get Webelements    css:.card-title
    ${index}    Set Variable    1
    FOR    ${element}    IN    @{elements}
#        ${text}    Get Text    ${element}
        Exit For Loop If   '${cardname}' == '${element.text}'  # Correct usage
        ${index}=    Evaluate    ${index}+1
        Log To Console    ${index}
    END
    Click Button    xpath:(//div[@class='card-footer'])[${index}]/button
    Sleep    10s