class ApplicationController < ActionController::API

    def authenticate
        auth_header = request.headers['Authorization']

        if !auth_header
            render json: { message: "You must be logged in to access this" }, status: :unauthorized
        else
            token = auth_header.split(' ')[1]
            secret = Rails.application.secret_key_base
            begin
                payload = JWT.decode(token, secret)[0]

                @user = User.find(payload['id'])
            rescue
                render json: { message: "Authentication Failure" }, status: :unauthorized
            end
        end
    end

end
