class User < ActiveRecord::Base
  self.primary_key = "uid"
  validates :username, presence: { message: "username cannot be blank"}
  validates :username, uniqueness: { message: "username already existed"}
  validates :password, presence: { message: "password cannot be blank"}
  validates :password, length: { minimum: 6, message: "password should be more than 6 chars"}
  validates :first_name, presence: { message: "first_name cannot be blank"}
  validates :last_name, presence: { message: "last_name cannot be blank"}
  validates :email, presence: { message: "email cannot be blank"}
  # validates :weight, presence: { message: "weight cannot be blank"}
  # validates :height, presence: { message: "height cannot be blank"}
  # validates :age, presence: { message: "age cannot be blank"}
  # validates :sex, presence: { message: "sex cannot be blank"}

end
