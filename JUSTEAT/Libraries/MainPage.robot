*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     String
Resource    ../ObjectRep/MainPage.robot




*** Variables ***
${appURL}             https://www.just-eat.co.uk/
${searchcountAttr}    data-search-count-orig


*** Keywords ***

Launch Application with ${Browser}
    [Documentation]     Type in the browser name you want to use. Example: For chrome, Type "Google Chrome". For Internet Explorer, Type "Internet Explorer"
    Run Keyword If      "${Browser}"=="Google Chrome"       Open Browser        ${appURL}       gc
    Run Keyword If      "${Browser}"=="Internet Explorer"       Open Browser        ${appURL}       IE
    Wait Until Element is Visible   ${postalcodeTextBox}        50s
    Maximize Browser Window
    Capture Page Screenshot     filename=${TEST_NAME}_{index}.png

I want food in "${postalCode}"
    [Documentation]
    Input Text      ${postalcodeTextBox}        ${postalCode}
    Capture Element Screenshot      ${postalcodeTextBox}    filename=${TEST_NAME}_{index}.png

I search for restaurants
    [Documentation]
    Click Button        ${searchButton}
    Capture Element Screenshot      ${searchButton}         filename=${TEST_NAME}_{index}.png

I should see some restaurants in ${postalCode}
    [Documentation]
    Wait Until Element is Visible               ${leftpanePostCode}         50s
    ${openCount}        Get number of restaurants               ${openCountText}
    #${preorderCount}    Get number of restaurants               ${preorderCountText}
    #${noorderCount}     Get number of restaurants               ${noorderCountText}
    #${totalOrderCount}  Get Element Count                ${totalCountResults}
    #${actualOrderCount}     Evaluate         ${openCount}+${preorderCount}+${noorderCount}
    #Should be Equal     ${totalOrderCount}      ${actualOrderCount}
    ${blnStatus}        Run Keyword and Return Status       Should be true      ${openCount}
    Run Keyword If      ${blnStatus}        Log         There are ${openCount} open restaurants in postal code "${postalCode}"
    ...     ELSE        There are no restaurants in postal code "${postalCode}"



Get number of restaurants
    [Documentation]
    [Arguments]     ${orderType}
    ${orderCount}        Get Text                ${orderType}
    ${orderCount}        Strip String            ${orderCount}      characters=${SPACE}openrstua
    ${orderCount}        Strip String            ${orderCount}
    #${orderCount}        Convert to Number       ${orderCount}
    Capture Element Screenshot      ${orderType}    filename=${TEST_NAME}_{index}.png
    [Return]        ${orderCount}


Capture Page Screenshot and Close Browser
    Capture Page Screenshot     filename=${TEST_NAME}_{index}.png
    Close Browser











