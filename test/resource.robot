*** Settings ***
Documentation    This is the library file
Library    SeleniumLibrary


*** Variables ***
${User_name}    rahulshettyacademy
${Invalid_Password}    12345
${Valid_Password}    learning


*** Keywords ***
Open browser with payment page
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window