require 'rails_helper'

RSpec.describe UserFavorite, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:animal) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:animal_id) }
    
    let(:user) { User.create!(name: 'Test User') } 
    let(:animal) { Animal.create!(name: 'Test Animal',
                                  photo_url: "www.pexels.com/photo/two-playful-coyotes-27067820/",
                                  prey: "Rabbit, Mice, Deer",
                                  predators: "Human, Bears, Wolves, Great horned owls, Bald Eagles",
                                  habitat: "Forests, plains and deserts",
                                  scientific_name: "Canis latrans",
                                  fun_fact: "Also known as the Prairie Wolf!",
                                  top_speed: "40 miles per hour",
                                  life_span: "10 - 15 years",
                                  weight: "7kg - 21kg (15lbs - 46lbs)",
                                  diet: "Carnivore") } 

    subject { UserFavorite.new(user: user, animal: animal) }
  
    it { should validate_uniqueness_of(:animal_id).scoped_to(:user_id) }
  end

  describe 'duplicate favorite validation' do
    it 'should not allow duplicate animal ids for a user id' do
      UserFavorite.create(user_id: 1, animal_id: 1)
      duplicate_favorite = UserFavorite.create(user_id: 1, animal_id: 1)

      expect(duplicate_favorite).to_not be_valid
    end
  end
end