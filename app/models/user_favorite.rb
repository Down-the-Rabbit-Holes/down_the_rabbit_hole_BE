class UserFavorite < ApplicationRecord
  belongs_to :users
  belongs_to :animal
end