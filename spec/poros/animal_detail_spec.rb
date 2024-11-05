require 'rails_helper'

RSpec.describe AnimalDetail do
  describe "initialize" do
    let(:animal_data) { JSON.parse(File.read('spec/fixtures/animal_fixtures/rabbit_animal_data.json'), symbolize_names: true) }
    let(:photo_data) { JSON.parse(File.read('spec/fixtures/animal_fixtures/rabbit_photo_data.json'), symbolize_names: true) }
    let(:animal) { AnimalDetail.new(animal_data, photo_data) }

    # binding.pry
    it 'initializes with name' do
      expect(animal.name).to eq("Rabbit")

    end

    it 'initializes with photo_url' do
      expect(animal.photo_url).to eq("www.pexels.com/photo/close-up-of-rabbit-on-field-247373/")
    end

    it 'initializes with characteristics' do
      expect(animal.prey).to eq("Clover, Grass, Crunchy vegetables")
      expect(animal.predators).to eq("Fox, wolf, owl")
      expect(animal.habitat).to eq("forest thickets, meadows and woodland")
      expect(animal.fun_fact).to eq("There are more than 50 different species!")
      expect(animal.top_speed).to eq("18 miles per hour")
      expect(animal.life_span).to eq("4-9 years")
      expect(animal.weight).to eq("0.5-3kg (1.1-6.6lbs)")
      expect(animal.diet).to eq("Herbivore")
      expect(animal.scientific_name).to eq("Oryctolagus cuniculus")
    end
  end

  describe "initialize with null values" do
    let(:animal_data) { JSON.parse(File.read('spec/fixtures/animal_fixtures/null_animal_data.json'), symbolize_names: true) }
    let(:photo_data) { JSON.parse(File.read('spec/fixtures/animal_fixtures/null_photo_data.json'), symbolize_names: true) }
    let(:animal) { AnimalDetail.new(animal_data, photo_data) }

    it 'assigns default values to characteristics' do
      expect(animal.predators).to eq("Human")
      expect(animal.habitat).to eq("Ask your parents!")
      expect(animal.fun_fact).to eq("Do not pet this animal in the wild!")
      expect(animal.top_speed).to eq("Ask your parents!")
      expect(animal.life_span).to eq("Ask your parents!")
      expect(animal.weight).to eq("Ask your parents!")
      expect(animal.diet).to eq("Ask your parents!")
      expect(animal.scientific_name).to eq("Ask your parents!")
    end
  end
end