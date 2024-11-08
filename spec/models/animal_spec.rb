require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'associations' do    
    it { should have_many(:user_favorites) }
    it { should have_many(:users).through(:user_favorites) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:photo_url) }
    it { should validate_presence_of(:prey) }
    it { should validate_presence_of(:predators) }
    it { should validate_presence_of(:habitat) }
    it { should validate_presence_of(:scientific_name) }
  end

  describe 'Animal methods' do
    before(:each) do
      @test_animal_1 = Animal.create!(
        name: "test_1",
        photo_url: "https://images.pexels.com/photos/53001/TEST",
        prey: "Deer, Elk, Beavers",
        predators: "test_2, test_3",
        habitat: "Forest and mountainous regions",
        scientific_name: "Felis Concolor",
        fun_fact: "Has no real natural predators!",
        top_speed: "30 mph",
        life_span: "10-20 years",
        weight: "29-90kg (64-198lbs)",
        diet: "Carnivore"
      )

      @test_animal_2 = Animal.create!(
        name: "test_2",
        photo_url: "https://images.pexels.com/photos/TEST",
        prey: "Rats, Mice, Baby birds, Eggs",
        predators: "Hawks, Eagles, Foxes, other snakes, Coyotes, Bobcats",
        habitat: "Forested areas, fields, swamps, hardwood hammocks, neighborhoods bordering habitat",
        scientific_name: "P. guttatus",
        fun_fact: "Corn snakes have scales on their backs that help them camouflage in leaf litter.",
        top_speed: "18 mph",
        life_span: "15 years in captivity, less in the wild",
        weight: "29-90kg (64-198lbs)",
        diet: "Carnivore"
      )

      @test_animal_3 = Animal.create!(
        name: "test_3",
        photo_url: "https://images.pexels.com/photos/TEST",
        prey: "not the above two ones thats for sure",
        predators: "nothing",
        habitat: "Forests, especially old growth forests near bodies of water, wooded swamps",
        scientific_name: "Strix varia",
        fun_fact: "Barred owls are active during the day, which is unusual for owls.",
        top_speed: "30 mph",
        life_span: "18 years",
        weight: "Males weigh 1 to 1.8 pounds, females weigh about 1.8 to 2 pounds",
        diet: "Carnivore"
        )
    end

    it '#predators_with_data gets called on an animal to return its predators' do
    
      result = @test_animal_1.predators_with_data

      expect(result).to be_an(Array)
      expect(result).to eq([@test_animal_2, @test_animal_3])

      no_preds = @test_animal_3.predators_with_data

      expect(no_preds).to be_an(Array)
      expect(no_preds).to eq([])
    end

    it '#self.find_animal finds an animal & returns it as an object' do

      result = Animal.find_animal(name: "TeSt_1")

      expect(result).to be_an(Animal)
      expect(result).to eq(@test_animal_1)
    end

    it '#def self.format_predators arrays & formats an animals predators' do

      before_method = @test_animal_2.predators

      expect(before_method).to eq("Hawks, Eagles, Foxes, other snakes, Coyotes, Bobcats")

      after_method = Animal.format_predators(@test_animal_2)

      expect(after_method).to eq(["Hawk", "Eagle", "Fox", "other snake", "Coyote", "Bobcat"])
    end

    it '#self.handle_predator_creation creates new animals unless it exists' do

      Animal.handle_predator_creation(@test_animal_2)
      
      new_animal = Animal.find_by(name: "Ferruginous Hawk")
      expect(new_animal).not_to be_nil
      expect(new_animal.name).to eq("Ferruginous Hawk")
    end

    it '#self.handle_predator_creation returns current animals predators' do

      current_animal = Animal.handle_predator_creation(@test_animal_1)

      expect(current_animal).to eq(["test_2", "test_3"])
    end
  end
end