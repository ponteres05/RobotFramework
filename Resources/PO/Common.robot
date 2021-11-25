*** Settings ***
Documentation       Common Keywords Repository
Library             SeleniumLibrary

*** Keywords ***
Open Application
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${EXCLUDES}                 Create list     enable-logging
    Call Method    ${chrome_options}    add_experimental_option    excludeSwitches    ${EXCLUDES}
    Open Browser    ${LOGIN_URL}    chrome    options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}
    maximize browser window
    Title Should Be     Demo Web Shop

Close Application
    close browser