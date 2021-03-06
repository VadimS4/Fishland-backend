class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(name: params["user"]["name"].first, username: params["user"]["username"].first, password: params["user"]["password"].first)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: @user.errors }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
