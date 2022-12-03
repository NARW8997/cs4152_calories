class WelcomeController < ApplicationController
  def index
    @user = User.find(session[:user_uid])
  end


  def new_index
    @user = User.find(session[:user_uid])
  end

  def create
    @user = current_user
    if params[:user][:user_type] == "Open this select menu"
      flash[:notice] = "Please choose an option in the bottom drop down window!"
      render action: :new_index
      return
    elsif params[:user][:weight].to_f != 0.0 and params[:user][:height].to_f != 0.0 and params[:user][:age].to_i != 0 and params[:user][:goal_weight].to_f != 0.0 and params[:user][:days].to_i != 0
      @user.height = params[:user][:height]
      @user.age = params[:user][:age]
      @user.weight = params[:user][:weight]
      @user.goal_weight = params[:user][:goal_weight]
      @user.days = params[:user][:days]
    else
      flash[:notice] = "Please make sure your weight, height, age and days are digit!"
      render action: :new_index
      return
    end

    @user.sex = params[:user][:sex]
    @user.user_type = params[:user][:user_type]

    if @user.save
      flash[:notice] = "Now let's start your goal!"
      @user.calculate(uid: session[:user_uid])
      render action: :index
      return
    end

    flash[:notice] = "Please check your input valid!"
    render action: :new_index
  end
end
