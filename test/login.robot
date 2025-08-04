*** Settings ***
Documentation       Test suite for login functionality of Swift PWA

Resource            ../setup/setup.resource
Resource            ../pages/login_page.resource
Resource            ../pages/home_page.resource
Variables           ../resources/testdata/testdata.py

Test Setup          setup.Start Test Setup
Test Teardown       setup.End Test Teardown


*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Test case to verify login with valid credentials
    home_page.Go To Login Page
    login_page.User Login    email=${USER_EMAIL}    password=${USER_PASSWORD}
    login_page.Verify Login Success
