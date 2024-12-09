class Animal < ApplicationRecord
  has_many :user_favorites
  has_many :users, through: :user_favorites

  has_many :predator_relations, class_name: "PredatorPreyRelation", foreign_key: :prey_id
  has_many :predators, through: :predator_relations, source: :predator

  has_many :prey_relations, class_name: "PredatorPreyRelation", foreign_key: :predator_id
  has_many :prey, through: :prey_relations, source: :prey

  has_many :park_animals
  has_many :parks, through: :park_animals
  
  validates :name, presence: true, uniqueness: true
  validates :scientific_name,
            :photo_url,
            :description,
            :group_name,
            :baby_name,
            :top_speed,
            :life_span,
            :weight,
            :height,
            :length,
            :habitat, 
            :fun_fact,
            :animal_type,
            :diet,
            presence: true
end
