class UserFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :user_id, :animal_id, presence: true
  validates :animal_id, uniqueness: { scope: :user_id }
end
