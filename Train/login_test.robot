*** Settings ***
Resource       ../resources/common.resource
Suite Setup    Open App
Test Teardown  Close App

*** Test Cases ***
Login Successful
    [Tags]    type:smoke    feature:auth    env:sit    flow:login_success
    Login As Admin
    Should See Dashboard

Logout Failed
    [Tags]    type:regression    feature:auth    env:sit    flow:login_negative
    Invalid Login Shows Error

Test Search and actions in PIM
    [Tags]    type:regression    feature:pim    env:sit    flow:pim_search
    Login As Admin
    Should See Dashboard
    Search
    Search PIM
    Logout

# Test Search and actions in Time
#     Login As Admin
#     Should See Dashboard
#     Search
#     Search Time
#     Logout