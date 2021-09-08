*** Settings ***
Documentation                Testar Selenium och RobotFramework
#Resource                     ../Resources/keywords_general.robot
#Resource                     ../Resources/keywords.robot
Resource                      ../Resources/keywords_deploymodelAPI.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Test Cases ***
Test to get deployed model API
  [Documentation]    Deploying the model API
  [Tags]             deployed API

  Given that the user on the home page
  When user clicks on the Overview
  And user clicks on the deploy and on deploy model to API
  Then user should able to see the added current deployed API and can delete the same API