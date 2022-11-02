require 'rails_helper'

describe SessionsController, type: 'controller' do
    context '#new' do
        it 'render new template' do
            get :new
            expect(response).to render_template("new")
        end   
    end

    context '#create' do
        it "create a session" do 
            user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu")
            post :create, session: { email: user.email, password: user.password }
            expect(response).to redirect_to welcome_index_path
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