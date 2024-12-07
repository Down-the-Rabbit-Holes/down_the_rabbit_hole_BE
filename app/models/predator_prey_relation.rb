class PredatorPreyRelation < ApplicationRecord
  belongs_to :predator, class_name: "Animal"
  belongs_to :prey, class_name: "Animal"

  validates :predator_id, :prey_id, presence: true
  validates :prey_id, uniqueness: { scope: :predator_id }
end
