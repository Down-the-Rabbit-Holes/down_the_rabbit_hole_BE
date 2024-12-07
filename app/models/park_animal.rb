class ParkAnimal < ApplicationRecord

  belongs_to :park
  belongs_to :animal
  
  validates :park_id, :animal_id, presence: true
  validates :animal_id, uniqueness: { scope: :park_id }
end
