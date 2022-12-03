class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Concerns::UserSession

  private
  def auth_user
    unless logged_in?
      flash[:notice] = "Please Login!"
      redirect_to root_path
    end
  end

end
