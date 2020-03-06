class UsersController < ApplicationController
    # before_action :authenticate, only: :index

    def index
        if params[:search] != nil
            if params[:filter] == "cohort"
                @users = User.where("cohort ILIKE ?", "%#{params[:search]}%")
            elsif params[:filter] == "campus"
                @users = User.where("campus ILIKE ?", "%#{params[:search]}%")
            elsif params[:filter] == "framework"
                # SELECT users.*, frameworks.name AS framework_name FROM users INNER JOIN user_frameworks ON user_frameworks.user_id = users.id INNER JOIN frameworks ON frameworks.id = user_frameworks.framework_id
                @users = User.joins(:user_frameworks).joins(:frameworks).where("frameworks.name ILIKE '%#{params[:search]}%'")
            elsif params[:filter] == "language"
                # SELECT users.*, languages.name AS language_name FROM users INNER JOIN user_languages ON user_languages.user_id = users.id INNER JOIN frameworks ON languages.id = user_languages.language_id
                @users = User.joins(:user_languages).joins(:languages).where("languages.name ILIKE '%#{params[:search]}%'")
            elsif params[:filter] == "name"
                @users = User.where("name ILIKE ?", "%#{params[:search]}%")
            end
        else
            @users = User.all
        end

        render json: @users, include: [:frameworks, :languages] 
    end

    def show
        @user = User.find(params[:id])

        render json: { user: @user }
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
            :id,
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
