*** Settings ***
Documentation       API Testing
Library             Collections
Library             RequestsLibrary

*** Variables ***
${URL}          https://rahulshettyacademy.com
${NAME}         RobotFramework
${ISBN}         1000013
${AISLE}        1000013
${AUTHOR}       isaacstephen
${ID}

#robot -d ../Results API.robot

*** Test Cases ***
Add Book to the Database

    #Set Parameters
    &{req_body}=  Create Dictionary    name=${NAME}        isbn=${ISBN}     aisle=${AISLE}        author=${AUTHOR}

    #Execute POST call
    ${post_response}=     POST        ${URL}/Library/Addbook.php     json=${req_body}    expected_status=200

    #Log POST response in JSON format
    log      ${post_response.json()}

    #Validate that correct message is received
    Should be equal as Strings     successfully added      ${post_response.json()}[Msg]

    #Validate that Status is 200
    Status should be    200

    #Get ID value for GET Test Case
    ${ID}=    Get From Dictionary     ${post_response.json()}    ID
    Set Global Variable    ${ID}
    log  ${ID}

Get Book Details from the Database

    #Execute GET call
    ${get_response}=    GET   ${URL}/Library/GetBook.php        params=ID=${ID}      expected_status=200

    #Log GET response in JSON format
    log     ${get_response.json()}

    #Validate that correct book name is retrieved
    Should be equal as Strings       ${NAME}        ${get_response.json()}[0][book_name]
    #Validate that correct isbn is retrieved
    Should be equal as Strings       ${ISBN}       ${get_response.json()}[0][isbn]
    #Validate that correct aisle is retrieved
    Should be equal as Strings       ${AISLE}      ${get_response.json()}[0][aisle]
    #Validate that correct author is retrieved
    Should be equal as Strings       ${AUTHOR}      ${get_response.json()}[0][author]
    #Validate that Status is 200
    Status should be    200

Delete Book from the database

    #Set Parameters to delete
    &{delete_req_body}=      Create Dictionary       ID=${ID}

    #Make DELETE call
    ${delete_response}=   POST    ${URL}/Library/DeleteBook.php      json=&{delete_req_body}      expected_status=200

    #Log DELETE response in JSON format
    log      ${delete_response.json()}

    #Validate that correct message is received
    Should be Equal as Strings   book is successfully deleted    ${delete_response.json()}[msg]
