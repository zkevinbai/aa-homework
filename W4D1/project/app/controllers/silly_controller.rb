class SillyController < ApplicationController
    skip_before_action :verify_authenticity_token

    def fun
        render json: params
        # render plain: params[:message].inspect
    end

    def time
        render json: params
    end

    def super
        render json: params
    end 
end 