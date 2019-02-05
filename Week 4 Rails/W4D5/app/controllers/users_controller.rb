class UsersController < ApplicationController
    def new 
        user = User.new
        render :new
    end

    def create
        # render json: user_params

        user = User.new(user_params)

        if user.save
            log_in_user!(user)
            redirect_to bands_url
        else
            flash[:error] = "Password must be 3 characters or longer"
            redirect_to new_user_url
        end 
    end 

    def destroy
        user = user.find_by(email: user_params[:user][:email])
        user.destroy
    end 
    
    def show
        redirect_to bands_url
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
