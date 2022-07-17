*** Settings ***
Library     appium
Library     app_launch_time.py
Library     test.py
*** Test Cases ***
ADDITION_OF_TWO_NUMBERS
    ${result} =  Sum    3    5
    Log To Console    ${result}
App_launch_time
  ${app_launch_time}=   Vid To Frame
  Log To Console    ${app_launch_time}



