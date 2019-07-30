class Api::V1::FavoritesController < ApplicationController
    
    def index
        favorites = current_user.Favorite.all
        render json: favorites
    end

    def create
        @favorite = Favorite.new(favorite_params)
        if @favorite.valid?
            @favorite.save
            render json: { favorite: FavoriteSerializer.new(@favorite) }, status: :created
        else
            render json: { message: "This favorite has already been created" }, status: 422
        end
    end

    def destroy
        @favorite = current_user.Favorite.find(params[:id])
        @favorite.destroy
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :fish_id)
    end
end
