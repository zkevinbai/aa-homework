class SessionsController < ApplicationController
    #login
    def new 
        render :new
    end

    def create
        user = User.find_by_credentials(params[:email],params[:password])

        if user
            session[:session_token] = user.reset_session_token!
            redirect_to user_url(user.id)
        else 
            flash[:error] = "Invalid Login Credentials"
            redirect_to new_session_url
        end 
    end 

    #logout
    def destroy
        user = current_user
        user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end 
end
