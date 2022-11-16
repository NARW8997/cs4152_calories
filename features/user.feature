Feature: display users information

  As a Calorie Manager user
  So that I can login to my account and input my information
  to the system.

  Background: users have been added to database
     Given the following users exist:
      |uid| username               | password | first_name| last_name |email                  |weight|height|age|sex |goal_weight|days|user_type|
      |1| InfinityAlpha          | 00000000 |  Xiao     |Li         |sjfoiwqjefopa@email.com|75    |180.0   |20 |male|75| 30|Maintain weight|
      |2| InfinityAlpha1          | 00000001 |  Nan    |Liu         |feqwgwedfgasf@email.com|76    |182  |21 |male| 76 |30|Maintain weight|
      |3| InfinityAlpha2          | 00000002 |  Fang     |Lin         |lflflflflflf@email.com|65   |170   |23 |female|70|60|Decrease weight|
      |4| InfinityAlpha3          | 00000003 |  Hua     |Xiao         |hxhxhxhxhxhxh@email.com|85    |185   |22 |male|80|60|Decrease weight|
      |5| InfinityAlpha4          | 00000004 |  Ma     |Wei         |mwmwmwmwmwmw@email.com|65    |166   |25 |female|60|60|Decrease weight|
      |6| InfinityAlpha5          | 00000005 |  Shu     |Hu         |shshshshshsh@email.com|90    |190   |19 |male|80|90|Decrease weight|
      |7| InfinityAlpha6          | 00000006 |  Tao     |Zou        |ztztztztztzt@email.com|73    |172   |24 |male|75|30|Increase weight|
      |8| InfinityAlpha7          | 00000007 |  Bin     |Wu         |wbwbwbwbwbwb@email.com|49    |160   |21 |female|55|90|Increase weight|
      |9| InfinityAlpha8          | 00000008 |  Mao     |Zhang         |zmzmzmzmzm@email.com|70    |180   |20 |male|75|30|Increase weight|
      |10| InfinityAlpha9          | 00000009 |  Chuan     |Qin         |qcqcqcqcqc@email.com|83    |183   |22 |male|75|60|Decrease weight|

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
    And I fill in "user[goal_weight]" with "73"
    And I fill in "user[days]" with "30"
    And I select "user[user_type]" with "Increase weight"
    And I press "Add"
    Then I should be on "User Input page"
    Then I should see all the information of "Zac"

  Scenario: Existing user login
    Given I am on home page
    And I fill in "username" with "InfinityAlpha" and "password" with "00000000"
    When I press "sign in"
    Then I should be on "existing user main page"
    Then I should see all the information of "InfinityAlpha"

  #Sad path
  Scenario: Incorrect password or username 
    Given I am on home page
    And I fill in "username" with "InfinityAlpha10" and "password" with "00000000"
    Then I should see ""


  Scenario: Update a user
    Given I am on the main page of "InfinityAlpha"
    And I follow "Edit"
    Then I should be on "edit page"
    And I fill in "last_name" with "Wang"
    And I fill in "first_name" with "Hua"
    And I fill in "sex" with "male"
    And I fill in "age" with "22"
    And I fill in "height" with "170"
    And I fill in "weight" with "70"
    And I fill in "email" with "1253535@gmail.com"
    And I press "Update"
    Then I should be on "main page"
    Then I should see last_name with "Wang" on the main page of "InfinityAlpha"

  Scenario: Delete a user
    Given I am on the main page of "InfinityAlpha"
    When I follow "Delete"
    Then I should be on "root page"

  Scenario: View all available exercises
    Given I am on the main page of "InfinityAlpha"
    When I follow "Exercise"
    Then I should be on "exercise page"
    Then I should see information of all exercises


  Scenario: View meal plans
    Given I am on the main page of "InfinityAlpha"
    When I follow "Meal Plan"
    Then I should be on "meal plans page"