*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Teardown    Close Browser

*** Test Cases ***
User can close burger menu using X button
    Open Application Browser
    Login As Standard User
    Open Burger Menu
    Close Burger Menu

# *** Settings ***
# Library    SeleniumLibrary

# *** Variables ***
# ${URL}            https://www.saucedemo.com
# ${USERNAME}       standard_user
# ${PASSWORD}       secret_sauce
# ${BURGER_MENU}    id:react-burger-menu-btn
# ${CLOSE_BUTTON}   id:react-burger-cross-btn
# ${SIDE_MENU}      css:.bm-menu-wrap

# *** Test Cases ***
# Close Burger Menu On Sauce Demo
#     [Documentation]    Teste uniquement la fermeture du menu burger sur Sauce Demo
#     Open Browser    ${URL}    Chrome
#     Maximize Browser Window

#     # Connexion
#     Input Text    id:user-name    ${USERNAME}
#     Input Text    id:password     ${PASSWORD}
#     Click Button  id:login-button
#     Wait Until Page Contains Element    ${BURGER_MENU}    5s

#     # Ouvrir le menu burger
#     Click Element    ${BURGER_MENU}
#     Wait Until Element Is Visible    ${CLOSE_BUTTON}    5s

#     # Fermer le menu burger
#     Click Element    ${CLOSE_BUTTON}
#     Wait Until Element Does Not Contain    ${SIDE_MENU}    bm-menu-wrap--open    timeout=5s

#     Close Browser
