class User < ApplicationRecord
  has_many :user_favorites
  has_many :favorite_animals, through: :user_favorites, source: :animal 
end
