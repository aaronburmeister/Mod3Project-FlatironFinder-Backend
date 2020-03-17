class UsersController < ApplicationController
    before_action :authenticate, only: [:delete, :update]

    def index
        if params[:search] != nil
            if params[:filter] == "cohort"
                @users = User.where("cohort ILIKE ?", "%#{params[:search]}%").uniq
            elsif params[:filter] == "campus"
                @users = User.where("campus ILIKE ?", "%#{params[:search]}%").uniq
            elsif params[:filter] == "framework"
                # SELECT users.*, frameworks.name AS framework_name FROM users INNER JOIN user_frameworks ON user_frameworks.user_id = users.id INNER JOIN frameworks ON frameworks.id = user_frameworks.framework_id
                @users = User.joins(:frameworks).where("frameworks.name ILIKE '%#{params[:search]}%'").uniq
            elsif params[:filter] == "language"
                # SELECT users.*, languages.name AS language_name FROM users INNER JOIN user_languages ON user_languages.user_id = users.id INNER JOIN frameworks ON languages.id = user_languages.language_id
                @users = User.joins(:languages).where("languages.name ILIKE '%#{params[:search]}%'").uniq
            elsif params[:filter] == "name"
                @users = User.where("name ILIKE ?", "%#{params[:search]}%").uniq
            end
        else
            @users = User.all
        end

        render json: @users, include: [:frameworks, :languages] 
    end

    def show
        @user = User.find(params[:id])

        render json: @user, include: [:frameworks, :languages]
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            begin
                addTechnologies(framework_params, language_params)
            rescue
                begin
                    addTechnologies([], language_params)
                rescue
                    addTechnologies([], [])
                end
            end
            render json: @user , include: [:frameworks, :languages]
        else
            render json: { error: @user.errors.messages }
        end
    end

    def update
        @user = User.update(params[:id], user_params)

        if @user.valid?
            begin
                updateLanguages(language_params, @user)
            rescue
                updateLanguages([], @user)
            end

            begin
                updateFrameworks(framework_params, @user)
            rescue
                updateFrameworks([], @user)
            end

            render json: @user , include: [:frameworks, :languages]
        else
            render json: { error: @user.errors.messages }
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user2 = @user

        user_frameworks = UserFramework.where(user_id: params[:id])
        user_languages = UserLanguage.where(user_id: params[:id])
        user_frameworks.each{ |relationship| relationship.destroy}
        user_languages.each{ |relationship| relationship.destroy}
        # public_id = flatiron_finder_profile_pics/image_name
        public_id = @user.profile_pic.split('/')[7] + '/' + @user.profile_pic.split('/')[8].split('.')[0]
        Cloudinary::Uploader.destroy(public_id, options = { invalidate: true })
        @user.destroy

        render json: { user: @user2 }
    end

    private

    def updateFrameworks(new_frameworks, user)
        # Get list of frameworks known by user currently
        list_of_user_frameworks = UserFramework.where(user: user)
        framework_ids = list_of_user_frameworks.map { |relationship|
            relationship.framework_id
        }

        # Add frameworks if they don't already exist
        new_frameworks.each{ |id| 
            if !framework_ids.include?(id)
                newF = UserFramework.create(user: user, framework_id: id)
            end
        }

        # Remove framework if it isn't in the updated list
        framework_ids.each { |id|
            if !new_frameworks.include?(id)
                UserFramework.find_by(user: user, framework_id: id).destroy
            end
        }
    end

    def updateLanguages(new_languages, user)
        # Get list of languages known by user currently
        list_of_user_languages = UserLanguage.where(user: user)
        language_ids = list_of_user_languages.map { |relationship|
            relationship.language_id
        }

        # Add languages if they don't already exist
        new_languages.each{ |id| 
            if !language_ids.include?(id)
                newL = UserLanguage.create(user: user, language_id: id)
            end
        }

        # Remove language if it isn't in the updated list
        language_ids.each { |id|
            if !new_languages.include?(id)
                UserLanguage.find_by(user: user, language_id: id).destroy
            end
        }
    end

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
        addLanguages(user_languages)
        addFrameworks(user_frameworks)
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
