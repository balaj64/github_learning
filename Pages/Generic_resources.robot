*** Settings ***
Documentation    This file is have a Generic function which is commonly used
Library    SeleniumLibrary


*** Variables ***


*** Keywords ***
Open Browser and launch pament page
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
    Maximize Browser Window
    
Wait untill the locator is displayed
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}