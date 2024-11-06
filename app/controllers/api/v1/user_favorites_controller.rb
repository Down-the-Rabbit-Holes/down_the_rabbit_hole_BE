require 'active_support/inflector'

class Api::V1::UserFavoritesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    favorited_animals = user.animals

    render json: favorited_animals, status: :ok
  end

  def create
    user = User.find(params[:user_id])
    favorite_animal = Animal.find(params[:animal_id])
    
    user_favorite = UserFavorite.new(user_id: params[:user_id], animal_id: params[:animal_id])
    
    if user_favorite.save
      render json: favorite_animal, status: :created
    else
      render json: { error: "test" }, status: :unprocessable_entity
    end
  end
end

