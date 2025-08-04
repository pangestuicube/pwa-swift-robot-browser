*** Settings ***
Documentation       This file contains locators for login page


*** Variables ***
${LOGIN_EMAIL_INPUT}        xpath=//input[@type='text'][@name='username']
${LOGIN_PASSWORD_INPUT}     xpath=//input[@type='password']
${LOGIN_BUTTON}             xpath=//button[@id='swiftLoginButton']
