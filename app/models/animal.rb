class Animal < ApplicationRecord
  has_many :user_favorites
  has_many :users, through: :user_favorites

  has_many :predator_relationships, class_name: "PredatorPreyRelation", foreign_key: :prey_id
  has_many :predators, through: :predator_relationships, source: :predator

  has_many :prey_relationships, class_name: "PredatorPreyRelation", foreign_key: :predator_id
  has_many :prey, through: :prey_relationships, source: :prey
  
  validates :name, uniqueness: true
  validates :name,
            :photo_url, 
            :habitat, 
            :scientific_name, 
            :diet,
            :top_speed,
            :life_span,
            :weight,
            :fun_fact,
            presence: true
end

