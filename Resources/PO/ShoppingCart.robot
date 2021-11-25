*** Settings ***
Documentation       Shopping Cart Page Keywords Repository
Library             SeleniumLibrary
Resource            C:\\dev\\Jenkins\\workspace\\Webshop\\Data\\Config.robot
Resource            C:\\dev\\Jenkins\\workspace\\Webshop\\Data\\InputData.robot

*** Variables ***
${SHOPPING_CART_LINK}             css: a[class='ico-cart']
${ITEM_CHECKBOX}                  css: input[type='checkbox']
${TERMS_OF_SERVICE_CHECKBOX}      id: termsofservice
${CHECKOUT_BUTTON}                id: checkout

*** Keywords ***
Click "Shopping Cart" link
    Sleep   3
    click element   ${SHOPPING_CART_LINK}

Tick item checkbox
    click element   ${ITEM_CHECKBOX}

Tick "terms of service" checkbox
    click element   ${TERMS_OF_SERVICE_CHECKBOX}

Click "Checkout" button
    click button    ${CHECKOUT_BUTTON}