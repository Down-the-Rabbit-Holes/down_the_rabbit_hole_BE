require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'associations' do    
    it { should have_many(:user_favorites) }
    it { should have_many(:users).through(:user_favorites) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:photo_url) }
    it { should validate_presence_of(:prey) }
    it { should validate_presence_of(:predators) }
    it { should validate_presence_of(:habitat) }
    it { should validate_presence_of(:scientific_name) }
  end
end
