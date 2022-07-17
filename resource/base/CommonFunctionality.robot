*** Settings ***
Documentation   This file handles various operations for application of Android devices
Library     AppiumLibrary
Library     AutoItLibrary
Library     BuiltIn
Library     ScreenCapLibrary

*** Keywords ***
Launch_youtube
    Open Application
...     http://localhost:4723/wd/hub
...     platformName=Android
...     deviceName=3200163d4b6cc50f
...     appPackage=com.google.android.youtube
...     appActivity=com.google.android.youtube.HomeActivity




