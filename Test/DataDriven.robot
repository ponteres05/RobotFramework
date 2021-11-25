*** Settings ***
Documentation       To validate Unsuccessful Login scenarios
Library             DataDriver      file=../Data/InvalidLoginData.csv   encoding=UTF-8  dialect=unix
Resource            ../Resources/WebShop.robot
Test Setup          Open "Web Shop" Application
Test Teardown       Close "Web Shop" Application
Test Template       Validate Unsuccessful Login

#robot -d ../Results DataDriven.robot

*** Test Cases ***
Unsuccessful Login

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]                                                 ${username}    ${password}    ${expected_error_message}
    LandingPage.Go to "Login" Page
    Login.Fill in the "Login" Form and click "Login" button     ${username}    ${password}
    Login.Click "Login" button
    Login.Verify that correct Error message is received         ${expected_error_message}



