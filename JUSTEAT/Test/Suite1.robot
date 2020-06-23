*** Settings ***
Library         SeleniumLibrary
Library         BuiltIn
Resource        ../Libraries/MainPage.robot


*** Test Cases ***

Test Case 001 Google Chrome
    [Setup]     Launch Application with Google Chrome
    [Tags]      TC001       Sanity      GC
    Given I want food in "AR51 1AA"
    When I search for restaurants
    Then I should see some restaurants in "AR51 1AA"
    [Teardown]      Capture Page Screenshot and Close Browser

Test Case 002 Internet Explorer
    [Setup]     Launch Application with Internet Explorer
    [Tags]      TC001       Sanity      IE
    Given I want food in "AR51 1AA"
    When I search for restaurants
    Then I should see some restaurants in "AR51 1AA"
    [Teardown]      Capture Page Screenshot and Close Browser

