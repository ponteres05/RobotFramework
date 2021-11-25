*** Settings ***
Documentation       Landing Page Keywords Repository
Library             SeleniumLibrary
Resource            /Data/Config.robot
Resource            /Data/InputData.robot

*** Variables ***
${REGISTER_LINK}            css: .ico-register
${CONTINUE_BUTTON}          css: .register-continue-button
${ACCOUNT_LINK}             css: .account
${LOGIN_LINK}               css: .ico-login
${LOGOUT_LINK}              css: .ico-logout

*** Keywords ***
Go to "Register" Page
    click element   ${REGISTER_LINK}

Verify that registration is successful
    Element should contain    ${ACCOUNT_LINK}     ${EMAIL}
    element should not be visible   ${REGISTER_LINK}

Click "Continue" button
    click button    ${CONTINUE_BUTTON}

Go to "Login" Page
    click element   ${LOGIN_LINK}

Click "Logout" link
    click element   ${LOGOUT_LINK}

Verify that User has successfully logged out
    element should be visible    ${LOGIN_LINK}
    element should be visible    ${REGISTER_LINK}