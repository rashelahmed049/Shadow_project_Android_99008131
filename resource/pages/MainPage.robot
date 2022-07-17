*** Settings ***
Documentation   This script will handle various operaions regarding a particular page of android
Resource    ../base/CommonFunctionality.robot


*** Variables ***
${LOCATOR_ID}       com.google.android.youtube:id/youtube_logo
${options}      library
${HOME_LOCATOR}       //android.widget.Button[@index=0]
${SHORTS_LOCATOR}       //android.widget.Button[@index=1]
${CREATE_LOCATOR}       //android.widget.Button[@index=2]
${SUBSCRIPTION_LOCATOR}       //android.widget.Button[@index=3]
${LIBRARYLOCATOR}       //android.widget.Button[@index=4]
${SEARCH_LOCATOR}       //android.widget.ImageView[@content-desc='Search']
${SEARCH_INPUT_LOCATOR}     com.google.android.youtube:id/search_edit_text
${SEARCH_INDEX_LOCATOR}     //android.widget.TextView[@index=1]
${CLICK_VIDEO_LOCATOR}      //android.view.View[@index=0]
${SEARCHED_RESULT_LOCATOR}    android.view.View
${SKIP_ADS_BUTTON}     com.google.android.youtube:id/skip_ad_button_container
${SEEK_BAR}         //android.widget.SeekBar[@index=0]

*** Keywords ***
Verifiy Page Open
    Wait Until Page Contains    ${LOCATOR_ID}
    ${alert}    Run Keyword And Return Status    Page Should Contain Element    ${LOCATOR_ID}
    Log To Console    ${alert}

    Run Keyword If      '${alert}' == 'True'  Test1    ELSE     Test2
Test1
    Log To Console    Successfull
Test2
    Log To Console    Unsuccessfull
Operate Options
       Wait Until Page Contains    ${LOCATOR_ID}
       Click Element    ${LIBRARYLOCATOR}
       Start Screen Recording   timeLimit=10
       Sleep    3
       Stop Screen Recording    filename=home_to_library

       Go Back
       
       Click Element    ${SHORTS_LOCATOR}
       Sleep    3
       Go Back
       
       Click Element    ${CREATE_LOCATOR}
       Sleep    3
       Go Back
       
       Click Element    ${SUBSCRIPTION_LOCATOR}
       Sleep    3
       
       #Click Element    ${HOME_LOCATOR}
       #Sleep    3
Search
    [Arguments]     ${text}
    Wait Until Page Contains    ${LOCATOR_ID}
    Click Element    ${SEARCH_LOCATOR}
    Wait Until Page Contains    ${SEARCH_INPUT_LOCATOR}
    Input Text    ${SEARCH_INPUT_LOCATOR}    ${text}
    Click Element  //android.widget.TextView[@text='${text}']
    Send        {ENTER}
Open Video
    Wait Until Page Contains    ${SEARCHED_RESULT_LOCATOR}
    Sleep    3
    Start Screen Recording
    Click Element    ${CLICK_VIDEO_LOCATOR}
    Sleep    20
    #${skip_status}     Run Keyword And Return Status       Page Should Contain Element    ${SKIP_ADS_BUTTON}
   # Run Keyword If    ${skip_status} == True    skip_play
    Stop Screen Recording   filename=videoplay

#skip_play
      #Sleep    3
       #Click Element    ${SKIP_ADS_BUTTON}
       #Start Screen Recording

   # Stop Screen Recording    filename=youtubeplay

        
        
        




