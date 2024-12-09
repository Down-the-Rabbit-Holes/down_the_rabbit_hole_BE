require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'associations' do
    it { should have_many(:park_animals) }
    it { should have_many(:animals).through(:park_animals) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:annual_visitors) }
  end
end
