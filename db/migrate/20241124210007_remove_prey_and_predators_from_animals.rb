class RemovePreyAndPredatorsFromAnimals < ActiveRecord::Migration[7.1]
  def change
    remove_column :animals, :prey, :string
    remove_column :animals, :predators, :string
  end
end
