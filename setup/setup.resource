*** Settings ***
Documentation       This file contains keywords for env setup

Library             Browser
Variables           ../resources/testdata/testdata.py


*** Variables ***
${BROWSER}      webkit
${HEADLESS}     False


*** Keywords ***
Start Test Setup
    [Documentation]    Membuka browser & membuka halaman homepage sebelum test
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${BASE_URL}
    Browser.Set Viewport Size    width=1920    height=1080

End Test Teardown
    [Documentation]    Menutup browser setelah test selesai
    Delete All Cookies
    Close Browser
