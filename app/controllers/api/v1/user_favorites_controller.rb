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
    
    user_favorite = UserFavorite.new(user_id: :user.id, animal_id: :favortie_animal.id)
    
    if user_favorite.save
      render json: favorite_animal, status: :created
    else
      render json: { error: "test" }, status: :unprocessable_entity
    end
  end
end

