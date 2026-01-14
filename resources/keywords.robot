*** Settings ***
Library    SeleniumLibrary
Resource   ./variables.robot

*** Keywords ***

# ============================
# Navigation & Browser
# ============================
Open Application Browser
    [Documentation]    Ouvre Chrome sans Password Manager ni popups Google.

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --incognito

    Open Browser    ${URL}    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
    Set Selenium Speed    0.3s
# ============================
# Authentification
# ============================
Login As Standard User
    [Documentation]    Connecte l'utilisateur avec le compte standard et attend que la page des produits soit chargée.
    Wait Until Element Is Visible    ${LOGIN_USER}    10s
    Input Text    ${LOGIN_USER}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains    ${PRODUCTS_PAGE_TEXT}    10s

Logout User
    [Documentation]    Déconnecte l'utilisateur via le menu burger et attend le retour sur la page de login.
    Open Burger Menu
    Wait Until Element Is Visible    ${MENU_LOGOUT}    5s
    Click Element    ${MENU_LOGOUT}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    10s

# ============================
# Burger Menu Actions
# ============================
Open Burger Menu
    [Documentation]    Ouvre le menu burger et attend que toutes les options soient visibles.
    Wait Until Element Is Visible    ${BURGER_MENU_BTN}    5s
    Click Button    ${BURGER_MENU_BTN}
    Wait Until Element Is Visible    ${MENU_ALL_ITEMS}    15s

Close Burger Menu
    [Documentation]    Ferme le menu burger en cliquant sur le bouton X et attend que le menu disparaisse.
    Wait Until Element Is Visible    ${BURGER_MENU_CLOSE_BTN}    5s
    Click Element    ${BURGER_MENU_CLOSE_BTN}
    Wait Until Element Is Not Visible    ${BURGER_MENU_CLOSE_BTN}    5s

Verify Burger Menu Options
    [Documentation]    Vérifie la présence de toutes les options du menu burger.
    Element Should Be Visible    ${MENU_ALL_ITEMS}
    Element Should Be Visible    ${MENU_ABOUT}
    Element Should Be Visible    ${MENU_LOGOUT}
    Element Should Be Visible    ${MENU_RESET_APP_STATE}
    Close Burger Menu

Click All Items
    [Documentation]    Sélectionne "All Items" dans le menu burger et vérifie l'affichage de la page des produits.
    Open Burger Menu
    Click Element    ${MENU_ALL_ITEMS}
    Wait Until Location Contains    inventory.html    10s
    Page Should Contain    ${PRODUCTS_PAGE_TEXT}

Open About Page
    [Documentation]    Sélectionne "About" dans le menu burger et attend l'ouverture du site externe.
    Click Element    ${MENU_ABOUT}
    Wait Until Location Contains    saucelabs.com    10s

Reset Application State
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
