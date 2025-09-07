*** Settings ***
Resource       ../resources/common.resource
Test Teardown  Close App

*** Test Cases ***
# Login Successful
#     Open App
#     Login As Admin
#     Should See Dashboard

Test Search and actions in PIM
    Open App
    Login As Admin
    Should See Dashboard
    Search
    PIM
    Logout

# Logout Failed
#     Open App
#     Invalid Login Shows Error