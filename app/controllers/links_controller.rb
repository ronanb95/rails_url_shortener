class LinksController < ApplicationController

    def create
        original_url = link_params[:original_url]
        shortener = Shortener.new(original_url)
        @link = shortener.generate_short_link
        
        if @link.persisted?
            respond_to :js
        else 
            render 'error.js.erb'
        end
    end


    private 

    def link_params
        #Require and permit here are being inheritted from the application controller
        params.require(:link).permit(:original_url)
    end

end