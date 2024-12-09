require 'rails_helper'

RSpec.describe ParkAnimal, type: :model do
  describe 'associations' do
    it { should belong_to(:park) }
    it { should belong_to(:animal)}
  end

  describe 'validations' do
    it { should validate_presence_of(:park_id) }
    it { should validate_presence_of(:animal_id) }    
  end
end
