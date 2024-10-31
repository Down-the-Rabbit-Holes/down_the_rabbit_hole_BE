class User < ApplicationRecord
  has_many :user_favorites
  has_many :animals, through: :user_favorites
end
