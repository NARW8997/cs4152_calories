class UsersController < ApplicationController
  before_filter :auth_user, only: [:edit, :update, :destroy]
  def new
    @user = User.new
  end

  # register new user
  def create
    @user = User.new(params.require(:user).permit(:username, :password, :first_name, :last_name,
                                                  :email, :weight, :height, :age, :sex))

    if params[:user][:password].length < 6
      flash[:notice] = "Please make sure your password at least 6 characters long!"
      render action: :new
    elsif params[:user][:password] != params[:confirmPW][:confirmPW]
      flash[:notice] = "Please make sure you confirm password match your password!"
      render action: :new
    elsif User.exists? :username => params[:user][:username]
      flash[:notice] = "Username already existed!"
      render action: :new
    elsif @user.save
      flash[:notice] = "Registered successfully!"
      session[:user_uid] = @user.uid
      redirect_to welcome_new_index_path
    else
      flash[:notice] = "Register failed!"
      render action: :new
    end
  end

  def edit
    @user = User.find(session[:user_uid])
  end

  def update
    @user = User.find_by(uid: session[:user_uid])
    @user.first_name = params[:user][:first_name] unless (params[:user][:first_name].nil? or params[:user][:first_name].blank?)
    @user.last_name = params[:user][:last_name] unless (params[:user][:last_name].nil? or params[:user][:last_name].blank?)
    @user.email = params[:user][:email] unless (params[:user][:email].nil? or params[:user][:email].blank?)
    @user.weight = params[:user][:weight] unless (params[:user][:weight].nil? or params[:user][:weight].blank?)
    @user.height = params[:user][:height] unless (params[:user][:height].nil? or params[:user][:height].blank?)
    @user.age = params[:user][:age] unless (params[:user][:age].nil? or params[:user][:age].blank?)
    @user.sex = params[:user][:sex] unless (params[:user][:sex].nil? or params[:user][:sex].blank?)
    @user.goal_weight = params[:user][:goal_weight] unless (params[:user][:goal_weight].nil? or params[:user][:goal_weight].blank?)
    @user.days = params[:user][:days] unless (params[:user][:days].nil? or params[:user][:days].blank?)
    @user.user_type = params[:user][:user_type] unless (params[:user][:user_type].nil? or params[:user][:user_type].blank?)
    if @user.save
      @user.calculate uid: session[:user_uid]
      flash[:notice] = "You have changed your profiles!"
      redirect_to welcome_index_path
      return
    end
  end

  def destroy
    @user = User.find_by(uid: session[:user_uid])
    @user.destroy
    session[:user_uid] = nil
    flash[:notice] = "You have been Deleted your account!"
    redirect_to root_path
  end

end
