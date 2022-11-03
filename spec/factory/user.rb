FactoryGirl.define do
    factory :user do
        password { Faker::Internet.password }
        email    { Faker::Internet.email }
        username { Faker::Internet.username }
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        weight '180'
        height '180'
        age '18'
        sex 'test'
    end
end