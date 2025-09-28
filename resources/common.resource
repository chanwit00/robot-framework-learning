*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}      https://opensource-demo.orangehrmlive.com/
${BROWSER}       chrome
${USERNAME}      Admin
${PASSWORD}      admin123
${DASHBOARD_H1}  css=h6.oxd-topbar-header-breadcrumb-module
${search_Admin}   Admin
${search_Pim}   PIM
${search_Claim}   Claim

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

Search
    Click Element    css=input[placeholder="Search"]

Search PIM
    Input Text    css=input[placeholder="Search"]    ${search_Pim} 
    Press Keys    css=input[placeholder="Search"]    RETURN
    Wait Until Page Contains    ${search_Pim}     5s
    Click Element    xpath=//span[text()="${search_Pim}"]
    Wait Until Page Contains    Employee Information     5s
    Click Element    (//input[@placeholder="Type for hints..."])[1]
    Input Text    (//input[@placeholder="Type for hints..."])[1]    Nezuko
    Click Element   css=button[type="submit"]

Logout
    Click Element   css=span.oxd-userdropdown-tab
    Click Element   xpath=//a[text()="Logout"]

Close App
    Close All Browsers
