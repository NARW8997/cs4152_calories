require 'rails_helper'

describe WelcomeController, type: 'controller' do
    context '#create' do
        it "create a welcome page" do 
            # user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            # email: "test@columbia.edu")
            user1 =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user1.uid
            post :create, user: { weight: user1.height, height: user1.height, age: user1.age, sex: user1.sex }
            expect(User.where(uid: "1")).to exist
            expect(response).to render_template("index")
        end
    end

end