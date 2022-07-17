*** Settings ***
Documentation   This file will handle various operations in youtube
#Test Setup      Launch_youtube
Resource    ../resource/base/CommonFunctionality.robot
Resource    ../resource/pages/MainPage.robot
Library     app_launch_time.py
Library     operations_navigation_time.py
Library     vidlaunch_time.py

*** Test Cases ***
App_launch_time
    Launch_youtube
    Log To Console  calculating app launch time.....
    Start Screen Recording   timeLimit=10
    Verifiy Page Open
    Stop Screen Recording       filename=youtube_launch
    ${app_launch_time}=   app_launch_time
    Log To Console   ${app_launch_time}
Operation_navigation_time
    Operate Options
    Log To Console     calculating navigation time...
    ${operation_navigation_time}=     navigate_time
    Log To Console    ${operation_navigation_time}

Video_playback_time
   Search    python
   Open Video
   #skip_play
   ${playback_verification_status}=    video_launch_time
   Log To Console   ${playback_verification_status}






