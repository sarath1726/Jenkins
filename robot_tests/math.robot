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

Subtraction Test
    [Documentation]  This test subtracts ${NUMBER_2} from ${NUMBER_1}.
    [Tags]    Subtraction    Arithmetic
    ${result}=  Evaluate  ${NUMBER_1} - ${NUMBER_2}
    Should Be Equal As Numbers  ${result}  -10

Multiplication Test
    [Documentation]  This test multiplies ${NUMBER_1} by ${NUMBER_2}.
    [Tags]    Multiplication    Arithmetic
    ${result}=  Evaluate  ${NUMBER_1} * ${NUMBER_2}
    Should Be Equal As Numbers  ${result}  200

Division Test
    [Documentation]  This test divides ${NUMBER_2} by ${NUMBER_1}.
    [Tags]    Division    Arithmetic
    ${result}=  Evaluate  ${NUMBER_2} / ${NUMBER_1}
    Should Be Equal As Numbers  ${result}  2
