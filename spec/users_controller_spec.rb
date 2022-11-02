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
                email: "test@columbia.edu"}
            end

            it 'redirects to the homepage' do
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}
                expect(response).to redirect_to welcome_new_index_path
            end
        end

        describe 'user is created unsuccessfully' do
            it "should render new if username is nil" do
                user = User.new(username: "", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}
                expect(response).to render_template("new")
            end

            it "should render new if password is nil" do
                user = User.new(username: "test", password: "", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}
                expect(response).to render_template("new")
            end

            it "should render new if first_name is nil" do
                user = User.new(username: "test", password: "123456", first_name: "", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "123456", first_name: "", last_name: "test",
                email: "test@columbia.edu"}
                expect(response).to render_template("new")
            end

            it "should render new if last_name is nil" do
                user = User.new(username: "test", password: "123456", first_name: "test", last_name: "",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "",
                email: "test@columbia.edu"}
                expect(response).to render_template("new")
            end

            it "should render new if email is nil" do
                user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "")
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: ""}
                expect(response).to render_template("new")
            end

            it "should render new if password is too short" do
                user = User.new(username: "test", password: "1234", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "1234", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}
                expect(response).to render_template("new")
            end

            it "should render new if username is already exist" do
                user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}
                post :create, :user => {username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu"}
                expect(response).to render_template("new")
            end
        end
    end
end