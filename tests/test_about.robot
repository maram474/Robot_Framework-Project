*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Teardown    Close Browser

*** Test Cases ***
User can open About page
    Open Application Browser
    Login As Standard User
    Open Burger Menu
    Open About Page
