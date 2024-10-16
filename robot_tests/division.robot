*** Settings ***
Library  BuiltIn

*** Variables ***
${NUMBER_1}    10
${NUMBER_2}    20

*** Test Cases ***
Division Test
    [Documentation]  This test divides ${NUMBER_2} by ${NUMBER_1}.
    [Tags]    Division    Arithmetic
    ${result}=  Evaluate  ${NUMBER_2} / ${NUMBER_1}
    Should Be Equal As Numbers  ${result}  2
