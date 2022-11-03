require 'rails_helper'

describe WelcomeController, type: 'controller' do
    context '#create' do
        it "create a welcome page" do 
            user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu")
            post :create, welcome: { uid: "1" }
            expect(User.where(uid: "1")).to exist
            expect(response).to render_template("index")
        end
    end

end