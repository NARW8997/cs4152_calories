module Concerns

  module UserSession
    def self.included base
      base.class_eval do
        helper_method :logged_in?
        helper_method :current_user
      end
    end

    def signin_user user
      session[:user_uid] = user.uid
    end

    def logout_user
      session[:user_uid] = nil
    end

    def logged_in?
      !!session[:user_uid]
    end


    def current_user
      if logged_in?
        @current_user ||= User.find_by(uid: session[:user_uid])
      else
        nil
      end
    end

  end


end