*** Settings ***
Documentation       This file contains keywords for homepage

Library             Browser
Resource            ../resources/locators/home_page_locators.resource
Resource            ../resources/locators/login_page_locators.resource
Variables           ../resources/testdata/testdata.py


*** Keywords ***
Go To Login Page
    [Documentation]    Navigate to the login page from the homepage
    Wait For Elements State    selector=${HEADER_LINK_TO_LOGIN}    state=enabled    timeout=${TIMEOUT_MEDIUM}
    Click    selector=${HEADER_LINK_TO_LOGIN}
    Wait For Elements State    selector=${LOGIN_EMAIL_INPUT}    state=visible    timeout=${TIMEOUT_MEDIUM}
