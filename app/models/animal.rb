class Animal < ApplicationRecord
  has_many :user_favorite
  has_many :users, through: :user_favorite
end
