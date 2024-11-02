class AddAttributesToAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :fun_fact, :string
    add_column :animals, :top_speed, :string
    add_column :animals, :life_span, :string
    add_column :animals, :weight, :string
    add_column :animals, :diet, :string
  end
end
