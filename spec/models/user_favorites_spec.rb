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
    let(:animal) { Animal.create!(
      name: "animal",
      photo_url: "http://example.com/rabbit.jpg",
      habitat: "forest",
      scientific_name: "Oryctolagus cuniculus",
      fun_fact: "Rabbits have 360-degree vision.",
      top_speed: "45 km/h",
      life_span: "9 years",
      weight: "2 kg",
      diet: "herbivore",
      description: "This is a rabbit",
      group_name: "Group of rabbits",
      baby_name: "bunny",
      height: "small",
      length: "also small",
      animal_type: "rabbit") } 

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