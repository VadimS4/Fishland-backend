class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(user_login_params)
        if @user && @user.authenticate( user_login_params[:password] )
            token = encode_token( { user_id: @user_id } )
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
            render json: { message: 'Invalid username or password'}
    end
end
