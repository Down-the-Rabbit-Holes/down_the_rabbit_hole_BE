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
      # if user has a favorite animal- json render animal
  end
  # check for duplicates?
  # if user_favorite == favorite_animal && user?
    # render json: {message similar to FE duplicate message, status:????
  # else 
    # create the favorite and render success message similar to FE, status: :created
    
    # what is going to render? we need to render any animal that the user has.
    # if user_favorite.save? then were gonna 
  end
end