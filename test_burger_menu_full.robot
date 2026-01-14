*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource   ../resources/variables.robot

*** Test Cases ***
Full Burger Menu Scenario
    [Documentation]    Test complet du menu burger sur SauceDemo.
    Open Application Browser
    Login As Standard User

    # Ouvrir le menu burger et vérifier les options
    Open Burger Menu
    Verify Burger Menu Options

    # Cliquer sur All Items et vérifier qu'on reste sur la page des produits
    Click All Items

    # Cliquer sur About et vérifier l'ouverture de saucelabs.com dans un nouvel onglet
    Open Burger Menu
    Open About Page
    Switch To New Tab
    Location Should Contain    saucelabs.com
    Close Browser Tab
    Switch To Main Tab

    # Réinitialiser l'état de l'application
    Reset Application State

    # Déconnexion
    Logout User

*** Keywords ***
Switch To New Tab
    [Documentation]    Passe au nouvel onglet ouvert.
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[-1]

Switch To Main Tab
    [Documentation]    Reviens à l'onglet principal.
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[0]

Close Browser Tab
    [Documentation]    Ferme l'onglet actuel.
    Close Window
