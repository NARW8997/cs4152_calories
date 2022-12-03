require 'rails_helper'

describe WelcomeController, type: 'controller' do
    context '#create' do
        it "create successfully" do 
            user =  FactoryGirl.create(:user, uid:30, weight: 180, height: 180, age: 15, sex:'male', username: 'suibian')
            session[:user_uid] = user.uid
            post :create, user: { weight: user.height, height: user.height, age: user.age, sex: user.sex }
            expect(response).to render_template("index")
        end
    end

end