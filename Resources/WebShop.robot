*** Settings ***
Documentation       WebShop Keywords Repository
Resource            ../Resources/PO/Common.robot
Resource            ../Resources/PO/LandingPage.robot
Resource            ../Resources/PO/Registration.robot
Resource            ../Resources/PO/Login.robot
Resource            ../Resources/PO/Shop.robot
Resource            ../Resources/PO/ShoppingCart.robot
Resource            ../Resources/PO/Checkout.robot

*** Keywords ***
Open "Web Shop" Application
    Common.Open Application

Close "Web Shop" Application
    Common.Close Application

Go to "Register" Page
    LandingPage.Go to "Register" Page

Verify that registration is successful
    LandingPage.Verify that registration is successful

Click "Continue" button
    LandingPage.Click "Continue" button

Go to "Login" Page
    LandingPage.Go to "Login" Page

Click "Logout" link
    LandingPage.Click "Logout" link

Verify that User has successfully logged out
    LandingPage.Verify that User has successfully logged out

Fill in the "Login" Form and click "Login" button
    Login.Fill in the "Login" Form and click "Login" button    ${EMAIL}      ${PASSWORD}

Verify that User has successfully logged in
    Login.Verify that User has successfully logged in

Fill in the "Registration" Form and click "Register" button
    Registration.Generate Random Email
    Registration.Fill in the "Registration" Form and click "Register" button   ${FIRST_NAME}   ${LAST_NAME}    ${EMAIL}    ${PASSWORD}     ${CONFIRM_PASSWORD}

Search "Product" item
    Shop.Search "Product" item  ${PRODUCT}

Select "Product" image
    Shop.Select "Product" image

Input Item quantity
    Shop.Input Item quantity    ${ITEM_QUANTITY}

Click "Add to Cart" button
    Shop.Click "Add to Cart" button

Click "Shopping Cart" link
    ShoppingCart.Click "Shopping Cart" link

Tick item checkbox
    ShoppingCart.Tick item checkbox

Tick "terms of service" checkbox
    ShoppingCart.Tick "terms of service" checkbox

Click "Checkout" button
    ShoppingCart.Click "Checkout" button

Fill in "Billing Address" Form
    Checkout.Fill in "Billing Address" Form     ${COUNTRY}  ${CITY}  ${ADDRESS1}  ${ADDRESS2}  ${ZIP_POSTAL_CODE}  ${PHONE_NUMBER}

Select/Add New Shipping Address
    Checkout.Click Shipping Address "Continue" button

Select Shipping Method
    Checkout.Click Shipping Method "Continue" button

Select Payment Method
    Checkout.Click Payment Method "Continue" button

Review Payment Information
    Checkout.Click Payment Information "Continue" button

Confirm Order
    Checkout.Click "Confirm" button

Verify that order has been successfully processed
    Checkout.Verify that order has been successfully processed

Verify that correct Error message is received
    Login.Verify that correct Error message is received   ${expected_error_message}
