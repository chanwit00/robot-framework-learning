*** Settings ***
Resource       ../resources/common.resource
Test Teardown  Close App

*** Test Cases ***
Login Successful
    Open App
    Login As Admin
    Should See Dashboard

Logout Failed
    Open App
    Invalid Login Shows Error