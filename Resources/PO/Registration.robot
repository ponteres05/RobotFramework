*** Settings ***
Documentation       Registration Page Keywords Repository
Library             SeleniumLibrary
Library             String
Resource            /Data/Config.robot
Resource            /Data/InputData.robot

*** Variables ***
${MALE_RADIO_BUTTON}            id: gender-male
${FIRST_NAME_FIELD}             id: FirstName
${LAST_NAME_FIELD}              id: LastName
${REGISTRATION_EMAIL_FIELD}     id: Email
${REGISTRATION_PASSWORD_FIELD}  id: Password
${CONFIRM_PASSWORD_FIELD}       id: ConfirmPassword
${REGISTER_BUTTON}              id: register-button

*** Keywords ***
Fill in the "Registration" Form and click "Register" button
    [Arguments]    ${first_name}   ${last_name}    ${email}    ${password}    ${confirm_password}
    Select "Male" radio button
    Fill in "First Name" field                      ${first_name}
    Fill in "Last Name" field                       ${last_name}
    Fill in Registration "Email" field              ${email}
    Fill in Registration "Password" field           ${password}
    Fill in "Confirm Password" field                ${confirm_password}
    Click "Register" button

Select "Male" radio button
    click element   ${MALE_RADIO_BUTTON}

Fill in "First Name" field
    [Arguments]     ${first_name}
    input text      ${FIRST_NAME_FIELD}           ${first_name}

Fill in "Last Name" field
    [Arguments]     ${last_name}
    input text      ${LAST_NAME_FIELD}            ${last_name}

Fill in "Confirm Password" field
    [Arguments]     ${confirm_password}
    input password  ${CONFIRM_PASSWORD_FIELD}     ${confirm_password}

Click "Register" button
    click button    ${REGISTER_BUTTON}

Generate Random Email
    ${random_string}        Generate Random String      6               [LOWER]
    ${email_username}       Catenate                    SEPARATOR=_     isaacponteres         ${random_string}
    ${email_value}          Catenate                    SEPARATOR=@     ${email_username}     yahoo.com
    Set Global Variable     ${EMAIL}                    ${email_value}

Fill in Registration "Email" field
    [Arguments]     ${email}
    input text      ${REGISTRATION_EMAIL_FIELD}              ${email}

Fill in Registration "Password" field
    [Arguments]     ${password}
    input password  ${REGISTRATION_PASSWORD_FIELD}           ${password}