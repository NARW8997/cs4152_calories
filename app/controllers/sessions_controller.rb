class SessionsController < ApplicationController
  def new

  end

  # login action, if login successfully, user's uid will be stored in session
  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_uid] = @user.uid
      # session[:user_first_name] = @user.first_name
      flash[:notice] = "Login successfully!"
      redirect_to welcome_index_path
    else
      flash[:notice] = "Username or Password incorrect!"
      render action: :new
    end
  end

  def destroy
    session[:user_uid] = nil
    # session[:user_first_name] = nil
    flash[:notice] = "You have been Logout!"
    redirect_to root_path
  end
end
