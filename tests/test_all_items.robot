*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Teardown    Close Browser

*** Test Cases ***
User can return to product list using All Items
    Open Application Browser
    Login As Standard User
    Click All Items

