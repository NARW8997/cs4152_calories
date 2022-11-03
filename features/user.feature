Feature: display users information

  As a Calorie Manager user
  So that I can login to my account and input my information
  to the system.

  Background: users have been added to database
     Given the following users exist:
      |uid| username               | password | first_name| last_name |email                  |weight|height|age|sex |
      |1| InfinityAlpha          | 00000000 |  Xiao     |Li         |sjfoiwqjefopa@email.com|75    |180.0   |20 |male|
      |2| InfinityAlpha1          | 00000001 |  Nan    |Liu         |feqwgwedfgasf@email.com|76    |182  |21 |male|
      |3| InfinityAlpha2          | 00000002 |  Fang     |Lin         |lflflflflflf@email.com|65   |170   |23 |female|
      |4| InfinityAlpha3          | 00000003 |  Hua     |Xiao         |hxhxhxhxhxhxh@email.com|85    |185   |22 |male|
      |5| InfinityAlpha4          | 00000004 |  Ma     |Wei         |mwmwmwmwmwmw@email.com|65    |166   |25 |female|
      |6| InfinityAlpha5          | 00000005 |  Shu     |Hu         |shshshshshsh@email.com|90    |190   |19 |male|
      |7| InfinityAlpha6          | 00000006 |  Tao     |Zou        |ztztztztztzt@email.com|73    |172   |24 |male|
      |8| InfinityAlpha7          | 00000007 |  Bin     |Wu         |wbwbwbwbwbwb@email.com|55    |160   |21 |female|
      |9| InfinityAlpha8          | 00000008 |  Mao     |Zhang         |zmzmzmzmzm@email.com|70    |180   |20 |male|
      |10| InfinityAlpha9          | 00000009 |  Chuan     |Qin         |qcqcqcqcqc@email.com|83    |183   |22 |male|

    Then 10 seed users should exist

  Scenario: New user login
    Given I am on home page
    When I fill in "username" with "Zac" and "password" with "1234567"
    And I press "sign in"
    Then I should be on "home page"
    Then "Zac" with password "1234567" should not login
    When I follow "sign up"
    Then I should be on "register page"
    When I fill in "first_name" with "Hua"
    And I fill in "last_name" with "Zhang"
    And I fill in "username" with "Zac"
    And I fill in "email" with "1253535@gmail.com"
    And I fill in "password" with "1234567"
    And I fill in "confirmPW" with "1234567"
    And I press "register"
    Then I should be on "User Input page"

  #Scenario:  New user input
    #Given I am on User Input page
    When I fill in "user[sex]" with "male"
    And I fill in "user[age]" with "22"
    And I fill in "user[height]" with "170"
    And I fill in "user[weight]" with "70"
    And I press "Add"
    Then I should be on "main page"
    Then I should see all the information of "Zac"

  Scenario: Existing user login
    Given I am on home page
    And I fill in "username" with "InfinityAlpha" and "password" with "00000000"
    When I press "sign in"
    Then I should be on "existing user main page"
    Then I should see all the information of "InfinityAlpha"


  Scenario: Update a user
    Given I am on the main page of "InfinityAlpha"
    And I press "Edit"
    Then I should be on "edit page"
    And I fill in "lastname" with "Wang"
    And I fill in "firstname" with "Hua"
    And I fill in "sex" with "male"
    And I fill in "Age" with "22"
    And I fill in "height" with "170"
    And I fill in "weight" with "70"
    And I fill in "email" with "1253535@gmail.com"
    And I press "Update"
    Then I should be on the main page
    Then I should see "lastname" with "Wang"

  Scenario: Delete a user
    Given I am on the main page of "Zac"
    When I press "Delete"
    Then I should be on the CalorieManager home page