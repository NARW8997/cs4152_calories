require 'rails_helper'

describe UsersController, type: 'controller' do

    context '#new' do
        it 'render new template' do
            get :new
            expect(response).to render_template("new")
        end   
    end

    context '#create' do
        describe 'user is created successfully' do
            it 'executes the creation query' do
                user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                expect(User).to receive(:new).with({username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}).and_return user
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
            end

            it 'redirects to the homepage' do
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
                expect(response).to redirect_to welcome_new_index_path
            end
        end

        describe 'user is created unsuccessfully' do
            it "should render new if username is confirmed password is different from password" do
                user = User.new(username: "", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "234567"}
                expect(response).to render_template("new")
            end

            it "should render new if username is nil" do
                user = User.new(username: "", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
                expect(response).to render_template("new")
            end

            it "should render new if password is nil" do
                user = User.new(username: "test", password: "", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => ""}
                expect(response).to render_template("new")
            end

            it "should render new if first_name is nil" do
                user = User.new(username: "test", password: "123456", first_name: "", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "123456", first_name: "", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
                expect(response).to render_template("new")
            end

            it "should render new if last_name is nil" do
                user = User.new(username: "test", password: "123456", first_name: "test", last_name: "",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
                expect(response).to render_template("new")
            end

            it "should render new if email is nil" do
                user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "")
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: ""}, :confirmPW => {"confirmPW" => "123456"}
                expect(response).to render_template("new")
            end

            it "should render new if password is too short" do
                user = User.new(username: "test", password: "1234", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "1234", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "1234"}
                expect(response).to render_template("new")
            end

            it "should render new if username is already exist" do
                user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
                expect(response).to render_template("new")
            end
        end
    end

    context '#update' do
        it "edit the existing user" do
            user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu")
            post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
            put :update, :id => "1", :user => {first_name: "new"}
            expect(response).to redirect_to welcome_index_path
        end
    end

    context '#destroy' do
        it "delete a user successfully" do 
            user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu")
            post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
            delete :destroy, :id => "1"
            expect(response).to redirect_to root_path
        end

        it "delete a user unsuccessfully" do 
            user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu")
            post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
            email: "test@columbia.edu"}, :confirmPW => {"confirmPW" => "123456"}
            delete :destroy, :id => "1"
            expect(response).to redirect_to root_path
        end
    end
end