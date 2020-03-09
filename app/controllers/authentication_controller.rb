class AuthenticationController < ApplicationController

    def login
        @user = User.find_by(username: params[:username])

        if !@user
            render json: { message: "Username Not Found" }, status: :unauthorized
        else
            if !@user.authenticate(params[:password])
                render json: { message: "Incorrect Password" }, status: :unauthorized
            else
                user = { id: @user.id, name: @user.username}
                secret = Rails.application.secrets.secret_key_base
                token = JWT.encode(user, secret)
                render json: {token: token}
            end
        end
    end

end
