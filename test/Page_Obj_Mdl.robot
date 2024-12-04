*** Settings ***
Documentation    This file is related to worrking with page object model
Library    SeleniumLibrary
Resource    ../Pages/Login_page.robot
Resource    ../Pages/Shop_page.robot
Resource    ../Pages/Checkout_page.robot
Resource    ../Pages/Conformation_page.robot
Resource    ../Pages/Generic_resources.robot
Library        ../Custom_Library/Custom_library.py


*** Variables ***
${element}    xpath://div/h1
@{ProductList}    Nokia Edge    Blackberry


*** Test Cases ***
End to End Purchase Process
    Generic_resources.Open Browser and launch pament page
    Fill the login form    ${username}    ${password}
    Wait untill the locator is displayed    ${element}
    Add item to the card    ${ProductList}
    Verify the item to be added in card    ${ProductList}
    Checkout the product
    Enter the country and Conform the purchase



*** Keywords ***
