class Animal < ApplicationRecord
  has_many :user_favorites
  has_many :users, through: :user_favorites

  validates :name, :photo_url, :prey, :predators, :habitat, :scientific_name, presence: true
end
