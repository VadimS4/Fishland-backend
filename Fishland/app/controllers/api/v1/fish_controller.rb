class Api::V1::FishController < ApplicationController
    # skip_before_action :authorized, only: [:index, :show]

    def index 
        all_fish = Fish.all
        render json: all_fish
    end

    def show
        fish = Fish.find(params[:id])
        render json: fish
    end
end
