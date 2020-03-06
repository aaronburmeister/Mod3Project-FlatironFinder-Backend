class LanguagesController < ApplicationController

    def show 
        @language = Language.find(params[:id])

        render json: @language
    end
end
