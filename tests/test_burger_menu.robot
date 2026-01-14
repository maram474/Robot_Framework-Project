*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Teardown    Close Browser

*** Test Cases ***
User can see burger menu options
    Open Application Browser
    Login As Standard User
    Open Burger Menu
    Verify Burger Menu Options
