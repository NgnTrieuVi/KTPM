*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.saucedemo.com/
${BROWSER}        chrome
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Keywords ***
Open Web Saucedemo
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains Element    xpath://input[@id='user-name']    2s
    Maximize Browser Window

Login Saucedemo
    ${BTN_LOGIN}    Set Variable    xpath://input[@id='login-button']
    ${INPUT_USERNAME}    Set Variable    xpath://*[@id="user-name"]
    ${INPUT_PASSWORD}    Set Variable    xpath://*[@id="password"]
    Wait Until Element Is Visible    ${INPUT_USERNAME}
    Input Text    ${INPUT_USERNAME}    standard_user
    Wait Until Element Is Visible    ${INPUT_PASSWORD}
    Input Text    ${INPUT_PASSWORD}    secret_sauce
    Wait Until Element Is Visible    ${BTN_LOGIN}
    Click Button    ${BTN_LOGIN}
    Page Should Contain    Products

Add 1 Product To Cart
    ${BTN_ADD_FIRST_PRODUCT}    Set Variable    xpath://*[@id="add-to-cart-sauce-labs-backpack"]
    ${CART}    Set Variable    xpath://a[@class='shopping_cart_link']
    Wait Until Element Is Visible    ${BTN_ADD_FIRST_PRODUCT}
    Click Button    ${BTN_ADD_FIRST_PRODUCT}
    Wait Until Element Is Visible    xpath://*[@id="remove-sauce-labs-backpack"]
    Element Should Contain    xpath://*[@id="remove-sauce-labs-backpack"]    Remove
    Wait Until Element Is Visible    ${CART}
    Page Should Contain Element    ${CART}
    ${CART_BADGE}    Get Text    ${CART}/span
    Should Be Equal As Numbers    ${CART_BADGE}    1

Navigate To Cart Screen
    Wait Until Element Is Visible    xpath://*[@id="shopping_cart_container"]/a
    Click Element    xpath://*[@id="shopping_cart_container"]/a
    Page Should Contain    Your Cart

Information Product In Cart
    ${PRODUCT_NAME_ADD_CART_IN_CART}    Get Text    xpath://*[@id="item_4_title_link"]
    ${PRODUCT_DESCRIPTION_ADD_CART_IN_CART}    Get Text    xpath://*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[1]
    ${PRODUCT_PRICE_ADD_CART_IN_CART}    Get Text    xpath://*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[2]/div
    ${CLEANED_PRODUCT_PRICE_ADD_CART_IN_CART}    Set Variable    ${PRODUCT_PRICE_ADD_CART_IN_CART.replace("$", "")}
    Set Suite Variable    ${PRODUCT_NAME_ADD_CART_IN_CART}
    Set Suite Variable    ${PRODUCT_DESCRIPTION_ADD_CART_IN_CART}
    Set Suite Variable    ${CLEANED_PRODUCT_PRICE_ADD_CART_IN_CART}

Validate Product In Cart Displayed Correct
    ${PRODUCT_NAME_ADD_CART_IN_HOMEPAGE}    Get Text    xpath://*[@id="item_4_title_link"]/div
    ${PRODUCT_DESCRIPTION_ADD_CART_IN_HOMEPAGE}    Get Text    xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${PRODUCT_PRICE_ADD_CART_IN_HOMEPAGE}    Get Text    xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${CLEANED_PRODUCT_PRICE_ADD_CART_IN_HOMEPAGE}    Set Variable    ${PRODUCT_PRICE_ADD_CART_IN_HOMEPAGE.replace("$", "")}
    Navigate To Cart Screen
    Information Product In Cart
    Should Be Equal    ${PRODUCT_NAME_ADD_CART_IN_HOMEPAGE}    ${PRODUCT_NAME_ADD_CART_IN_CART}
    Should Be Equal    ${PRODUCT_DESCRIPTION_ADD_CART_IN_HOMEPAGE}    ${PRODUCT_DESCRIPTION_ADD_CART_IN_CART}
    Should Be Equal    ${CLEANED_PRODUCT_PRICE_ADD_CART_IN_HOMEPAGE}    ${CLEANED_PRODUCT_PRICE_ADD_CART_IN_CART}

Click Button Checkout And Navigate To Checkout Page
    Wait Until Element Is Visible    xpath://*[@id="checkout"]
    Click Button    xpath://*[@id="checkout"]
    Page Should Contain    Checkout: Your Information

Fill In The Required Information And Click 'Continue' Button
    ${INPUT_FIRST_NAME}    Set Variable    xpath://*[@id="first-name"]
    ${INPUT_LAST_NAME}    Set Variable    xpath://*[@id="last-name"]
    ${INPUT_ZIP_CODE}    Set Variable    xpath://*[@id="postal-code"]
    ${BUTTON_CONTINUE}    Set Variable    xpath://*[@id="continue"]
    Wait Until Element Is Visible    ${INPUT_FIRST_NAME}
    Input Text    ${INPUT_FIRST_NAME}    Vi
    Wait Until Element Is Visible    ${INPUT_LAST_NAME}
    Input Text    ${INPUT_LAST_NAME}    Nguyen
    Wait Until Element Is Visible    ${INPUT_ZIP_CODE}
    Input Text    ${INPUT_ZIP_CODE}    70000
    Wait Until Element Is Visible    ${BUTTON_CONTINUE}
    Click Element    ${BUTTON_CONTINUE}

Validate Product In Checkout Page Displayed Correct
    ${PRODUCT_NAME_AT_CHECKOUT_PAGE}    Get Text    xpath://*[@id="item_4_title_link"]/div
    ${PRODUCT_DESCRIPTION_AT_CHECKOUT_PAGE}    Get Text    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[1]
    ${PRODUCT_PRICE_AT_CHECKOUT_PAGE}    Get Text    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[2]/div
    ${CLEANED_PRODUCT_PRICE_AT_CHECKOUT_PAGE}    Set Variable    ${PRODUCT_PRICE_AT_CHECKOUT_PAGE.replace("$", "")}
    Should Be Equal    ${PRODUCT_NAME_AT_CHECKOUT_PAGE}    ${PRODUCT_NAME_ADD_CART_IN_CART}
    Should Be Equal    ${PRODUCT_DESCRIPTION_AT_CHECKOUT_PAGE}    ${PRODUCT_DESCRIPTION_ADD_CART_IN_CART}
    Should Be Equal    ${CLEANED_PRODUCT_PRICE_AT_CHECKOUT_PAGE}    ${CLEANED_PRODUCT_PRICE_ADD_CART_IN_CART}

Click Finish Button And Validate 'Checkout: Complete!' Displayed
    Wait Until Element Is Visible    xpath://*[@id="finish"]
    Click Button    xpath://*[@id="finish"]
    Page Should Contain    Thank you for your order!

*** Test Cases ***
Check The Purchase Of 1 Product Successfully
    Open Web Saucedemo
    Login Saucedemo
    Add 1 Product To Cart
    Validate Product In Cart Displayed Correct
    Click Button Checkout And Navigate To Checkout Page
    Fill In The Required Information And Click 'Continue' Button
    Validate Product In Checkout Page Displayed Correct
    Click Finish Button And Validate 'Checkout: Complete!' Displayed
