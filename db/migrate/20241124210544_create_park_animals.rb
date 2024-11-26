class CreateParkAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :park_animals do |t|
      t.references :park, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
