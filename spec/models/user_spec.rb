require 'rails_helper'

describe User, type: 'model' do
    it "is valid with valid attributes" do
        user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
        expect(user).to be_valid
    end

    it "is not valid without a username" do
        user = User.new(username: "", password: "123456", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
        expect(user).to_not be_valid
    end

    it "is not valid without a password" do
        user = User.new(username: "test", password: "", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
        expect(user).to_not be_valid
    end

    it "is not valid without a first_name" do
        user = User.new(username: "test", password: "123456", first_name: "", last_name: "test",
                email: "test@columbia.edu")
        expect(user).to_not be_valid
    end

    it "is not valid without a last_name" do
        user = User.new(username: "test", password: "123456", first_name: "test", last_name: "",
                email: "test@columbia.edu")
        expect(user).to_not be_valid
    end

    it "is not valid without a email" do
        user = User.new(username: "test", password: "123456", first_name: "test", last_name: "test",
                email: "")
        expect(user).to_not be_valid
    end

    it "is not valid with short password" do
        user = User.new(username: "test", password: "1234", first_name: "test", last_name: "test",
                email: "test@columbia.edu")
        expect(user).to_not be_valid
    end

end
