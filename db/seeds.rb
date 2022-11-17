# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(id: "1", name: "Shake Shack Morningside Heights", cal_type: "high", location: "2957 Broadway, New York, NY 10025")
Restaurant.create(id: "2", name: "Elysian Fields", cal_type: "high", location: "1207 Amsterdam Ave, New York, NY 10027")
Restaurant.create(id: "3", name: "Subs Conscious", cal_type: "high", location: "1213 Amsterdam Ave, New York, NY 10027")
Restaurant.create(id: "4", name: "Community Food & Juice", cal_type: "medium", location: "2893 Broadway, New York, NY 10025")
Restaurant.create(id: "5", name: "Sliced by Harlem Pizza Co", cal_type: "medium", location: "1215 Amsterdam Ave, New York, NY 10027")
Restaurant.create(id: "6", name: "Strokos Gourmet Deli", cal_type: "medium", location: "1090 Amsterdam Ave, New York, NY 10025")
Restaurant.create(id: "7", name: "Pret a Manger", cal_type: "low", location: "116th and Broadway 2955, Broadway, New York, NY 10025")
Restaurant.create(id: "8", name: "sweetgreen", cal_type: "low", location: "2937 Broadway, New York, NY 10025")
Restaurant.create(id: "9", name: "DIG", cal_type: "low", location: "2884 Broadway, New York, NY 10025")
User.create(username: 'ryan', password: '222222', first_name: 'ryan', last_name: 'wang',
            email: 'ryanw@gmail.com', weight: '80', height: '180', age: '23', sex: 'male',
            goal_weight: '70', days: '100', user_type: '2', daily_calorie: '200')

