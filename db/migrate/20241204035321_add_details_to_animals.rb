class AddDetailsToAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :description, :text
    add_column :animals, :group_name, :string
    add_column :animals, :baby_name, :string
    add_column :animals, :height, :string
    add_column :animals, :length, :string
  end
end
