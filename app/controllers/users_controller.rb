class UsersController < ApplicationController

    def index
        begin
            authenticate()

            @users = User.all

            render json: @users
        end
    end

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password],
            name: params[:name],
            email: params[:email],
            campus: params[:campus],
            cohort: params[:cohort],
            linkedin: params[:linkedin],
            github: params[:github],
            blog: params[:blog]
        )

        render json: { @user, include: [:languages, :frameworks] }
    end

end
