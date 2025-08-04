*** Settings ***
Documentation       This file contains keywords for login page

Library             Browser
Resource            ../resources/locators/login_page_locators.resource
Resource            ../resources/locators/my_account_page_locators.resource
Variables           ../resources/testdata/testdata.py


*** Keywords ***
Insert User Login Form
    [Documentation]    Insert user credentials
    [Arguments]    ${email}    ${password}
    Wait For Elements State    selector=${LOGIN_EMAIL_INPUT}    state=enabled
    Fill Text    selector=${LOGIN_EMAIL_INPUT}    txt=${email}
    Wait For Elements State    selector=${LOGIN_PASSWORD_INPUT}    state=enabled
    Fill Text    selector=${LOGIN_PASSWORD_INPUT}    txt=${password}

Submit Login Form
    [Documentation]    Submit the login form
    Wait For Elements State    selector=${LOGIN_BUTTON}    state=enabled    timeout=${TIMEOUT_MEDIUM}
    Click    selector=${LOGIN_BUTTON}

User Login
    [Documentation]    Perform user login with provided credentials
    [Arguments]    ${email}=${USER_EMAIL}    ${password}=${USER_PASSWORD}
    Insert User Login Form    ${email}    ${password}
    Submit Login Form
    RETURN    ${True}    # Assuming login is successful, return True

Verify Login Success
    [Documentation]    Validate that the user is logged in successfully
    Wait For Elements State    selector=${LOGIN_BUTTON}    state=hidden
    ${is_visible}=    Run Keyword And Return Status    Wait For Elements State
    ...    selector=${MY_ACCOUNT_MENU}
    ...    state=visible
    ...    timeout=${TIMEOUT_MEDIUM}
    Should Be True    ${is_visible}    User is not logged in successfully
