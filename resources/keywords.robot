*** Settings ***
Library    SeleniumLibrary
Resource   ./variables.robot


*** Keywords ***
# ============================
# Browser
# ============================
Open Application Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --incognito
    Open Browser    ${URL}    Chrome    options=${options}
    Maximize Browser Window
    Set Selenium Speed    0.3s


# ============================
# Authentication
# ============================
Login With Standard User
    Input Text    ${LOGIN_USER}       ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}   ${PASSWORD}
    Click Button  ${LOGIN_BUTTON}
    Wait Until Page Contains    ${PRODUCTS_PAGE_TEXT}


# ============================
# Burger Menu Generic
# ============================
Open Burger Menu
    Close Burger Menu If Open
    Wait Until Element Is Visible    ${BURGER_MENU_BTN}    timeout=5s
    Wait Until Element Is Enabled    ${BURGER_MENU_BTN}    timeout=5s
    Sleep    0.3s
    Click Element    ${BURGER_MENU_BTN}

Close Burger Menu If Open
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${BURGER_MENU_CLOSE_BTN}
    Run Keyword If    ${is_visible}    Click Element    ${BURGER_MENU_CLOSE_BTN}

Close Burger Menu
    [Documentation]    Ferme le menu burger en cliquant sur le bouton X et attend que le menu disparaisse.
    Wait Until Element Is Visible    ${BURGER_MENU_CLOSE_BTN}    5s
    Click Element    ${BURGER_MENU_CLOSE_BTN}
    Wait Until Element Is Not Visible    ${BURGER_MENU_CLOSE_BTN}    5s

Click Burger Menu Option
    [Arguments]    ${option}
    Open Burger Menu
    Click Element    ${option}


# ============================
# Validations
# ============================
Verify Burger Menu Is Open
    Element Should Be Visible    ${MENU_ALL_ITEMS}
    Element Should Be Visible    ${BURGER_MENU_CLOSE_BTN}

Verify Burger Menu Options
    Element Should Be Visible    ${MENU_ALL_ITEMS}
    Element Should Be Visible    ${MENU_ABOUT}
    Element Should Be Visible    ${MENU_LOGOUT}
    Element Should Be Visible    ${MENU_RESET_APP_STATE}


# ============================
# Actions
# ============================
Click All Items And Stay On Products Page
    Click Burger Menu Option    ${MENU_ALL_ITEMS}
    Wait Until Page Contains    ${PRODUCTS_PAGE_TEXT}

Click About And Verify Saucelabs Page
    Click Burger Menu Option    ${MENU_ABOUT}
    Wait Until Location Contains    saucelabs.com

Return To Application
    Go Back
    Wait Until Page Contains    ${PRODUCTS_PAGE_TEXT}

Add Product To Cart
    Click Button    ${ADD_TO_CART_BACKPACK}
    Element Should Be Visible    ${SHOPPING_CART_BADGE}

Reset App State
    Click Burger Menu Option    ${MENU_RESET_APP_STATE}

Verify Cart Is Empty
    [Documentation]    Réinitialise l'état de l'application et vérifie que le panier est vide et que tous les produits sont remis à "Add to cart".

    Open Burger Menu
    Click Element    ${MENU_RESET_APP_STATE}
    Close Burger Menu

    # 1️ Vérifier que le panier est vide
    Wait Until Element Is Not Visible    ${SHOPPING_CART_BADGE}    5s

    # 2️ Vérifier que tous les boutons sont "Add to cart"
    @{buttons}=    Get WebElements    css:button.btn_inventory

    FOR    ${btn}    IN    @{buttons}
        ${text}=    Get Text    ${btn}
        Should Be Equal    ${text}    Add to cart
    END
    Element Should Not Be Visible    ${SHOPPING_CART_BADGE}

Logout From Application
    Click Burger Menu Option    ${MENU_LOGOUT}

Verify Login Page Is Displayed
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
