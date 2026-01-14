*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Setup       Open Application Browser
Suite Teardown    Close Browser

*** Test Cases ***
User can login successfully
    Login As Standard User
