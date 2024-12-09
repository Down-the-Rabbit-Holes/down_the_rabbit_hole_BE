require 'rails_helper'

RSpec.describe PredatorPreyRelation, type: :model do
  describe 'associations' do
    it { should belong_to(:predator) }
    it { should belong_to(:prey) }
  end

  describe 'validations' do
    it { should validate_presence_of(:predator_id) }
    it { should validate_presence_of(:prey_id) }
  end
end
