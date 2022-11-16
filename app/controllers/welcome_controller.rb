class WelcomeController < ApplicationController
  def index
    @user = User.find(session[:user_uid])
    # @user.weight = params[:weight] if (@user.weight.nil? or @user.weight.blank?)
    # @user.height = params[:height] if (@user.height.nil? or @user.height.blank?)
    # @user.age = params[:age] if (@user.age.nil? or @user.age.blank?)
    # @user.sex = params[:sex] if (@user.sex.nil? or @user.sex.blank?)
    # @user.calculate(session[:user_uid])
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
