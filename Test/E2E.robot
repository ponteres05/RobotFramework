*** Settings ***
Documentation       To validate End to End Customer Order transaction
Library             SeleniumLibrary
#Test Setup          LandingPage.Open Web Shop Application
#Test Teardown       Common.Close Application
Resource            ../Resources/WebShop.robot

#robot -d ../Results E2E.robot

*** Test Cases ***
Open "Web Shop" Application
    WebShop.Open "Web Shop" Application

Successful Registration
    WebShop.Go to "Register" Page
    WebShop.Fill in the "Registration" Form and click "Register" button
    WebShop.Verify that registration is successful
    WebShop.Click "Continue" button

Succesful Logout
    WebShop.Click "Logout" link
    WebShop.Verify that User has successfully logged out

Successful Login
    WebShop.Go to "Login" Page
    WebShop.Fill in the "Login" Form and click "Login" button
    WebShop.Verify that User has successfully logged in

Search Product
    WebShop.Search "Product" item

Input Product Details and Add to Cart
    WebShop.Select "Product" image
    WebShop.Input Item quantity
    WebShop.Click "Add to Cart" button

Select Product(s) to checkout and Agree to terms and service
    WebShop.Click "Shopping Cart" link
    WebShop.Tick item checkbox
    Webshop.Tick "terms of service" checkbox
    Webshop.Click "Checkout" button

Checkout Product
    Webshop.Fill in "Billing Address" Form
    Webshop.Select/Add New Shipping Address
    Webshop.Select Shipping Method
    Webshop.Select Payment Method
    Webshop.Review Payment Information
    Webshop.Confirm Order
    Webshop.Verify that order has been successfully processed

Close "Web Shop" Application
    WebShop.Close "Web Shop" Application



