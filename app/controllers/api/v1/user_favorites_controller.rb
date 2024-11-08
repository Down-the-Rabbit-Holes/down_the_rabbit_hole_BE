require 'active_support/inflector'

class Api::V1::UserFavoritesController < ApplicationController
  before_action :set_user
  before_action :set_animal, only: [:create, :destroy]

  def index
    favorited_animals = @user.animals
    if favorited_animals.empty?
      render json: { error: "No favorites yet" }, status: :not_found
    else
      render json: favorited_animals, status: :ok
    end
  end

  def create
    user_favorite = UserFavorite.new(user_id: @user.id, animal_id: @animal.id)
    
    if user_favorite.save
      render json: @animal, status: :created
    else
      render json: { error: "Unable to save favorite" }, status: :unprocessable_entity
    end
  end

  def destroy
    user_favorite = UserFavorite.find_by(user_id: @user.id, animal_id: @animal.id)

    if user_favorite
      user_favorite.destroy!
      render json: { message: "Favorite removed" }, status: :ok
    else
      render json: { error: "Favorite not found" }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

end

