class ParkAnimal < ApplicationRecord
  belongs_to :park
  belongs_to :animal

  has_many :park_animals
  has_many :animals, through: :park_animals
  
  validates :park_id, :animal_id, presence: true
  validates :animal_id, uniqueness: { scope: :park_id }
end
