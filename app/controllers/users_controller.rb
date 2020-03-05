class UsersController < ApplicationController
    # before_action :authenticate, only: :index

    def index
        @users = User.all

        render json: @users, include: [:frameworks, :languages] 
    end

    def create
        @user = User.create({
            username: params[:username],
            password: params[:password],
            name: params[:name],
            email: params[:email],
            campus: params[:campus],
            cohort: params[:cohort],
            linkedin: params[:linkedin],
            github: params[:github],
            blog: params[:blog],
            profile_pic: params[:profile_pic]
        })

        render json: @user 
    end

end
