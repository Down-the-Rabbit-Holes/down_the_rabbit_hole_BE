class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :annual_visitors

      t.timestamps
    end
  end
end
