class TechnologiesController < ApplicationController

    def index
        @frameworks = Framework.all
        @languages = Language.all

        render json: { frameworks: @frameworks, languages: @languages }
    end

end
