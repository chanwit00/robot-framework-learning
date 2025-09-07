*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}      https://opensource-demo.orangehrmlive.com/
${BROWSER}       chrome
${USERNAME}      Admin
${PASSWORD}      admin123
${DASHBOARD_H1}  css=h6.oxd-topbar-header-breadcrumb-module
${search_term}   Admin

*** Keywords ***
Open App
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2


Login As Admin
    Wait Until Element Is Visible    name=username    10s
    Input Text      name=username    ${USERNAME}
    Input Text      name=password    ${PASSWORD}
    Click Button    css=button[type="submit"]

Invalid Login Shows Error
    Open App
    Input Text    name=username    wronguser
    Input Text    name=password    wrongpass
    Click Button  css=button[type="submit"]
    Wait Until Page Contains    Invalid credentials    5s


Should See Dashboard
    Wait Until Element Is Visible    ${DASHBOARD_H1}    10s
    Page Should Contain    Dashboard

Test Search
    Click Element       css=input[placeholder="Search"]
    Input Text    css=input[placeholder="Search"]    ${search_term}
    Press Keys    css=input[placeholder="Search"]    RETURN
    Wait Until Page Contains    ${search_term}    5s

Logout
    Click Element   css=span.oxd-userdropdown-tab
    Click Element   xpath=//a[text()="Logout"]

Close App
    Close All Browsers
