require 'rails_helper'

describe WelcomeController, type: 'controller' do
    context '#create' do
        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(user.weight).to be == 180
        end

        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(user.height).to be == 180
        end

        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(user.age).to be == 15
        end

        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(user.sex).to be == 'male'
        end

        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(user.goal_weight).to be == 150
        end

        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(user.days).to be == 30
        end

        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(flash[:notice]).to be == "Now let's start your goal!"
        end

        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(response).to render_template("index")
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(flash[:notice]).to be == "Please make sure your weight, height, age and days are digit!"
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(flash[:notice]).to be == "Please make sure your weight, height, age and days are digit!"
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(response).to render_template("new_index")
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(response).to render_template("new_index")
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(response).to render_template("new_index")
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            expect(flash[:notice]).to be == "Please make sure your weight, height, age and days are digit!"
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight }
            expect(flash[:notice]).to be == "Please make sure your weight, height, age and days are digit!"
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight }
            expect(response).to render_template("new_index")
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, sex: user.sex, goal_weight: user.goal_weight, days: user.days }
            if user.user_type == "Open this select menu"
                expect(flash[:notice]).to be == "Please choose an option in the bottom drop down window!"
            end
        end

        it "create unsuccessfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.weight, height: user.height, age: user.age, goal_weight: user.goal_weight, days: user.days }
            if user.user_type == "Open this select menu"
                expect(response).to render_template("new_index")
            end
        end
    end

end