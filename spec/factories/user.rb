FactoryGirl.define do
    factory :user do
        password  '222222'
        email     'ryan@yahoo.com'
        # username  ''
        first_name  'haha'
        last_name  'haha'
        weight 180
        height 180
        age 18
        sex 'test'
        goal_weight 150
        days 30
    end
end