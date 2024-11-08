require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:user_favorites) }
    it { should have_many(:animals).through(:user_favorites)}
  end
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end