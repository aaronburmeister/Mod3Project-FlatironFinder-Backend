class UsersController < ApplicationController
    # before_action :authenticate, only: :index

    def index
        @users = User.all

        render json: @users, include: [:frameworks, :languages] 
    end

    def create

        @user = User.new(user_params)

        if @user.valid?
            @user.save
            addTechnologies(framework_params, language_params)
            render json: @user , include: [:frameworks, :languages]
        else
            render json: { error: @user.errors.messages }
        end
    end

    private

    def addFrameworks(user_frameworks)
        user_frameworks.each{ |framework_id|
            UserFramework.create(user: @user, framework_id: framework_id)
        }
    end

    def addLanguages(user_languages)
        user_languages.each{|language_id| 
            UserLanguage.create(user: @user, language_id: language_id)
        }
    end

    def addTechnologies(user_frameworks, user_languages)
        addFrameworks(user_frameworks)
        addLanguages(user_languages)
    end


    def user_params
        params.require(:user).permit(
            :username,
            :password,
            :name,
            :email,
            :campus,
            :cohort,
            :linkedin,
            :github,
            :blog,
            :profile_pic,
        )
    end

    def framework_params
        params.require(:frameworks)
    end

    def language_params
        params.require(:languages)
    end

end
