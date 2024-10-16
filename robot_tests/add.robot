*** Settings ***
Library  BuiltIn

*** Variables ***
${NUMBER_1}    10
${NUMBER_2}    20

*** Test Cases ***
Addition Test
    [Documentation]  This test adds ${NUMBER_1} and ${NUMBER_2}.
    [Tags]    Addition    Arithmetic
    ${result}=  Evaluate  ${NUMBER_1} + ${NUMBER_2}
    Should Be Equal As Numbers  ${result}  30
