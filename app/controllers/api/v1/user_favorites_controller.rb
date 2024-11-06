require 'active_support/inflector'

class Api::V1::UserFavoritesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    favorited_animals = user.animals
    if favorited_animals.empty?
      render json: { error: "No favorites yet" }, status: :not_found
    else
      render json: favorited_animals, status: :ok
    end
    
  end

  def create
    user = User.find(params[:user_id])
    favorite_animal = Animal.find(params[:animal_id])
    
    user_favorite = UserFavorite.new(user_id: user.id, animal_id: favorite_animal.id)
    
    if user_favorite.save
      render json: favorite_animal, status: :created
    else
      render json: { error: "Unable to save favorite" }, status: :unprocessable_entity
    end
  end

  def destroy
    user_favorite = UserFavorite.find_by(user_id: user.id, animal_id: animal.id)

    if user_favorite
      user_favorite.destroy
      render json: { message: "Favorite removed" }, status: :ok
    else
      render json: { error: "Favorite not found" }, status: :not_found
    end
end

