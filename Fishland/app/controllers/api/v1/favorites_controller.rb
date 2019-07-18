class Api::V1::FavoritesController < ApplicationController
    
    def index
        @favorites = current_user.Favorite.all
    end

    def create
        @favorite = current_user.favorites.build(favorite_params)
        if @favorite.valid?
            @favorite.save
        else
            render json: { message: 'Failed to create Favorite. Missing User_id or missing Fish_id'}
        end
    end

    def destroy
        @favorite = current_user.favorites.find(params[:id])
        @favorite.destroy
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :fish_id)
    end
end
