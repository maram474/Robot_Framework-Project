*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/keywords.robot
Suite Setup       Open Application Browser
Suite Teardown    Close Browser
Test Teardown     Run Keyword If Test Failed    Capture Page Screenshot

*** Test Cases ***
User Can Login Successfully
    [Documentation]    Vérifie que l'utilisateur peut se connecter avec standard_user
    Login With Standard User
