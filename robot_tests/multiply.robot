*** Settings ***
Library  BuiltIn

*** Variables ***
${NUMBER_1}    10
${NUMBER_2}    20

*** Test Cases ***
Multiplication Test
    [Documentation]  This test multiplies ${NUMBER_1} by ${NUMBER_2}.
    [Tags]    Multiplication    Arithmetic
    ${result}=  Evaluate  ${NUMBER_1} * ${NUMBER_2}
    Should Be Equal As Numbers  ${result}  400
