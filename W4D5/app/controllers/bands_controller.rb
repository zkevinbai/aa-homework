class BandsController < ApplicationController
    def index
        @bands = Band.all
    end 

    def create
        band = Band.new(band_params)
        # Fail
        if band.save
            redirect_to bands_url
        else
            flash.now[:error] = "That is an awful name for a band"
            redirect_to bands_url
        end
    end

    def new
        render :new
    end 

    def edit
        render :edit
    end 

    def show
        band = Band.find(params[:id])
    end

    def update
        band = Band.find(params[:id])
        
        if band
            band.update(band_params)
            redirect_to bands_url
        else
            flash.now[:error] = "Can't change what's not there"
        end
    end 

    def destroy
        band = Band.find_by(name: params[:band][:name])
        if band == nil
            flash.now[:error] = "That which is dead can never die"
            redirect_to bands_url 
        elsif band.destroy
            redirect_to bands_url
        end
    end 

    private

    def band_params
        params.require(:band).permit(:name)
    end
end
