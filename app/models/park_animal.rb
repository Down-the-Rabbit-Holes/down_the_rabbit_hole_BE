class ParkAnimal < ApplicationRecord
  belongs_to :park
  belongs_to :animal
end
