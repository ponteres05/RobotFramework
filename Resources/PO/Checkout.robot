*** Settings ***
Documentation       Checkout Page Keywords Repository
Library             SeleniumLibrary
Resource            C:\\dev\\Jenkins\\workspace\\Webshop - Win10 Home - Chrome\\Data\\Config.robot
Resource            C:\\dev\\Jenkins\\workspace\\Webshop - Win10 Home - Chrome\\Data\\InputData.robot

*** Variables ***
${BILLING_ADDRESS_COUNTRY_DROPDOWN}     id: BillingNewAddress_CountryId
${CITY_FIELD}                           id: BillingNewAddress_City
${ADDRESS1_FIELD}                       id: BillingNewAddress_Address1
${ADDRESS2_FIELD}                       id: BillingNewAddress_Address2
${ZIP_POSTAL_CODE_FIELD}                name: BillingNewAddress.ZipPostalCode
${PHONE_NUMBER_FIELD}                   name: BillingNewAddress.PhoneNumber
${BILLING_ADDRESS_CONTINUE_BUTTON}      css: .new-address-next-step-button
${SHIPPING_ADDRESS_CONTINUE_BUTTON}     xpath: /html/body/div[4]/div[1]/div[4]/div/div/div[2]/ol/li[2]/div[2]/div/input
${SHIPPING_METHOD_CONTINUE_BUTTON}      css: .shipping-method-next-step-button
${PAYMENT_METHOD_CONTINUE_BUTTON}       css: .payment-method-next-step-button
${PAYMENT_INFORMATION_CONTINUE_BUTTON}  css: .payment-info-next-step-button
${CONFIRM_BUTTON}                       css: .confirm-order-next-step-button
${SUCCESSFUL_ORDER_TRANSACTION}         xpath: /html/body/div[4]/div[1]/div[4]/div/div/div[2]/div/div[1]/strong


*** Keywords ***
Fill in "Billing Address" Form
    [Arguments]     ${country}     ${city}     ${address1}     ${address2}     ${zip_postal_code}      ${phone_number}
    Click Billing Address "Country" dropdown
    Select "Country" option             ${country}
    Fill in "City" field                ${city}
    Fill in "Address1" field            ${address1}
    Fill in "Address2" field            ${address2}
    Fill in "Zip/postal code" field     ${zip_postal_code}
    Fill in "Phone number" field        ${phone_number}
    Click Billing Address "Continue" button

Click Billing Address "Country" dropdown
    click element   ${BILLING_ADDRESS_COUNTRY_DROPDOWN}

Select "Country" option
    [Arguments]     ${country}
    Select From List By Label    ${BILLING_ADDRESS_COUNTRY_DROPDOWN}    ${country}

Fill in "City" field
    [Arguments]     ${city}
    input text   ${CITY_FIELD}  ${city}

Fill in "Address1" field
    [Arguments]     ${address1}
    input text   ${ADDRESS1_FIELD}  ${address1}

Fill in "Address2" field
    [Arguments]     ${address2}
    input text   ${ADDRESS2_FIELD}  ${address2}

Fill in "Zip/postal code" field
    [Arguments]     ${zip_postal_code}
    input text   ${ZIP_POSTAL_CODE_FIELD}  ${zip_postal_code}

Fill in "Phone number" field
    [Arguments]     ${phone_number}
    input text   ${PHONE_NUMBER_FIELD}  ${phone_number}

Click Billing Address "Continue" button
    click button    ${BILLING_ADDRESS_CONTINUE_BUTTON}

Click Shipping Address "Continue" button
    Sleep    3
    click button    ${SHIPPING_ADDRESS_CONTINUE_BUTTON}

Click Shipping Method "Continue" button
    Sleep    3
    click button    ${SHIPPING_METHOD_CONTINUE_BUTTON}

Click Payment Method "Continue" button
    Sleep    3
    click button    ${PAYMENT_METHOD_CONTINUE_BUTTON}

Click Payment Information "Continue" button
    Sleep    3
    click button    ${PAYMENT_INFORMATION_CONTINUE_BUTTON}

Click "Confirm" button
    Sleep    3
    click button    ${CONFIRM_BUTTON}

Verify that order has been successfully processed
    Sleep   5
    page should contain     Your order has been successfully processed!     TRACE