*** Settings ***
Documentation       Shop Page Keywords Repository
Library             SeleniumLibrary
Resource            C:\\dev\\Jenkins\\workspace\\Webshop - Win10 Home - Chrome\\Data\\Config.robot
Resource            C:\\dev\\Jenkins\\workspace\\Webshop - Win10 Home - Chrome\\Data\\InputData.robot

*** Variables ***
${SEARCH_FIELD}             id: small-searchterms
${SEARCH_BUTTON}            css: .search-box-button
${ITEM_IMAGE}               css: img[alt='Picture of 14.1-inch Laptop']
${QUANTITY_INPUT_BOX}       id: addtocart_31_EnteredQuantity
${ADD_TO_CART_BUTTON}       id: add-to-cart-button-31

*** Keywords ***
Search "Product" item
    [Arguments]     ${product}
    Type Product to "Search" field  ${product}
    Click "Search" button

Type Product to "Search" field
    [Arguments]     ${product}
    input text      ${SEARCH_FIELD}               ${product}

Click "Search" button
    click button    ${SEARCH_BUTTON}

Select "Product" image
    click image     ${ITEM_IMAGE}

Input Item quantity
    [Arguments]     ${item_quantity}
    input text      ${QUANTITY_INPUT_BOX}   ${item_quantity}

Click "Add to Cart" button
    click button    ${ADD_TO_CART_BUTTON}