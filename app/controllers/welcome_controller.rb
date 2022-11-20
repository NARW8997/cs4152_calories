class WelcomeController < ApplicationController
  def index
    @user = User.find(session[:user_uid])
  end


  def new_index
    @user = User.find(session[:user_uid])
  end

  def create
    @user = User.find_by(uid: session[:user_uid])
    @user.weight = params[:user][:weight]
    @user.height = params[:user][:height]
    @user.age = params[:user][:age]
    @user.sex = params[:user][:sex]
    @user.goal_weight = params[:user][:goal_weight]
    @user.days = params[:user][:days]
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
