class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :photo_url
      t.string :prey
      t.string :predators
      t.string :habitat
      t.string :scientific_name

      t.timestamps
    end
  end
end
