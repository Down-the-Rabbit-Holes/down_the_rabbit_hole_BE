require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'associations' do    
    it { should have_many(:user_favorites) }
    it { should have_many(:users).through(:user_favorites) }

    it { should have_many(:predator_relations).with_foreign_key(:prey_id).class_name('PredatorPreyRelation') }
    it { should have_many(:predators).through(:predator_relations).source(:predator) }

    it { should have_many(:prey_relations).with_foreign_key(:predator_id).class_name('PredatorPreyRelation') }
    it { should have_many(:prey).through(:prey_relations).source(:prey) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:photo_url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:group_name) }
    it { should validate_presence_of(:baby_name) }
    it { should validate_presence_of(:top_speed) }
    it { should validate_presence_of(:life_span) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:fun_fact) }
    it { should validate_presence_of(:animal_type) }
    it { should validate_presence_of(:diet) }
    it { should validate_presence_of(:habitat) }
    it { should validate_presence_of(:scientific_name) }
  end
end
