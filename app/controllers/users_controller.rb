class UsersController < ApplicationController

    def create
        @user = User.create(
            username: "",
            password: "",
            name: "",
            email: "",
            campus: "",
            cohort: "",
            linkedin: "",
            github: "",
            blog: ""
        )

        render json: { @user, include: [:languages, :frameworks] }
    end

end
