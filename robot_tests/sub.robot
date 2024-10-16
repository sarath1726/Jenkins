*** Settings ***
Library  BuiltIn

*** Variables ***
${NUMBER_1}    10
${NUMBER_2}    20

*** Test Cases ***
Subtraction Test
    [Documentation]  This test subtracts ${NUMBER_2} from ${NUMBER_1}.
    [Tags]    Subtraction    Arithmetic
    ${result}=  Evaluate  ${NUMBER_1} - ${NUMBER_2}
    Should Be Equal As Numbers  ${result}  -10
