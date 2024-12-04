*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${country}    India
${suggession}    css:.suggestions

*** Keywords ***
Enter the country and Conform the purchase
    Input Text    country    ${country}
    Sleep    5s
    Wait Until Element Is Visible    ${suggession}
    Click Element    xpath://a[text()='${country}']
    Sleep    5s
    Click Element        xpath://label[@for='checkbox2']
    Click Button    css:.btn-success
    Page Should Contain    Success!
        