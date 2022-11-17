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

  def calculate(uid)
    @user = User.find_by(uid)
    # Increase the weight is 1, decrease is 2, maintain is 0.
    if @user.user_type.eql?("1")
      @user.daily_calorie = (((@user.goal_weight - @user.weight) * 7700) / @user.days).round()
    elsif @user.user_type.eql?("2")
      @user.daily_calorie = -(((@user.weight - @user.goal_weight) * 7700) / @user.days).round()
    else
      @user.daily_calorie = 0
    end
    @user.save
  end
end
