Feature: display restaurants information

  As a Calorie Manager user
  So that I can see all restaurants near Columbia University based on my preference.

  Background: users and restaurants have been added to database
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

    Given the following restaurants exist:
      |id| name          | cal_type | location|
      |1| DIG            |low |2884 Broadway|
      |2| Atlas Kitchen  |medium |258 W 109th St |
      |3| East Village Pizza |high|145 1st Ave |
      |4| Junzi Kitchen  |low|2896 Broadway |
      |5| Sapps |low|2888 Broadway|
      |6| JJ's Place | high|511 W 114th St|
      |7| Le Monde | medium|2885 Broadway|
      |8| The Tang|medium|920 Amsterdam Ave|
      |9| Just Salad|low|56W 125th Street|
      |10| Sweetgreen|low|2937 Broadway|

    Then 10 seed restaurants should exist
