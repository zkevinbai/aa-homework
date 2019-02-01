class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :log_in_user!

    def current_user
        User.find_by(session_token: session[:session_token])
    end 

    def logged_in?
        user = current_user
        if user
            session[:session_token] == user.session_token
        else
            nil
        end
    end 

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
    end
end

