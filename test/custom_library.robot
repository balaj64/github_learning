*** Settings ***
Documentation    This file have a custom library related stff
Library    SeleniumLibrary
Library    ../Custom_Library/Shop.py


*** Variables ***
${username}    rahulshettyacademy
${password}    learning
${element}    xpath:h4//a
@{product_list}    Nokia Edge    Blackberry

*** Test Cases ***
Validate card in the checkout page
    open browser and go to login page
    fill the login form
    Wait Until Element Is Visible    css:h1
    Add Items To Card       ${product_list}


*** Keywords ***
open browser and go to login page
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
    Maximize Browser Window
    
fill the login form
    Input Text    username    ${username}
    Input Password       password    ${password}
    Click Button    signInBtn

    


