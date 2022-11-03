require 'rails_helper'

describe SessionsController, type: 'controller' do
    context '#new' do
        it 'render new template' do
            get :new
            expect(response).to render_template("new")
        end   
    end

    context '#create' do
        it "create a session successfully" do 
            # user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            # email: "test@columbia.edu")
            user1 =  FactoryGirl.create(:user, username: "test", password: "123456", first_name: "test", last_name: "test",
                                         email: "test@columbia.edu")
            # user_params = FactoryGirl.attributes_for(:user)
            post :create, { username: user1.username, password: user1.password }
            expect(response).to redirect_to welcome_index_path
            expect(User.where(username:'zeqing', password: '222222')).to exist
        end

        it "create a session unsuccessfully" do 
            user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu")
            post :create, session: { username: user.username, password: "234567" }
            expect(response).to render_template("new")
        end
    end

    context '#destroy' do
        it "destroy a session" do 
            user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu")
            delete :destroy, :id => "1"
            expect(response).to redirect_to root_path
        end
    end


end