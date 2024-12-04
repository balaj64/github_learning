*** Settings ***
Documentation    This file is contain all the login related function
Library    SeleniumLibrary


*** Variables ***
${username}    rahulshettyacademy
${password}    learning

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password   ${password}
    Click Button    signInBtn