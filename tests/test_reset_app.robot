*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Teardown    Close Browser

*** Test Cases ***
User can reset application state
    Open Application Browser
    Login As Standard User
    Reset Application State
