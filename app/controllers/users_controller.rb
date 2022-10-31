class UsersController < ApplicationController

  def new
    @user = User.new
  end

  # register new user
  def create
    @user = User.new(params.require(:user).permit(:username, :password, :first_name, :last_name,
                                                  :email, :weight, :height, :age, :sex))
    if @user.save
      flash[:notice] = "Registered successfully!"
      redirect_to welcome_new_index_path
    else
      flash[:notice] = "Register failed!"
      render action: :new
    end
  end
end
