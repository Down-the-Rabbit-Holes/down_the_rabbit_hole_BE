class PredatorPreyRelation < ApplicationRecord
  belongs_to :predator, class_name: "Animal"
  belongs_to :prey, class_name: "Animal"
end
