require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'associations' do    
    it { should have_many(:user_favorites) }
    it { should have_many(:users).through(:user_favorites) }
  end
end
