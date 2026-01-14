*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Teardown    Close Browser

*** Test Cases ***
User can logout successfully
    Open Application Browser
    Login As Standard User
    Logout User
