class Park < ApplicationRecord
    has_many :park_animals
    has_many :animals, through: :park_animals 
  
    validates :name, presence: true, uniqueness: true
    validates :location, :description, :annual_visitors, presence: true
end
