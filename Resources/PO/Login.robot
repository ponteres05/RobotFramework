*** Settings ***
Documentation       Login Page Keywords Repository
Library             SeleniumLibrary
Resource            C:\\dev\\Jenkins\\workspace\\Webshop\\Data\\Config.robot
Resource            C:\\dev\\Jenkins\\workspace\\Webshop\\Data\\InputData.robot

*** Variables ***
${LOGIN_EMAIL_FIELD}        id: Email
${LOGIN_PASSWORD_FIELD}     id: Password
${LOGIN_BUTTON}             css: .login-button

*** Keywords ***
Fill in the "Login" Form and click "Login" button
    [Arguments]                 ${email}                ${password}
    Fill in Login "Email" field       ${email}
    Fill in Login "Password" field    ${password}
    Click "Login" button

Click "Login" button
    click button    ${LOGIN_BUTTON}

Verify that User has successfully logged in
    Element should contain    ${ACCOUNT_LINK}     ${EMAIL}

Verify that correct Error message is received
    [Arguments]     ${expected_error_message}
    Sleep   5
    page should contain    ${expected_error_message}     TRACE

Fill in Login "Email" field
    [Arguments]     ${email}
    input text      ${LOGIN_EMAIL_FIELD}              ${email}

Fill in Login "Password" field
    [Arguments]     ${password}
    input password  ${LOGIN_PASSWORD_FIELD}            ${password}
