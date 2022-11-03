class SessionsController < ApplicationController
  def new
    # if session[:user_uid]
    session[:user_uid] = nil
    # end
  end

  # login action, if login successfully, user's uid will be stored in session
  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_uid] = @user.uid
      # @user.weight = params[:weight] unless (params[:weight].nil? or params[:weight].blank?)
      # @user.height = params[:height] unless (params[:height].nil? or params[:height].blank?)
      # @user.age = params[:age] unless (params[:age].nil? or params[:age].blank?)
      # @user.sex = params[:sex] unless (params[:height].nil? or params[:height].blank?)
      @user.weight = params[:weight] if (@user.weight.nil? or @user.weight.blank?)
      @user.height = params[:height] if (@user.height.nil? or @user.height.blank?)
      @user.age = params[:age] if (@user.age.nil? or @user.age.blank?)
      @user.sex = params[:sex] if (@user.sex.nil? or @user.sex.blank?)

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
