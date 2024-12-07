class CreatePredatorPreyRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :predator_prey_relations do |t|
      t.integer :predator_id, null: false
      t.integer :prey_id, null: false

      t.timestamps
    end
    add_index :predator_prey_relations, [:predator_id, :prey_id], unique: true
    add_foreign_key :predator_prey_relations, :animals, column: :predator_id
    add_foreign_key :predator_prey_relations, :animals, column: :prey_id
  end
end
